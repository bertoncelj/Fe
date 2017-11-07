clear all; close all;

dt=0.0005; tz=0; tk=12;


A = 1;
t1 =  tz : dt : 2; u1 = zeros(size(t1));
t2 =  2  : dt  : 3;  u2 = A * ones(size(t2));
t3 =  3  : dt  : tk;  u3 = zeros(size(t3));
t = [t1 t2 t3];
u = [u1 u2 u3];


R1 = 1; 
R2 = 1; 
C1 = 1; 
C2 = 1;

a1 = 3/R1*R2*C1*C2;
a2 = 1;
a0 = 1/(R1*R2*C1*C2)^2;
b0 = 1/(R1*R2*C1*C2)^2;

vg1 = ones(size(t)); %stopnica
vg2 = sin(t);        %sinuts

s1 = -(a1/(2*a2) + sqrt((a1/(2*a2))^2 - (a0/a2)))
s2 = -(a1/(2*a2) - sqrt((a1/(2*a2))^2 - (a0/a2)))

hv = 1/a2/(s1-s2) * (exp(s1*t) - exp(s2*t));


h =  b0*hv;

y1 = dt * conv(h, u); y2 = dt * conv(h, vg2);

t_size = size(t)
y1_size = size(y1(1:(tk/dt+3)))
y2_size = size(y2(1:(tk/dt+3)))
plot(t, y1(1:(tk/dt+3)), 'r', t, u);
axis([tz tk -1 1]);
legend("enotina stopnica", "Sinus")
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 12);
xlabel('čas {\itt} [s]');
ylabel('tok skozi tuljavo {\itV_{Izh}} [V]');
title('Odziv izhodne napetosti na enotino stopnico in sinusni signal');
grid on; 