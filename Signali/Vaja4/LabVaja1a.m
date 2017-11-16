clear all; close all;
f = 1e3;
Ra = 1.0e3; Rb = 2*Ra; R1 = 1.000e3; R2 = 1.000e3;
C = 1/(2*pi*f*sqrt(R1*R2));
C1 = C; C2 = C;
tz = 0; tk = 0.01; dt = 0.000001; t=tz:dt:tk;
u1 = zeros(size(t)); u2 = zeros(size(t));
U = [u1; u2];
x01 = 1; x02 = 0;
X0 = [x01; x02];
a11 = Rb/Ra/(R2*C1)-1/(R1*C1); a12 = -1/(R2*C1);
a21 = Rb/Ra/(R2*C2); a22 = -1/(R2*C2);
b11 = 0; b12 = 0; b21 = 0; b22 = 0;
c11 = 1 + Rb/Ra; c12 = 0;
d11 = 0; d12 = 0;
A = [a11, a12; a21, a22];
B = [b11, b12; b21, b22];
C = [c11, c12];
D = [d11, d12];
[y,x]=lsim(A,B,C,D,U,t,X0);
x1 = x(:,1); x2 = x(:,2); vizh = y(:,1);
7
8
fig1 = figure(1);
set(fig1,'Units','centimeters','Position',[1 4 14 12]);
plot(x1, x2); axis([-2.1 2.1 -2.1 2.1]); grid;
xlabel('{\itv_C}_1 [V] ({\itx}_1)'); ylabel('{\itv_C}_2 [V] ({\itx}_2)');
title('Trajektorija v prostoru stanj')
pause(1);
fig2 = figure(2);
set(fig2,'Units','centimeters','Position',[16.5 1.5 20 16]);
plot(t, x1, 'g', t, x2, 'b', t, vizh, 'r'); axis([0 0.003 -4.5 4.5]); grid;
xlabel('{\itt} [s]'); ylabel('{\itv_C}_1 [V], {\itv_C}_2 [V], {\itv_{izh}} [V]');
title('Časovna odvisnost spremenljivk stanj')
pause(2);
close all; 