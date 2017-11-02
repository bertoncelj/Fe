clear all; close all;

#Program display Im vs Re components and grpah them
 
R = 0 : 1 : 1000;
C = 1/1000000;
L = 1/100;

Wn = 1/sqrt(L*C);
zeta = R/2 * sqrt(C/L);

s1 = Wn * (-zeta + sqrt(zeta.^2 -1));
s2 = Wn * (-zeta - sqrt(zeta.^2 -1));

plot(real(s1), imag(s1), 'r', real(s2), imag(s2), 'g');

