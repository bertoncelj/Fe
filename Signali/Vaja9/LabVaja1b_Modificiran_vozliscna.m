clear all; close all;
#RAb 9-11 min da se PRZGE

R1 = 1.4202; 
R2 = 7.1010; 
R3 = 2.8165; 
C1 = 1; 
C2 = 0.05; 

syms s 

% Vektor vzbujanja
VIg = [1; 0; 0; 0; 0; 0; 0; 0];
% t vozliè in vej
n = 4; b = 8;

% reducirana vpadna matrika
A = [1/R1 -1/R1 0   0   1 0;
     -1/R1 1/R1+1/R2+1/R3*C1*s -1/R3 -1/R2 0 0;
     0 -1/R3 1/R3+C2*s -C2*s 0 0;
     1 0 0 0 0 0;
     0  0 1 0 0 0];
     
     
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

% odziv na poljuben vhodni signal
v1 = sin(t)+sin(10*t)+sin(100*t); % vhodni signal
v2 = lsim(sys, v1, t); % odziv, izhodni signal
figure
plot(t, v1, t, v2); grid;
xlabel('t [sec]'); ylabel('vizh [V]'); 
title('Odziv na sestavljeni signal'); 

% frekvenèna karakteristika
w = linspace(-1, 2.5, 1000);
[mag, phase] = bode(sys, w);
figure
subplot(2, 1, 1)
plot(w, mag); grid;
xlabel('frekvenca w [rad/s]'); ylabel('M');
title('Amplitudna karakteristika');
subplot(2, 1, 2)
plot(w, phase); grid;
xlabel('frekvenca w [rad/s]'); ylabel('faza v stopinjah');
title('Fazna karakteristika');

% Bodejev diagram
w = logspace(-1, 3, 1000);
[mag, phase] = bode(sys, w);
dbmag = 20*log10(mag);
figure
subplot(2, 1, 1)
semilogx(w, dbmag); grid;
xlabel('frekvenca w [rad/s]'); ylabel('M [dB]');
title('Amplitudna karakteristika v dB');
subplot(2, 1, 2)
semilogx(w, phase); grid;
xlabel('frekvenca w [rad/s]'); ylabel('faza v stopinjah');
title('Fazna karakteristika'); 