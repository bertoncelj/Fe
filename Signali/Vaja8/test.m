#LabSignaliVaja 1a

#                    G0
# H(s) = ------------------------------
#         (1+s/wp1)(1+s/wp2)(1+s/wp3)

#For symbolic solutins we convert to "vpa"
%G0  = 10^4;
%wp1 = 10^5;
%wp2 = 10^6;
%wp3 = 10^7;

G0  = vpa('10000', 32);
wp1 = vpa('100000', 32);
wp2 = vpa('1000000', 32);
wp3 = vpa('10000000', 32);

# a.) S pomočjo Routhovega kriterija ugotovite, pri katerih vrednostih β je sistem stabilen,
#     nestabilen oz. mejno (ne)stabilen. 
#ROUTHOV KRITERIJ
     
# s^3 | a3  a1
# s^2 | a2  a0  
# s^1 | b1  b2
# s^0 | c1
#zapisemo enacbo 3 potence in poberemo vn koificjente

#define beta
syms B

a3 = 1;
a2 = wp1 + wp2 + wp3;
a1 = wp1*wp2 + wp1*wp3 + wp2*wp3;
a0 = wp1*wp2*wp3*(1 + B*G0);

b1 = (a2*a1 - a3*a0)/a2;
b2 = 0;

c1 = a0;
#First we solve for a0 and then for b1 and then c1
#RULE: it must be positive!
  % a0:
  solve(0 < a0, B)
  
  %b1:
  solve(0 < b1, B)
  
  %c1:
  solve(0 < c1, B)
 printf("Meja je za B (beta): %d \n", 1234);
 
# b. Z uporabo ukaza rlocus narišite diagram lege korenov v ravnini

#DIAGRAM LEGE KORENOV
%sybolic to numberic
Beta = [10^-4]; %ta je na roko not dana

a0
G0  = double(G0)
wp1 = double(wp1)
wp2 = double(wp2)
wp3 = double(wp3)

a0 = wp1*wp2*wp3*(1 + Beta*G0);
a1  = double(a1)
a2  = double(a2)
a3  = double(a3)

  num =  [G0*wp1*wp2*wp3]
  den = [a3 a2 a1 a0]
  
   sys = tf(num, den);
   #draw rlocus graphics_toolkit
   fig1 = figure(1);
    rlocus (sys)
    title("Diagram lege porenov");
    pause(1);


 
 