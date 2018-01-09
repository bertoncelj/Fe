#LabVaja1c

G0  = vpa('10000', 32);
wp1 = vpa('100000', 32);
wp2 = vpa('1000000', 32);
wp3 = vpa('10000000', 32);



a3 = 1;
a2 = wp1 + wp2 + wp3;
a1 = wp1*wp2 + wp1*wp3 + wp2*wp3;
a0 = wp1*wp2*wp3;

syms w
leva  = G0*wp1*wp2*wp3;
desna = (wp1 + wp2 + wp3)*(-w^2) + wp1 + wp2 +wp3;
a = -1;

for i = 1/10 : 1/10 : 1
  i_vpa = vpa(i, 32);
  solve(leva*i_vpa == a*desna, w)
    
endfor