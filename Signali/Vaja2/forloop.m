

L = 10;
C = 1;
for R = 1:1000
    en = -R/(2*L) - (sqrt(C* (C*R^2 - 4*L)) / (2 * C * L));
    
	  if(imag(en) == 0)
      printf("%d is Real \n", en);
    else
      printf("%d is Imag\n", en);
    endif
 
end