
clear all; close all;
L = 1 / 100;
C = 1 / 1000000;

Real_Imag_m = [];
Real_m = [];
Imag_m = [];

rm = 1; im = 1; ri = 1;
printf("STARTEN!!! \n");
for R = 1:1000
    en = -R/(2*L) - (sqrt(C* (C*R^2 - 4*L)) / (2 * C * L));
    
	  if(imag(en) == 0)
      %printf("Real: %d on R: %d \n", en, R);
      Real_m = [Real_m; R, real(en)];
      
    elseif (real(en) == 0)
      Imag_m = [Imag_m; R, imag(en)];
      
    else
      %printf("Imag: %d %d  on R: %d \n", real(en), imag(en), R);
      Real_Imag_m = [Real_Imag_m; R, real(en), imag(en)];
      
    endif
end
Real_m
Real_Imag_m
Imag_m
