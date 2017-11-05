clear all; close all;

#2.Zapišite diferencialno enačbo za tok skozi tuljavo iL(t) in jo rešite s pomočjo programa MATLAB.
# Program dopolnite, da bo izračunal še napetost na kondenzatorju vC(t) in nato obe spremenljivki 
#grafično prikazal na podgrafih. (C = 1 mF, L = 110 mH, R1 = 100 Ω, R2 = 10 Ω, iL(0) = 1 A, vC(0) = 0 V)

Lr = vpa ('110 / 1000', 32);     %Henry
Cr = vpa('1/1000', 32);    %Farad          %ohm
R1 = 100;
R2 = 10;

#DE constants
a2 = Lr * Cr
a1 = (R2 * Cr) + Lr/(R1)
a0 = (R2/R1) + 1 

#define symbol for IL(t)
syms il(t)

DE = a2 * diff(il, t, t) + a1 * diff(il, t) + a0 * il == 0
sol = dsolve (DE, il(0) == 1, diff(il)(0) == -R2/(Lr))

#transform symbolic function so it can be ploted
ff   = function_handle(rhs(sol))


#draw plot
t1 = 0 : 0.0001 : 0.2;
y  = ff(t1);

plot(t1,y);
grid;
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
xlabel('time {\itt} [s]'); ylabel('{\itI_L}({\itt}) [A]');
title('Coil current for example 2');