#POZOR tukaj je poseben primer opisan za h funkcijo

clear all; close all;

dt=0.0005; tz=0; tk=15;
t = tz:dt:tk;

tz=0; tk=10; dt=0.001; t=tz:dt:tk; %časovni vektor
t_uz=0:dt:2*dt; t_un=2*dt+dt:dt:tk;
t_u = [t_uz t_un];
u_t = [t_uz/(2*dt) ones(size(t_un))]; %generiranje stopnice
du_t = diff(u_t) ./ diff(t_u); #pulz
du_t = [du_t 0]; 

#Dolocimo vrednosti za elemente
R1 = 2; 
R2 = 1; 
C  = 1; 

#Dolocimo konstante za DE
a2 = 0;
a1 = R1*C
a0 = (R1/R2 + 1)
b0 = 1;
b1 = R1*C

#generiranje stopnice
vg1 = ones(size(t)); %stopnica
vg2 = sin(t);        %sinuts


#nastavek za hv funkcijio
hv = 1/a1*exp((-a0/a1)*t).*u_t;
dhv = 1/a1*(-a0/a1)*exp((-a0/a1)*t)+1/a1.*du_t;

#skupen nastavek za h funkcijo
h= b1*dhv + b0*hv;

#konvolucijski integral
y1 = dt * conv(h, vg1); y2 = dt * conv(h, vg2);

#draw
plot(t, y1(1:(tk/dt+1)), 'r', t, y2(1:(tk/dt+1)), 'b');
axis([tz tk -2.3 2]);
legend("enotina stopnica", "Sinus")
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 12);
xlabel('čas {\itt} [s]');
ylabel('tok skozi tuljavo {\itV_{Izh}} [V]');
title('Odziv izhodne napetosti na enotino stopnico in sinusni signal');
grid on; 