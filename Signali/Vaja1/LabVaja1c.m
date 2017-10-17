%1.C) Cos signal z amp = 2,5 periodo T = 2, fazni phi = Pi/3
clear all; close all;

tz = -0.5; tk = 4; dt = 0.025; % podatki o casovni skali, casovni inkrement
t = tz : dt: tk;
A = 2.5;  T = 2.0;  phi = pi/3;    %podaki o signalu
f1 = A * cos(2*pi/T*t + phi);   %signal


%Izris slike

plot(t, f1, 'r', 'LineWidth', 1.5);
axis([tz tk -6 6]);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
grid;
xlabel('cas {\itt} [s]');
ylabel('f(t) = A*cos(wt + phi)');
title('Duseni sinusni signal');