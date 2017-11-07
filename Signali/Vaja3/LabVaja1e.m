clear all; close all;

dt=0.0005; tz=0; tk=15;
t = tz:dt:tk;

#Vsneseni parametri
R1 = 1;
R2 = 1; 
C1 = 2 / sqrt(2); 
C2 = sqrt(2) / 2;

#konstante od DE
a2 = 1;
a1 = ((1/C1) * ((1/R1) + (1/R2)));
a0 = 1/(R1*R2*C1*C2);
b0 = 1/(R1*R2*C1*C2);
b1 = 0;

#Vhodni signal
#Generiranje stopnice in sinusa
vg1 = ones(size(t)); %stopnica
vg2 = sin(t);        %sinuts

s1 = -(a1/(2*a2) + sqrt((a1/(2*a2))^2 - (a0/a2)))
s2 = -(a1/(2*a2) - sqrt((a1/(2*a2))^2 - (a0/a2)))

hv = 1/a2/(s1-s2) * (exp(s1*t) - exp(s2*t));
dhv = 1/a2/(s1-s2) * (s1*exp(s1*t) - s2*exp(s2*t));

h = b1*dhv + b0*hv;

y1 = dt * conv(h, vg1); y2 = dt * conv(h, vg2);

plot(t, y1(1:(tk/dt+1)), 'r', t, y2(1:(tk/dt+1)), 'b');
axis([tz tk -1 1.5]);
legend("enotina stopnica", "Sinus")
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 12);
xlabel('čas {\itt} [s]');
ylabel('tok skozi tuljavo {\itV_{Izh}} [V]');
title('Odziv izhodne napetosti na enotino stopnico in sinusni signal');
grid on; 