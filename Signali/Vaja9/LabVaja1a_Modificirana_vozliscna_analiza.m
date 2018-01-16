#RAb 2 min da se PRZGE
clear all; close all;

R1 = 2;  R2 = 1; C1 = 1; C2 = 1; L = 0.5; gm = 1;

syms s 
% Vektor vzbujanja
VIg = [1; 0; 0; 0; 0; 0; 0];
% t vozliè in vej
n = 3; b = 7;

% reducirana vpadna matrika
A = [1/R1  -1/R2   0   1;
     -1/R1 1/R1 +C1s + 1/Ls -1/Ls 0;
     0 -1/Ls+gm 1/R2 +C2s +Ls  0; 
     1    0     0       0      ];
     
     
 X = A/VIg

[b, a] = numden(X(3))
b = sym2poly(b) %num
a = sym2poly(a) %den

A_num = double(b) 
B_den = double(a)

tz = 0; tk = 50; dt = tk/1000; t = tz : dt : tk; % èasovni vektor
sys = tf(A_num, B_den);
% odziv na enotin impulz
v2 = impulse(sys, t);
figure
plot(t, v2); grid;
xlabel('t [sec]'); ylabel('vizh [V]'); 
title('Odziv na enotin impulz'); 

% odziv na enotino stopnico
v2 = step(sys, t);
figure
plot(t, v2); grid;
xlabel('t [sec]'); ylabel('vizh [V]'); 
title('Odziv na enotino stopnico'); 
