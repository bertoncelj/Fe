%x = sym ('x', 'negative', 'integer')
%A = sym ('A', [2,4])
%
%f = @(n, x) sin(pi*besselj (n, x)/2)
%sym(f)
syms y(x)
C = 10; 
DE = 3*C*diff(y, x, x) - 4*y == 0 

solve = dsolve(DE, y(0) == 1)
rhs(solve)