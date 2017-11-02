clear all; close all;


L = 1 / 100;
C = 1 / 1000000;

Real_Imag_m = [];
Real_m = [];
Imag_m = [];

# Predpostavite, da sta L in C konstantna, in sicer L = 10 mH in C = 1 µF, upornost R pa
# naj se spreminja v območju od 0 do ∞. Določite območja vrednosti R, pri katerih sta
# karakteristična korena: i) čisto imaginarna, ii) kompleksna, iii) realna.

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

printf("Rezultati meritev:\n");
printf("s = -R/2L -(sqrt(C*(C*R^2 - 4*L))/(2* C * L)) \n");

printf("\tReal s values [ohm]:\n");
for i = 1:length(Real_m(:,1))
  printf("R = %d ->  s = Re[%f] Ω \n",Real_m(i,1),  Real_m(i,2));
end

printf("\n\tReal and Imaginary  R [ohm]\n\n");
for i = 1:length(Real_Imag_m(:,1))
  printf("R = %d -> s = Re[%f] + Im[%f] Ω \n", Real_Imag_m(i,1),  Real_Imag_m(i,2), Real_Imag_m(i,3));
end

printf("\tImaganery R [ohm]\n %f \n", Imag_m);
if(length(Imag_m) != 0)
   for i = 1:length(Imag_m)
    printf("R = %d -> s = Im[%f] Ω \n",Imag_m(:,1),  Imag_m(:,2));
  endfor

else
  printf("EMPTY!\n");
end