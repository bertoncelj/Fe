syms x(t) s X;

a0 = -3;
x0 = 4;
rhs = t^2;

lhs = diff(x,t) + a0*x;
ode = lhs - rhs

Lx = X;
LDx = s*X - x0;
LHS = LDx + a0*Lx;
RHS = laplace(rhs,t,s); % The t and s in laplace aren't necessary, as they are default
IVP = LHS - RHS;

coeff = coeffs(IVP,X)
IVPEQ = coeff*[1;X] == 0;

X = solve(IVPEQ,X)

X = partfrac(X)

sol = ilaplace(X, s, t)

Dsol = diff(sol,t);
check1 = Dsol + a0*sol
check2 = vpa(subs(sol, t, 0))