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

##1.a
 
syms Uc(t) Vc(t) 
syms s 
syms x real
DE = C*L*diff(Uc, t, t) + R*C*diff(Uc, t) + Uc == 0

Er = Lr*Cr*s^2 + Rr*Cr*s + 1 == 0
E = L*C*s^2 + R*C*s + 1 == 0
solve(E, s)

#s^2 + 2*zeta*Wn*s + Wn^2 == 0;
Wn = 1/sqrt(L*C)
zeta = solve(2*zeta*Wn == L/R, zeta)


#1.b

  

#Diferencialna enacba


%sol = dsolve(DE)
%Vc = rhs (sol)
%L * diff(Vc, t)
%solve(Ln*Cn*s^2 + Rn*Cn*s + 1 == 0, s)
vpasolve(Lr*Cr*s^2 + Rr*Cr*s + 1 == 0, s, 1i)

