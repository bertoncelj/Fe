close all; clear all;

% Elementi vezja
R1 = 42; R2 = 48; L1 = 8.4; L2 = 10;
% Vhodni signal
A = 10; T = 2;

% Zaèetno stanje
iL10 = 0; iL20 = 0.2;
syms s t I1 I2 Vizh;

vg = 0;
for i = 1:5
    vg = vg+ A*heaviside(t- (i-1)*T) - 2*A*heaviside(t - (i-1)*T - T/2) + A*heaviside(t -(i-1)*T - T);
end
Vg = laplace(vg);

f1 = 's*L1 *I1- L1*iL10 + R1*(I1 - I2)-Vg = 0';
f2 = '-L2*iL20  + s*L2*I2 + R2*I2 + R1*(I2-I1) = 0';
f3 = 'Vizh = R2*I2';
X = solve(f1,f2,f3, I1,I2, Vizh);
Vizh = X.Vizh;
Vizh = subs(Vizh)
vizh = ilaplace(Vizh, s, t);
t = 0: 5*T/1000: 5*T;

vizh = subs(vizh,t)

vg = subs(vg,t)

fig1 = figure(1);
plot(t, vg, t , vizh); grid;