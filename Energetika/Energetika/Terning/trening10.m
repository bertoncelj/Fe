%konstante
  a = 7083.234;
  b = 7.262;
  c = -1.818;
  d = -0.02196;
  e = 0.1625;
  f = -823.913;
  v = (1:0.01:120);

 %enacba
 

  P1 = (a + (c*v) + e * (v.^ 2));
  P2 = (1+ (b*v) + d * (v.^2));
  
  P = P1./P2 + (f./v);
  f = @a * t;
  laplace_cdf(f, t)
  plot(v,P,'r')
  
  %minimum
  [C,Max] = max(P)
  v(Max)
  [C,Min] = min(P)
  v(Min)
%  max (max(v, P))
% [max_p, max_v] = max(P)
% [min_p, min_v] = min(P)
  
 %x = fminsearch(P,[0:0]);