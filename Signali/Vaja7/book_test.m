clear all; close all;

w = logspace(-2,3); 
A0 = 1; 
wm = 50;
#zapisemo ulomek
num = [A0*wm];
den = [1 wm];
#naredimo system matriko
sys = tf(num, den);

#pretvori v bode
[mag, phase] = bode(sys, w);
dbmag = 20*log10(mag);

fig1 = figure(1);
set(fig1,'Units','centimeters','Position',[5 2 20 18]);
subplot(2,1,1);
 semilogx(w, dbmag, 'g--', 'LineWidth', 2); hold on;
 semilogx([1e-2 1e0], [0 0], 'r--', [1e0 1e2], [0 -40], 'r--');
 axis([1e-2 1e3 -40 0]);
 xlabel('frekvenca {\itw} [rad/s]'); ylabel('{\itM} [dB]');
 grid on; title('Amplitudna karakteristika');
subplot(2,1,2);
 semilogx(w, phase, 'g--', 'LineWidth', 2); hold on;
 semilogx([1e-2 1e-1], [0 0], 'r--', [1e-1 1e1], ...
 [0 -90], 'r--', [1e1 1e2], [-90 -90], 'r--');
 axis([1e-2 1e3 -91 0]);
 xlabel('frekvenca {\itw} [rad/s]'); ylabel('{\itfi} [^o]');
 grid on; title('Fazna karakteristika') 