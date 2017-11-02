clear all; close all;


C = 1
L = 2
R = 3

syms Uc(t)

DE  = C*L*diff(Uc, t, t) + R*C*diff(Uc, t) + Uc == 0
sol = dsolve (DE,Uc(0) == 10, diff(Uc)(0) == 0)
L = sym ('1')
C = sym ('2')
R = sym ('3')
ff   = function_handle(rhs(sol))
ff(1);