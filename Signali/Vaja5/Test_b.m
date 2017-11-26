% Fourierova analiza: Odziv vezja RC na PERIODIČNE PRAVOKOTNE PULZE
clear all; close all;
A = 1; % amplituda pulzov
T = 2*pi; % osnovna perioda
w0 = 2*pi/T; % osnovna frekvenca
tpz = 0; % začetek obravnavanega pulza
tpk = T/6; % konec obravnavanega pulza
tz = -1; tk = 3*pi; dt = 0.001;
t = tz : dt : tk; % časovni vektor
[N, M] = size(t);
 if N < M,
 t = t';
 end
nk = 30;
% definiranje idealnega poteka obravnavanega pulza
t1 = tz : dt : tpz; xp1 = zeros(size(t1));
t2 = tpz : dt : tpk; xp2 = ones(size(t2))*A;
t3 = tpk : dt : tpz+T; xp3 = zeros(size(t3));
t4 = tpz+T : dt : tpk+T; xp4 = ones(size(t4))*A;
t5 = tpk+T : dt : tk; xp5 = zeros(size(t5));

% časovni in signalni vektor idealnega pulza
tpp = [t1 t2 t3 t4 t5]; xpp = [xp1 xp2 xp3 xp4 xp5];
a0 = A * (tpk - tpz) / T; % koeficient a0 = c0
a0t = ones(size(t))*a0;
C = 1; R = 1; % elementi vezja
H0 = 1; % vrednost prevajalne funkcije pri n = 0 oz. w = 0
for n = 1 : 1 : nk

% trigonometrična vrsta
an = A/(n*pi)*(sin(n*w0*tpk)-sin(n*w0*tpz)); % koeficienti an
bn = A/(n*pi)*(-cos(n*w0*tpk)+cos(n*w0*tpz)); % koeficienti bn
 xn(:,n) = an * cos(n*w0*t) + bn * sin(n*w0*t);
 if n == 1
 xp(:,n) = a0 + xn(:,n);
 else
 xp(:,n) = xp(:,n-1) + xn(:,n);
 end
 
 
% koeficienti cosinusne vrste
cn(n) = sqrt(an^2 + bn^2); % komponente amplitudnega spektra
fin(n) = -atan(bn/an); % komponente faznega spektra
 if (an<0) && (bn<0)
 fin(n) = fin(n) + pi;
 elseif (an<0) && (bn>0)
 fin(n) = fin(n) - pi;
 end
 
 
% izračun odziva RC člena
Hn = 1/(1+j*n*w0*R*C);
Hnabs = abs(Hn); Hntheta = angle(Hn);
vizhn(:,n) = Hnabs*cn(n)*cos(n*w0*t+fin(n)+Hntheta);
 if n == 1
 vizh(:,n) = H0*a0 + vizhn(:,n);
 else
 vizh(:,n) = vizh(:,n-1) + vizhn(:,n);
 end
end


fig1 = figure(1);
set(fig1, 'Units', 'centimeters', 'Position', [2 1.5 30 15]);
plot(tpp,xpp,'r', t, xp(:,nk),'g',t,vizh(:,nk),'k'); hold off;
axis([tz tk -0.2 A+0.2])
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 10);
xlabel('čas t [s]'); ylabel('x(t), viz(t)');
title('Pulzno vzbujanje in odziv RC člena'); grid on;
pause(1)

w = [0 : nk] * w0; % izračun frekvenc komponent spektra

fig2 = figure(2);
set(fig2, 'Units', 'centimeters', 'Position', [1 2 15.5 14]);
subplot(2,1,1)
stem(w, [a0 cn], 'ko', 'MarkerFaceColor', 'r')
axis([0 nk*w0 -0.1 0.4])
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 10);
xlabel('frekvenca w [rad/s]'); ylabel('abs(cn)');
title('Amplitudni spekter periodičnih pravokotnih pulzov'); grid on;

subplot(2,1,2)
stem(w, [0 fin], 'ko', 'MarkerFaceColor', 'r')
axis([0 nk*w0 -pi pi])
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 10);
xlabel('frekvenca w [rad/s]'); ylabel('fi(w) [rad]');
title('Fazni spekter periodičnih pravokotnih pulzov'); grid on;
pause(2)

fig3 = figure(3);

set(fig3, 'Units', 'centimeters', 'Position', [17.5 2 15.5 14]);
subplot(2,1,1)
stem(w, [H0*a0 Hnabs*cn], 'ko', 'MarkerFaceColor', 'r')
axis([0 nk*w0 -0.01 0.05])
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 10); 

xlabel('frekvenca w [rad/s]'); ylabel('abs(vizhn)');
title('Amplitudni spekter odziva'); grid on;

subplot(2,1,2)
stem(w, [0 fin+Hntheta], 'ko', 'MarkerFaceColor', 'r')
axis([0 nk*w0 -pi-1 1])
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 10);
xlabel('frekvenca w [rad/s]'); ylabel('fi(w)+theta(w) [rad]');
title('Fazni spekter odziva'); grid on; 
pause(3)