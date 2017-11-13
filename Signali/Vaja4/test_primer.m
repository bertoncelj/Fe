% Odziv sistema z dvema vhodoma na sinusni signal
clear all; close all;

#zactno konstante
R1 = 2.000; R2 = 1.000; C1 = 1.000; C2 = 1.000; % elementi vezja

#casovni vektor
tz = 0; tk = 20; dt = 0.1; t=tz:dt:tk; % časovni vektor

#singal
u1 = zeros(size(t)); u2 = zeros(size(t)); u1 = sin(t); % vzbujanje
U = [u1; u2];                        % vhodni vektor
x01 = 0; x02 = 0;                    % začetno stanje
X0 = [x01; x02];                    % vektor začetnega stanja

#Vpis matrike vrednosti
a11 = -1/C1*(1/R1+1/R2); a12 = -1/(R1*C1); a21 = -1/(R1*C2); a22 = -1/(R1*C2);
b11 = 1/(R2*C1); b12=0; b21=0; b22=0;
c11 = -1; c12 = -1; c21=0; c22=1;
d11 = 1; d12=0; d21=0; d22=0;

#matrike
A = [a11, a12; a21, a22]; % osnovna matrika sistema
B = [b11, b12; b21, b22]; % vhodna matrika
C = [c11, c12; c21, c22]; % izhodna matrika
D = [d11, d12; d21, d22]; % vhodno-izhodna matrika


[y,x]=lsim(A,B,C,D,U,t,X0); % ukaz za izračun celotnega odziva

x1 = x(:,1); % x je matrika z dvema stolpcema x(t,1) = vC1(t)
x2 = x(:,2); % in x(t,2) = vC2(t)

vizh = y(:,1); % y je matrika z dvema stolpcema y(t,1) = vizh(t)

#Draw
figure
plot(x1, x2); axis([-0.8 0.8 -0.8 0.8]); grid;
xlabel('vc1 [V] (x1)'); ylabel('vc2 [V] (x2)');
title('Trajektorija v prostoru stanj')
pause(2)

figure
plot(t, x1, 'g', t, x2, 'b', t, vizh, 'r'); axis([tz tk -1.1 1.1]); grid;
xlabel('t [s]'); ylabel('vc1 [V], vc2 [V], vizh [V]');
title('Časovna odvisnost spremenljivk stanj in vizh')
pause(2) 


figure
subplot(2,2,1)
plot(x1, x2); axis([-0.8 0.8 -0.8 0.8]); grid;
xlabel('vc1 [V] (x1)'); ylabel('vc2 [V] (x2)');
title('Trajektorija v prostoru stanj')
subplot(2,1,2)
plot(t, x1, 'g', t, x2, 'b', t, vizh, 'r'); axis([tz tk -1.1 1.1]); grid;
xlabel('t [s]'); ylabel('vc1 [V], vc2 [V], vizh [V]');
title('Časovna odvisnost spremenljivk stanj in vizh') 