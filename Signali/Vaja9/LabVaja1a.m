#RAb 2 min da se PRZGE
clear all; close all;

R1 = 2;  R2 = 1; C1 = 1; C2 = 1; L = 0.5; gm = 1;

syms s 
% Vektor vzbujanja
VIg = [1; 0; 0; 0; 0; 0; 0];
% t vozliè in vej
n = 3; b = 7;

% reducirana vpadna matrika
A = [1 1 0 0 0 0 0;
     0 -1 1 1 0 0 0;
     0 0 0 -1 1 1 1];
 
M0_M1 = sym(zeros(7));
M0_M1(1,1) = 1;
M0_M1(2,2) = -1;
M0_M1(3,3) = C1*s;
M0_M1(4,4) = -1;
M0_M1(5,5) = C2*s;
M0_M1(6,3) = gm;
M0_M1(7,7) = -1;

N0_N1 = sym(zeros(7));
N0_N1(1,1) = 0;
N0_N1(2,2) = R1;
N0_N1(3,3) = -1;
N0_N1(4,4) = L*s;
N0_N1(5,5) = -1;
N0_N1(6,6) = -1;
N0_N1(7,7) = R2;

Ib = eye(b); % enotska matrika
I0_nb = sym(zeros(n, b));
I0_nn = sym(zeros(n, n));
I0_bb = sym(zeros(b, b));
I0_bn = sym(zeros(b, n));
I0_n = sym(zeros(n, 1));
I0_b = sym(zeros(b, 1));

T = [I0_nn I0_nb A; -A' Ib I0_bb; I0_bn M0_M1 N0_N1]
E_g = [I0_n; I0_b; VIg]
W = T\E_g
[b, a] = numden(W(9))
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

% odziv na poljuben vhodni signal
v1 = sin(t)+sin(10*t)+sin(100*t); % vhodni signal
v2 = lsim(sys, v1, t); % odziv, izhodni signal
figure
plot(t, v1, t, v2); grid;
xlabel('t [sec]'); ylabel('vizh [V]'); 
title('Odziv na sestavljeni signal'); 

% frekvenèna karakteristika
w = linspace(0, 2.5, 1000);
[mag, phase] = bode(sys, w);
figure
subplot(2, 1, 1)
plot(w, mag); axis([0 2.5 0 1.2]); grid;
xlabel('frekvenca w [rad/s]'); ylabel('M');
title('Amplitudna karakteristika');
subplot(2, 1, 2)
plot(w, phase); grid;
xlabel('frekvenca w [rad/s]'); ylabel('faza v stopinjah');
title('Fazna karakteristika');

% Bodejev diagram
w = logspace(-1, 1, 1000);
[mag, phase] = bode(sys, w);
dbmag = 20*log10(mag);
figure
subplot(2, 1, 1)
semilogx(w, dbmag); axis([.1 10 -50 10]); grid;
xlabel('frekvenca w [rad/s]'); ylabel('M [dB]');
title('Amplitudna karakteristika v dB');
subplot(2, 1, 2)
semilogx(w, phase); grid;
xlabel('frekvenca w [rad/s]'); ylabel('faza v stopinjah');
title('Fazna karakteristika'); 