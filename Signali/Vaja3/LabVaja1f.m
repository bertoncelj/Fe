clear all; close all;

dt=0.0005; tz=0; tk=15;
t = tz:dt:tk;

R1 = 2; 
R2 = 1; 
C  = 1; 


a1 = R1*C
a0 = (R1/R2 + 1)
b0 = 1;
b1 = R1*C

vg1 = ones(size(t)); %stopnica
vg2 = sin(t);        %sinuts


hv = h = b0/a1*exp(-a0/a1*t);
hv = 1/a1*exp((-a0/a1)*t).*u_t;
dhv = 1/a1*(-a0/a1)*exp((-a0/a1)*t)+1/a1*du_t;
h=b1*dhv+b0*hv;

h = b1*dhv + b0*hv;

y1 = dt * conv(h, vg1); y2 = dt * conv(h, vg2);

plot(t, y1(1:(tk/dt+1)), 'r', t, y2(1:(tk/dt+1)), 'b');
axis([tz tk -2.3 2]);
legend("enotina stopnica", "Sinus")
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 12);
xlabel('čas {\itt} [s]');
ylabel('tok skozi tuljavo {\itV_{Izh}} [V]');
title('Odziv izhodne napetosti na enotino stopnico in sinusni signal');
grid on; 