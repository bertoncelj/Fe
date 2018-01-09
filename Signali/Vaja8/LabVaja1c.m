#LabVaja1c

G0  = vpa('10000', 32);
wp1 = vpa('100000', 32);
wp2 = vpa('1000000', 32);
wp3 = vpa('10000000', 32);

syms w B

a3 = 1;
a2 = wp1 + wp2 + wp3;
a1 = wp1*wp2 + wp1*wp3 + wp2*wp3;
a0 = wp1*wp2*wp3*(1 + B*G0);



leva  = G0*wp1*wp2*wp3;
desna = (wp1 + wp2 + wp3)*(-w^2) + wp1 + wp2 +wp3;
imag_desna = (-w^3 + w*a1)
a = -1;
#Tle rabs dva dela realnga in imaginarnga;

  #REAL PART
  printf("Real.\n");
  solve(leva*B == a*desna, w, B)
  
  #IMAG PART
  printf("IAMG.\n");
  solve(0 == a*imag_desna, w)
   
