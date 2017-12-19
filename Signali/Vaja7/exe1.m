
numer = 0.1*conv([(1./9600)^2 0 1.1716], [(1./9600)^2 0 6.8283]);

denom=conv([1/9600^2 1.8502/9600 1.2209],[1/9600^2 0.41128/9600 0.65519]);

sys = tf(numer,denom);

w = logspace(3, 6, 200); % 200 pt w vector from 1krad/s (10^3) to 1Mrad/s (10^6)

bode(sys, w);