syms x(t) s X;

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

coeff = coeffs(IVP,X)
IVPEQ = coeff*[1;X] == 0

X = solve(IVPEQ,X)

X = partfrac(X)

sol = ilaplace(X, s, t)

Dsol = diff(sol,t);
D2sol = diff(sol,t,2);
check1 = D2sol + a1*Dsol + a0*sol
check2 = vpa(subs(sol, t, 0))
check3 = vpa(subs(Dsol, t, 0))