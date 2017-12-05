clear all; close all;
R=1; L=1; C=1; 


%I_r(s) ->z(s)
syms s z(s)
syms I_c(s) I_r(s) 
syms  H(x) 


f2 = 1/(C*s)   == R*z + L*s*z
f4 = z  == (1/(C*s))/(R + L*s)
f6 = H == (1/(C*x))/(C*x*(1/(C*x)) + (1/(C*x))/(R + L*x))

A = solve(f6, H)
new =  A^-1





%f1 = '-(V1-Vizh)/(L*s)+Vizh/R2'; % vozliščne enačbe
%f2 = '-(Vg-V1)/R1+V1*(C*s)+(V1-Vizh)/(L*s)';
%f3 = 'H = Vizh/Vg';
%A = solve(f1,f2,f3,V1,Vizh,H);