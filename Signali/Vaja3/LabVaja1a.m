clear all; close all;
dt=0.0005; tz=0; tk=30;
t = tz:dt:tk;
%-----------------------
##il 
R = 3; L = 1; C = 1;
a2 = C*L;
a1 = (L/R);
a0 = 1;
b0 = 1;
b1 = 0;
vg1 = ones(size(t)); %stopnica
vg2 = sin(t);        %sinuts

s1 = -(a1/(2*a2) + sqrt((a1/(2*a2))^2 - (a0/a2)))
s2 = -(a1/(2*a2) - sqrt((a1/(2*a2))^2 - (a0/a2)))

hv = 1/a2/(s1-s2) * (exp(s1*t) - exp(s2*t));
dhv = 1/a2/(s1-s2) * (s1*exp(s1*t) - s2*exp(s2*t));

h = b1*dhv + b0*hv;

y1 = dt * conv(h, vg1); y2 = dt * conv(h, vg2);
subplot(2,1,1)
plot(t, y1(1:(tk/dt+1)), 'r', t, y2(1:(tk/dt+1)), 'b');
axis([tz tk -3 3]);
legend("enotina stopnica", "Sinus")
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 12);
xlabel('čas {\itt} [s]');
ylabel('tok skozi tuljavo {\iti_{L}} [A]');
title('Odziv toka skozi tuljavo na enotino stopnico in sinusni signal');
grid on; 
%-----------------------------------------------------
## Vc
R = 3; L = 1; C = 1;
a2 = C;
a1 = (1/R);
a0 = 1/L;
b0 = 0;
b1 = 1;
vg1 = ones(size(t)); %stopnica
vg2 = sin(t);        %sinuts

s1 = -(a1/(2*a2) + sqrt((a1/(2*a2))^2 - (a0/a2)))
s2 = -(a1/(2*a2) - sqrt((a1/(2*a2))^2 - (a0/a2)))

hv = 1/a2/(s1-s2) * (exp(s1*t) - exp(s2*t));
dhv = 1/a2/(s1-s2) * (s1*exp(s1*t) - s2*exp(s2*t));

h = b1*dhv + b0*hv;

y1 = dt * conv(h, vg1); y2 = dt * conv(h, vg2);
subplot(2,1,2)
plot(t, y1(1:(tk/dt+1)), 'r', t, y2(1:(tk/dt+1)), 'b');
axis([tz tk -3 3]);
legend("enotina stopnica", "Sinus")
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 12);
xlabel('čas {\itt} [s]');
ylabel('tok skozi tuljavo {\itV_{c}} [V]');
title('Odziv napetosti na kondezatorju, enotino stopnico in sinusni signal');
grid on; 