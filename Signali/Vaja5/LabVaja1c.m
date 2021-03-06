% Diskretna Fourierova transformacija: Računanje odziva s FFT in IFFT
clear all; close all;
N = 128; T0 = 2*pi; T = T0; Ts = T/N;
n = [0 : N-1]'; t = n * Ts;


t1 = 0 : Ts : 21*Ts; xp1 = ones(size(t1));
t2 = 21*Ts : Ts : 5*N/6*Ts; xp2 = zeros(size(t2));
t3 = 5*N/6*Ts : Ts : T; xp3 = zeros(size(t3));

a2 = 1;
a1 = 1;
a0 = 1;
b0 = 2;
b1 = 0;


s1 = -(a1/(2*a2) + sqrt((a1/(2*a2))^2 - (a0/a2)))
s2 = -(a1/(2*a2) - sqrt((a1/(2*a2))^2 - (a0/a2)))

hv = 1/a2/(s1-s2) * (exp(s1*t) - exp(s2*t));
dhv = 1/a2/(s1-s2) * (s1*exp(s1*t) - s2*exp(s2*t));

h = b1*dhv + b0*hv;

% t = [t1 t2 t3]; x = [xp1 xp2 xp3]; % pravokotni pulz
x = cos(2*t)+0.3*cos(20*t); % sestavljeni signal
h = exp(-t); % odziv sistema na enotin impulz
X = fft(x)/N; % Fourierov transform vhodnega signala
H = fft(h)/N; % Fourierov transform impulznega odziva
Y = H.*X; % konvolucija
y = real(ifft(Y)*N*T); % inverzni Fourierov transform


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