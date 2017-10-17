% 1.D) Eksponento upadajoci Cos in tau = 2s
clear all; close all;

tz = -0.5; tk = 4; dt = 0.025; % podatki o casovni skali, casovni inkrement
t = tz : dt: tk
A = 2.5;  T = 2.0; T1 = 2; phi = pi/3;      %podaki o signalu
f1 = A * cos(2*pi/T*t + phi).*exp(-t/T1);   %signal
f2 = A * exp(-t/T1); f3 = -A * exp(-t/T1);  %ovojnica signala

%Izris slike
plot(t, f1, 'k', t, f2, 'g', t, f3, 'g', 'LineWidth', 1.5);
axis([tz tk -6 6]);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
grid;
xlabel('cas {\itt} [s]');
ylabel('f(t) = A*cos(wt + phi)*exp(-t/T1)');
title('Duseni sinusni signal');
