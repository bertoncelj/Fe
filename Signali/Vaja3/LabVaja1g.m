clear all; close all;

dt=0.0005; tz=0; tk=15;
t = tz:dt:tk;

#Generiranje stopnice in inpluza
tz=0; tk=10; dt=0.001; t=tz:dt:tk; %časovni vektor
t_uz=0:dt:2*dt; t_un=2*dt+dt:dt:tk;
t_u = [t_uz t_un];
u_t = [t_uz/(2*dt) ones(size(t_un))]; %generiranje stopnice
du_t = diff(u_t) ./ diff(t_u);
du_t = [du_t 0]; 


#Dolocimo vrednosti za elemente
R1 = 2; 
R2 = 1; 
C1  = 1;
C2 = 1; 

#Dolocimo konstante za DE
a2 = 1
a1 = (1/(C1*R1) + ((1/C1) + (1/C2))*1/R1)
a0 = 1/(R1*R2*C2*C1)
b0 = 1/(R1*R2*C1*C2)
b1 = (1/C1 + 1/C2)*1/R1
b2 = 1

#generiranje stopnice
vg1 = ones(size(t)); %stopnica
vg2 = sin(t);        %sinuts

s1 = -(a1/(2*a2) + sqrt((a1/(2*a2))^2 - (a0/a2)));
s2 = -(a1/(2*a2) - sqrt((a1/(2*a2))^2 - (a0/a2)));

hv = 1/a1*exp((-a0/a1)*t).*u_t;
dhv = 1/a1*(-a0/a1)*exp((-a0/a1)*t)+1/a1*du_t;
ddhv = (1/a2) * (1/(s1 -s2)) * (s1^2 * exp(s1*t) - s2^2 * exp(s2*t)).*u_t + (1/a2).*du_t;

h=b2*ddhv + b1*dhv + b0*hv;



y1 = dt * conv(h, vg1); y2 = dt * conv(h, vg2);

plot(t, y1(1:(tk/dt+1)), 'r', t, y2(1:(tk/dt+1)), 'b');
axis([tz tk -2.3 2]);
legend("enotina stopnica", "Sinus")
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 12);
xlabel('čas {\itt} [s]');
ylabel('tok skozi tuljavo {\itV_{Izh}} [V]');
title('Odziv izhodne napetosti na enotino stopnico in sinusni signal');
grid on; 