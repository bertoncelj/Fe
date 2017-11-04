clear all; close all;
tz=0; tk=10; dt=0.001; t=tz:dt:tk; %časovni vektor
t_uz=0:dt:2*dt; t_un=2*dt+dt:dt:tk;
t_u = [t_uz t_un];
u_t = [t_uz/(2*dt) ones(size(t_un))]; %generiranje stopnice
du_t = diff(u_t) ./ diff(t_u);
du_t = [du_t 0]; %generiranje pulza
R1 = 1; R2 = 1; L = 1;
a1 = (L+R2*L)/(R2); a0 = 1; b1 = 1/L; b0 = 1;

hv = 1/a1*exp((-a0/a1)*t).*u_t;
dhv = 1/a1*(-a0/a1)*exp((-a0/a1)*t)+1/a1*du_t;
h=b1*dhv+b0*hv;
vg1 = ones(size(t));
y1 = dt * conv(h, vg1);
plot(t, h, t, y1(1:((tk-tz)/dt+1)), 'LineWidth', 2);
axis([tz tk -0.1 1.1]); grid on;
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 12);
xlabel('čas {\itt} [s]');
ylabel('izhodna napetost {\itv_{izh}} [V]');
title('Odziv vezja na vzbujanje {\itv_{g}}'); 