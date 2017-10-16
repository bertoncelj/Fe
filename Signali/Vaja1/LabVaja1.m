% LAB VAJE
%______ 1. vaja ______
%1.a
clear all; close all;
%enotina stopnica;
dt = 0.001;
A = 2;        %visina stopnice
t1 = -10 : dt : -1;   u1 = zeros(size(t1));
t2 = -1 : dt : 3;     u2 = A * ones(size(t2));
t3 = 3 : dt : 10;     u3 = zeros(size(t3));

%zapis v vektorski obliki
t = [t1 t2 t3];
u = [u1 u2 u3];

plot(t , u, 'LineWidth', 2);
axis([-7 7 -1 4]);

%1.b
clear all; close all;
dt = 