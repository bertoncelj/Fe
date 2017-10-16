function p = parametri(x, y, model, k)
% Poišče prarametre linearnega modela 
% F(p,t) = p1 + p2 * f1(x) + ... + pkfk(x) z metodo
% najmanjših kvadratov
%
% p parametri modela
% x in y sta vektorja vrednosti neodvisen spremenljivke 
% model je kazalec na funkcijo
% k je število parametrov 
%
% Primer uporable:
% model = @(p, x) p(1) + p(2)*x
% p = parametri([1;2;3;4], [1;2;1;2], model, 2)
% 

A = [];
I = eye(k);

% sestavimo matriko A
for i = 1:k
  % iz stoplca od matriko I izberemo samo I-ti parameter
  % iz modela in ga pomnožimo z x
  A = [A model(I(i, :), x')'];
endfor

% izracunamo parametre
p = A\y;

%!test
%! model = @(p, x) p(1) + p(2)*x;
%! p = parametri([1;2;3;4], [1;2;1;2], model, 2);
%! assert([1; 0.2], p, eps);

% testing exact values
%!test
%! model = @(p, x) p(1) + p(2).*x + p(3).*x.*x;
%! p = parametri([1;-1;-2], [3;-5;12], model, 3);
%! assert([-8;4;7], p, eps);

% testing allot of exact points
%!test
%! model = @(p, x) p(1).*x + p(2)*cos(x) + p(3)*sin(x);
%!  pm = [63, 43, 83];
%!  x = linspace(1, 200);
%!  y = model(pm, x);
%!  p = parametri(x', y', model, 3);
%! assert(pm', p, 1e-12);

% testing allot of points added +- 1
%!test
%! model = @(p, x) p(1).*x + p(2)*cos(x);
%!  pm = [1, 2];
%!  x = linspace(1, 200) + repmat([1,-1], 1, 100/2);
%!  y = model(pm, x);
%!  p = parametri(x', y', model, 2);
%! assert(pm', p, eps*10);