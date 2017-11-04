clear all; close all;
t = 0:0.0005:12;
dt=0.0005; tz=0; tk=12;
R1 = 2; R2 = 1; C = 1; L = 1;
a2 = C;
a1 = (L+C*R2*R1)/(R1*L)
a0 = ((R2/R1) + 1)*L
b1 = 1
s1 = -(a1/(2*a2) + sqrt((a1/(2*a2))^2 - (a0/a2)))
s2 = -(a1/(2*a2) - sqrt((a1/(2*a2))^2 - (a0/a2)))

hv = 1/a2/(s1-s2) * (exp(s1*t) - exp(s2*t));
dhv = 1/a2/(s1-s2) * (s1*exp(s1*t) - s2*exp(s2*t));

h = b1*dhv;
u1 = ones(size(t)); u2 = sin(t);
y1 = dt * conv(h, u1); y2 = dt * conv(h, u2);
plot(t, y1(1:(tk/dt+1)), 'r', t, y2(1:(tk/dt+1)), 'b');
axis([tz tk -0.4 1.1]);
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 12);
xlabel('čas t [s]');
ylabel('izhodna napetost vizh [V]');
title('Odziv vezja na enotino stopnico in sinusni signal');
grid on; 