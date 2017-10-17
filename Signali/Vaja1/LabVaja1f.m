% Generiranje diskretne enotine stopnice
clear all; close all;
A = 4;
phi = -pi/2;
T = 10;

t =  0 : T : 3000; 
n = t/T;
u = ones(size(n));

x = A * cos((2*pi/T*n) + phi);
%x = A*u.*a.^n;
% Drawing
stem(n, x)
axis([0 50 -5 5]); grid;
%xlabel('n');
%ylabel('cos(x)');
%title('1.F kosinusni signal');
