% Fourierova analiza: Odziv vezja RC na PERIODIČNE PRAVOKOTNE PULZE
clear all; close all;
A = 1;                  % amplituda pulzov
T = 2*pi;               % osnovna perioda
w0 = 2*pi/T;            % osnovna frekvenca
tpz = 0;                % začetek obravnavanega pulza
tpk = tpz + T;          % konec obravnavanega pulza
tz = -1; tk = 2; dt = 0.001;
t = tz : dt : tk;       % časovni vektor
[N, M] = size(t);
 if N < M,
 t = t';
 end
nk = 30;
% definiranje idealnega poteka obravnavanega pulza
t1 = tz : dt : tz+T; xp1   = A / T *(t1 + T);
t2 = tz+T : dt : tz+2*T; xp2   = A / T * t2;
t3 = tz+2*T : dt : tz+3*T; xp3 = A / T * (t3 - T);

#test koda
 t = [t1 t2 t3 ];
 x = [xp1 xp2 xp3];
fig1 = figure(4);
    plot(t, x, 'LineWidth', 2);
pause(4);

% časovni in signalni vektor idealnega pulza
tpp = [t1 t2 t3]; xpp = [xp1 xp2 xp3];
a0 = A * (tpk - tpz) / T; % koeficient a0 = c0
a0t = ones(size(t))*a0;
C = 1; R = 1; % elementi vezja
H0 = 1; % vrednost prevajalne funkcije pri n = 0 oz. w = 0

h = exp(-t); % odziv sistema na enotin impulz
X = fft(x)/N; % Fourierov transform vhodnega signala
H = fft(h)/N; % Fourierov transform impulznega odziva
Y = H.*X; % konvolucija
y = real(ifft(Y)*N*T);


% Grafični prikaz rezultatov

#------------plot 1----------------
fig1 = figure(1);
set(fig1, 'Units', 'centimeters', 'Position', [1 2 15.5 14]);
k = [0:N/2-1]';

subplot(3,1,1);
p = plot(t,x,'b'); set(p, 'LineWidth',0.5); grid on; axis('equal');
%axis([0 8 -0.1 1.1]);
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 9);
xlabel('čas t [s]'); ylabel('x(t)'); title('Vzbujanje');

subplot(3,1,2);
p = stem(k, abs(X(1:N/2)),'k');
set(p, 'LineWidth',0.5,'MarkerSize',2, 'MarkerFaceColor','r'); grid on;
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 9);
xlabel('vzorci, n'); ylabel('|X_n|');
title('Diskretni spekter amplitudne gostote vzbujanja');

subplot(3,1,3);
p = stem(k, angle(X(1:N/2))*180/pi,'k');
set(p, 'Linewidth',0.5,'MarkerSize',2, 'MarkerFaceColor','g'); grid on;
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 9);
xlabel('vzorci, n'); ylabel('faza X_n [°]');
title('Diskretni fazni spekter'); 

#---------plot 2-------------------------
fig2 = figure(2);
set(fig2, 'Units', 'centimeters', 'Position', [17.5 2 15.5 14]);

subplot(3,1,1);
p = stem(k, H(1:N/2), 'ko');
set(p, 'LineWidth',0.5, 'MarkerSize',2, 'MarkerFaceColor','r');
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 9);
xlabel('vzorci, n'); ylabel('|H_n|'); grid on;
title('Diskretni spekter prevajalne funkcije');

subplot(3,1,2);
p = stem(k, angle(H(1:N/2))*180/pi,'k');
set(p, 'Linewidth',0.5,'MarkerSize',2, 'MarkerFaceColor','g'); grid on;
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 9);
xlabel('vzorci, n'); ylabel('faza H_n [°]');
title('Diskretni fazni spekter');

subplot(3,1,3);
plot(t, x, t, h, t, y);
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 9);
xlabel('čas t [s]'); ylabel('x(t), h(t), y(t)'); grid on;
title('Vzbujanje, impulzni odziv, odziv'); 