clear all; close all;

# 3.Zapišite diferencialno enačbo za tok skozi tuljavo iL(t) in jo rešite s pomočjo programa MATLAB. Program dopolnite, da bo 
# izračunal še napetost na kondenzatorju vC(t) in nato obe spremenljivki grafično prikazal na podgrafih. Krmiljenje naj bo 
# enotina stopnica (ig = u(t)), nato pa še sinusni signal (ig = sin(t)). (C = 1 F, L = 1 H, R = 2Ω, iL(0) = 0 A, vC(0) = 0 V)

#define elenets value
L = 1; %Henry
C = 1; %Farad
R = 2; %ohm

#DE constants
a2 = L * C;
a1 =  L / R;
a0 = 1;

syms il(t)

# DIFFERENTIALA equation.... UNIT STEP
DE = a2 * diff(il, t, t) + a1 * diff(il, t) + a0 * il == 1;
sol = dsolve (DE, il(0) == 0, diff(il)(0) == 0);

ff   = function_handle(rhs(sol));

# draw plot
t1 = 0 : 0.01 : 30;
y  = ff(t1);

subplot(1,2,1)
plot(t1,y);
grid;
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
xlabel('time {\itt} [s]'); ylabel('{\itI_L}({\itt}) [A]');
title('Coil current for example 3 UNIT STEP');

#Differential equation------- SIN(t)


DE = a2 * diff(il, t, t) + a1 * diff(il, t) + a0 * il == sin(t);
sol = dsolve (DE, il(0) == 0, diff(il)(0) == 0);

ff   = function_handle(rhs(sol));

# draw plot
t1 = 0 : 0.01 : 30;
y  = ff(t1);

subplot(1,2,2)
plot(t1,y);
grid;
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
xlabel('time {\itt} [s]'); ylabel('{\itI_L}({\itt}) [A]');
title('Coil current for example 3 UNIT STEP');