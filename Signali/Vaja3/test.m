clear all; close all;
tz = 0; tk = 10; dt = 0.001; t = tz:dt:tk; % časovni vektor
R = 1; C = 1; % vrednosti elementov
a1 = 1; a0 = 1/(R*C); b0 = 1/(R*C); % koeficienti DE
h = b0/a1*exp(-a0/a1*t); % impulzni odziv
vg1 = ones(size(t)); vg2 = sin(t); % vhodni signal
% izračun konvolucijskega integrala
vizh1 = dt * conv(h, vg1); vizh2 = dt * conv(h, vg2);
% izris slike
plot(t, vizh1(1:(tk/dt+1)), 'r', t, vizh2(1:(tk/dt+1)), 'b');
axis([tz tk -1.1 1.1]);
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 12);
xlabel('čas {\itt} [s]');
ylabel('izhodna napetost {\itv_{izh}}({\itt}) [V]');
title('Odziv RC vezja na enotino stopnico in sinusni signal'); grid on; 