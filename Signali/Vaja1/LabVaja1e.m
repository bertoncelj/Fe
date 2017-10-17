%1.E) 
clear all; 
close all;
T = 0.2;
a = 0.92;
A = 1;
t1 = -1 : T : 0-T; 
n1 = t1/T;
u1 = zeros(size(n1));

t2 =  0 : T : 5;   
n2 = t2/T;
u2 = ones(size(n2));

n = [n1 n2]; u = [u1 u2];
x = A*u.*a.^n;

% Drawing
stem(n, x)
axis([-5 25 -0.1 1.2]); grid;
xlabel('n');
ylabel('x(n) = a^n');
title('Duseni sinusni signal');