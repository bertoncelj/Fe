numer = 0.1*conv([(1./9600)^2 0 1.1716], [(1./9600)^2 0 6.8283]);
denom=conv([1/9600^2 1.8502/9600 1.2209],[1/9600^2 .41128/9600 .65519]);
sys = tf(numer,denom);
f = logspace(2, 5, 200); % 200 pt f vector from 100 Hz (10^2) to 10kHz (10^5)
[mag, phase] = bode(sys,2*pi*f); % Use bode to determine mag and phase
subplot(2,1,1);
semilogx(f, 20*log10(abs(mag)));
subplot(2,1,2);
semilogx(f, phase);