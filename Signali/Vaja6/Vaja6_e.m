close all; clear all;

% Elementi vezja
R1 = 42; R2 = 48; L1 = 8.4; L2 = 10;
% Vhodni signal
A = 10; T = 2;

% Zaèetno stanje
il10 = 0; il20 = 0.2;

syms s V1 Vizh Vg H t
sym('T0', 'positive')
sym('A0', 'positive')

f1 = '-(Vg - V1)/s/L1 + (V1 - Vizh)/s/L2 + V1/R1';
f2 = '-(V1 - Vizh)/s/L2 + Vizh/R2';
f3 = 'H = Vizh/Vg';
A = solve(f1,f2,f3, V1, H, Vizh);
AH = A.H;
AH = collect(AH);
AH = subs(AH)
Vg = sym('10*heaviside(t) - 2*10*heaviside(t - T0/2) + 10*heaviside(t - T0)');
Vg1 = laplace(Vg, t, s);
VgT = subs(Vg1, 'T0', T)

V1 = AH*VgT
v1 = ilaplace(V1, s,'t');


t = 0: 0.01: T;
v1 = subs(v1, t);

plot(t, v1);grid;



