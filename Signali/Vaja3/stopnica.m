clear all; close all;

tz=0; tk=10; dt=0.001; t=tz:dt:tk; %časovni vektor
t_uz=0:dt:2*dt; t_un=2*dt+dt:dt:tk;
t_u = [t_uz t_un];
u_t = [t_uz/(2*dt) ones(size(t_un))]; %generiranje stopnice
du_t = diff(u_t) ./ diff(t_u);
du_t = [du_t 0]; 

subplot(2,1,1)
plot(t_u, u_t)
axis([-0.1 5 -0.1 2])

subplot(2,1,2)
plot(t_u ,du_t)