syms x(t) s X;

a0 = -3;
x0 = 4;
rhs = t^2;

lhs = diff(x,t) + a0*x;
ode = lhs - rhs

Lx = X;
LDx = s*X - x0;
LHS = LDx + a0*Lx;
RHS = laplace(rhs,t,s);
IVP = LHS - RHS;

IVP = collect(IVP,X);

X = solve(IVP, X);
X = partfrac(X);

sol = ilaplace(X, s, t)
check1 = diff(sol,t) - 3*sol
check2 = vpa(subs(sol, t, 0))