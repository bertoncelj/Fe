clear all; close all;
R=1; L=1; C=1; 


syms s 
syms x real


syms x y s
syms Is(s) I_c(s) I_r(s) 
syms Vs(s) H(s) 


f1 = Is   == I_c + I_r;
f2 = Vs   == R*I_r + L*s*I_r
f3 = Vs   == 1/(C*s)
f4 = I_r  == Vs/(R + L*s)
f5 = I_c  == C*s*Vs
f6 = H == Vs/Is

A = solve(f1,f2,f3,f4,f5,f6, H)






%f1 = '-(V1-Vizh)/(L*s)+Vizh/R2'; % vozliščne enačbe
%f2 = '-(Vg-V1)/R1+V1*(C*s)+(V1-Vizh)/(L*s)';
%f3 = 'H = Vizh/Vg';
%A = solve(f1,f2,f3,V1,Vizh,H);