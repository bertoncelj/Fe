syms x(t) s X;
R1 = 1; 
R2 = 1; 
gm = 1; 
C1 = vpa ('1 / 4', 32);     %Farad
C2 = vpa('1/2', 32);        %Farad
L = vpa('1/2', 32);         %Henry


rhs = sin(2*t) + 0.2*sin(20*t) + 0.1*sin(100*t);

#x -> Uizh
a1 =-2;
a0 = -3;
x0 = 4;
xdot0 = 5;
rhs = t^2;

Dx = diff(x,t);
D2x = diff(x,t,2);
lhs = D2x + a1*Dx + a0*x;
ode = lhs - rhs

Lx = X ;
LDx = s*X - x0;
LD2x = s^2*X - x0*s - xdot0;
LHS = LD2x + a1*LDx + a0*Lx;
RHS = laplace(rhs,t,s);% The t and s in laplace aren't necessary, as they are default
IVP = LHS - RHS

lhs = R1*C1*L*C2*diff(x,t,t,t) + C1*L*R2*R1*diff(x,t,t)+ R1*C2*diff(x,t) + R1(1/R2 - gm +1)*x
%ode = lhs - rhs
%D2x + a1*Dx + a0*x;
%%Lx = X
%%LDx = s*X - x0
%%LHS = LDx + a0*Lx
%LHS = laplace(lhs,t,s)
%RHS = laplace(rhs,t,s) % The t and s in laplace aren't necessary, as they are default
%IVP = LHS - RHS
%
%coeff = coeffs(X)
%IVPEQ = coeff*[1;X] == 0
%
%X = solve(IVPEQ,X)
%
%X = partfrac(X)
%
%sol = ilaplace(X, s, t)
%
%Dsol = diff(sol,t)
%check1 = Dsol + a0*sol
%check2 = vpa(subs(sol, t, 0))