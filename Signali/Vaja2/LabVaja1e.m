#1.e Program priredite za reševanje danega RLC vezja, za katerega naj izračuna in grafično prikaže odzive (vizh(t) = vC(t)) 
#na začetno stanje (vg(t) = 0, vC(0− ) = 10 V, iL(0− ) = 0) za naslednje stopnje dušenja: ζ = 0, ζ = 0.1, ζ = 0.7, ζ = 1 in ζ = 2.
clear all;
#Given Constants for C = 10^-6 and L = 10^-3 are:

C = 10^-6;
L = 10 * 10^-3;
%this record is not sutible for symbolic calculations! We will change it down the line

#First you calculate form known zeta -> R solutions
# Given zetas are:
# ζ = 0, ζ = 0.1, ζ = 0.7, ζ = 1 in ζ = 2

zeta_0 = 0;
zeta_01 = 0.1;
zeta_07 = 0.7;
zeta_1 = 1;
zeta_2 = 2;
 
#You know zeta is define as 
% zeta = 1/2 * R * sqrt(C/L);

#When we are looking for R you must definite as a symbol
syms R

#Find different Rs for given zetas. There we are using function solve() calc. for symbols only
Rr0  = solve(zeta_0 == 1/2 * R * sqrt(C/L), R)
Rr01 = solve(zeta_01 == 1/2 * R * sqrt(C/L), R)
Rr07 = solve(zeta_07 == 1/2 * R * sqrt(C/L), R)
Rr1  = solve(zeta_1 == 1/2 * R * sqrt(C/L), R)
Rr2  = solve(zeta_2 == 1/2 * R * sqrt(C/L), R)

%%% if we are looking for imagenary solution we will look as 
%   vpasolve(0 == R/2 * sqrt(Cr/Lr), R, 1i)
%   vpasolve(0.1 == R/2 * sqrt(Cr / Lr), R, 1i)
%   vpasolve(0.7 == R/2 * sqrt(Cr / Lr), R, 1i)
%   vpasolve(1 == R/2 * sqrt(Cr / Lr), R, 1i)
%   vpasolve(2 == R/2 * sqrt(Cr / Lr), R, 1i)
%%%

#Now we have all parameters, constants and starting positions
#For given R, showing graph for output voltage

#Because we are using symbolic pkg we must define every double or float as vpa function with one division of integers
Lr = vpa ('1 / 100', 32);     %Henry
Cr = vpa('1/1000000', 32);    %Farad
Rr = vpa('1', 32);            %ohm

#defining Voltage_out as symbol

syms Uc(t)

#Solving for Diff. equations for every R
DE  = Cr*Lr*diff(Uc, t, t) + Rr0*Cr*diff(Uc, t) + Uc == 0
DE1 = Cr*Lr*diff(Uc, t, t) + Rr01*Cr*diff(Uc, t) + Uc == 0
DE2 = Cr*Lr*diff(Uc, t, t) + Rr07*Cr*diff(Uc, t) + Uc == 0
DE3 = Cr*Lr*diff(Uc, t, t) + Rr1*Cr*diff(Uc, t) + Uc == 0
DE4 = Cr*Lr*diff(Uc, t, t) + Rr2*Cr*diff(Uc, t) + Uc == 0

#Given starting position
sol = dsolve (DE, Uc(0) == 10, diff(Uc)(0) == 0);
sol1 = dsolve (DE1, Uc(0) == 10, diff(Uc)(0) == 0);
sol2 = dsolve (DE2, Uc(0) == 10, diff(Uc)(0) == 0);
sol3 = dsolve (DE3, Uc(0) == 10, diff(Uc)(0) == 0);
sol4 = dsolve (DE4, Uc(0) == 10, diff(Uc)(0) == 0);

#Translate solutions to functions, Use rhs cuz of doubles
ff   = function_handle(rhs(sol));
ff01 = function_handle(rhs(sol1));
ff07 = function_handle(rhs(sol2));
ff1  = function_handle(rhs(sol3));
ff2  = function_handle(rhs(sol4));

#Plotiong all functions in same graph

# time vector
t1 = 0 : .000001 : .002;
y  = ff(t1);
y1 = ff01(t1); 
y2 = ff07(t1);
y3 = ff1(t1);
y4 = ff2(t1);
 
plot(t1,y,'b', t1, y1, 'r', t1, y2, 'g', t1, y3, 'y', t1, y4, 'k')
legend ("R = 0", "R = 20", "R = 140", "R = 200", "R = 400");
grid;
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
xlabel('time {\itt} [s]'); ylabel('{\itUo}({\itt}) [V]');
title('Output voltage for example 1');



