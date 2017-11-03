%x = sym ('x', 'negative', 'integer')
%A = sym ('A', [2,4])
%
%f = @(n, x) sin(pi*besselj (n, x)/2)
%sym(f)
#zeta = 5;
#definicija 
A = sym (0.1, 'f')
B = vpa ('1 / 100000', 32)
C = sym ('C')
L = sym ('L')
R = sym ('R')
zeta = sym('zeta')

Cn = 1;
Ln = 20;
Rn = 10;


##konstante 1.b
Lr = vpa ('1 / 100', 32);     %Henry
Cr = vpa('1/1000000', 32);    %Farad
Rr = vpa('1', 32);            %ohm
Rr0  = 0;
Rr01 = 20;
Rr07 = 140;
Rr1  = 200;
Rr2  = 400;
##1.a
 
syms Uc(t) Vc(t) 
syms s 
syms x real

DE  = Cr*Lr*diff(Uc, t, t) + Rr0*Cr*diff(Uc, t) + Uc == 0
DE1 = Cr*Lr*diff(Uc, t, t) + Rr01*Cr*diff(Uc, t) + Uc == 0
DE2 = Cr*Lr*diff(Uc, t, t) + Rr07*Cr*diff(Uc, t) + Uc == 0
DE3 = Cr*Lr*diff(Uc, t, t) + Rr1*Cr*diff(Uc, t) + Uc == 0
DE4 = Cr*Lr*diff(Uc, t, t) + Rr2*Cr*diff(Uc, t) + Uc == 0


sol = dsolve (DE, Uc(0) == 10, diff(Uc)(0) == 0)
sol1 = dsolve (DE1, Uc(0) == 10, diff(Uc)(0) == 0)
sol2 = dsolve (DE2, Uc(0) == 10, diff(Uc)(0) == 0)
sol3 = dsolve (DE3, Uc(0) == 10, diff(Uc)(0) == 0)
sol4 = dsolve (DE4, Uc(0) == 10, diff(Uc)(0) == 0)
#casovna skala
t1 = 0 : .000001 : .002;

 ff   = function_handle(rhs(sol));
 ff01 = function_handle(rhs(sol1));
 ff07 = function_handle(rhs(sol2));
 ff1 = function_handle(rhs(sol3));
 ff2 = function_handle(rhs(sol4));
 
 
 y  = ff(t1);
 y1 = ff01(t1); 
 y2 = ff07(t1);
 y3 = ff1(t1);
 y4 = ff2(t1);
 
 plot(t1,y,'b', t1, y1, 'r', t1, y2, 'g', t1, y3, 'y', t1, y4, 'b')
 

#s^2 + 2*zeta*Wn*s + Wn^2 == 0;
% ............
%Wn = 1/sqrt(L*C)
%zeta = solve(2*zeta*Wn == L/R, zeta)
%

#1.b

  

#Diferencialna enacba


%sol = dsolve(DE)
%Vc = rhs (sol)
%L * diff(Vc, t)
%solve(Ln*Cn*s^2 + Rn*Cn*s + 1 == 0, s)
zeta = R/2 * sqrt(C/L);
vpasolve(0 == R/2 * sqrt(Cr/Lr), R, 1i)
vpasolve(0.1 == R/2 * sqrt(Cr / Lr), R, 1i)
vpasolve(0.7 == R/2 * sqrt(Cr / Lr), R, 1i)
vpasolve(1 == R/2 * sqrt(Cr / Lr), R, 1i)
vpasolve(2 == R/2 * sqrt(Cr / Lr), R, 1i)
%Er = Lr*Cr*s^2 + Rr*Cr*s + 1 == 0
%E = L*C*s^2 + R*C*s + 1 == 0
%solve(E, s)