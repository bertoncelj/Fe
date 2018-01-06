close all; clear all; clc;
#Nastavitve 
  %w od kje do kje
  w = logspace(-3,3); 
  #zapisemo ulomek
  num = [4 0.4];
  den = [1 2 0];
#naredimo system matriko
sys = tf(num, den);
#pretvori v bode
[mag, phase] = bode(sys, w);
dbmag = 20*log10(mag);

#apsimthote
a = 0.2;
b = 0.1;
c = 1;
d = 2;
#apsimthote
a = 0.2;
b = 0.1;
c = 1;
d = 2;
d1 = -20*log10(1000/2)

r_zac = 1e-2;
r_kon = 1e2;
razpone = [1e-2 1e2];

fig1 = figure(1);
set(fig1,'Units','centimeters','Position',[5 2 20 18]);

 semilogx(w, dbmag, 'g', 'LineWidth', 2); hold on;
 #AAAAA
 a_log = 20*log10(a);
 semilogx(razpone, [a_log a_log], 'r--');
 
 #BBBBBBBB
 semilogx([r_zac 1e-1], [0 0], 'b--', [1e-1 1e2], [0 60], 'b--');

 
 #CCCCCCCCCCCc
 semilogx(razpone, [40 -40],'m--')
 
 #DDDDDDDDDDD
 semilogx([r_zac 2], [0 0], 'c--', [2 1e3], [0, -53], 'c--')

 poli = [r_zac, 1e-1, 2, r_kon]
 ##SKUPAJ
 a_z =  20*log10(a)
 b_z =  20*log10(sqrt(1+(poli./b).^2)) 
 c_z = -20*log10(poli./c)
 d_z = -20*log10(sqrt(1+(poli./d).^2))
 for i=1:length(poli)
  if(abs(b_z(i)) < 3.5)
    b_z(i) = 0;
  endif
  
  if(abs(c_z(i)) < 3.5)
    c_z(i) = 0;
  endif
  
  if(abs(d_z(i)) < 3.5)
    d_z(i) = 0;
  endif
 endfor

 z = a_z + b_z + c_z + d_z

 for i = 1:length(poli)-1
  semilogx([poli(i) poli(i+1)], [z(i), z(i+1)] , 'k'  )
 endfor
 axis([ razpone -40 40])
 xlabel('frekvenca {\itw} [rad/s]'); ylabel('{\itM} [dB]');
 legend("function", "a", "b", "c", "d");
 grid on; title('Amplitudna karakteristika');
 pause(1);
 
 
 #############################PHASE########################

 
 fig1 = figure(2);
set(fig1,'Units','centimeters','Position',[5 2 20 18]);

 semilogx(w, phase, 'g--', 'LineWidth', 2); hold on;
 #AAAAA
 a_draw = atand(a)
 semilogx(razpone, [a_draw a_draw], 'r--');
 
 #BBBBBBBB
  #tle je treba se za zacetek narest
 

 semilogx([r_zac poli(2)/10], [0 0], 'b--', [poli(2)/10 poli(2)*10], [0 90], 'b--', [poli(2)*10 r_kon], [90 90], 'b--');

 
% #CCCCCCCCCCCc
  c_draw = -atand(c)
  semilogx([r_zac r_kon], [-90 -90], 'm--');

% #DDDDDDDDDDD
 semilogx([r_zac poli(3)/10], [0 0], 'c--', [poli(3)/10 poli(3)*10], [0 -90], 'c--', [poli(3)*10 r_kon], [-90 -90], 'c--');


% ##SKUPAJ
 a_z =  0
 b_z =  atand(poli./b) 
 c_z = -90
 d_z = -atand(poli./d)
 for i=1:length(poli)
  if(abs(b_z(i)) < 3.5)
    b_z(i) = 0;
  endif
  
  
  if(abs(d_z(i)) < 3.5)
    d_z(i) = 0;
  endif
 endfor

 z = a_z + b_z + c_z + d_z

  semilogx([poli(1) poli(2)/10], [z(1), z(1)] , 'k');
  semilogx([poli(2)/10 poli(3)/10], [z(1), -30] , 'k');
  
  semilogx([poli(3)/10 poli(2)*10], [-30 -30] , 'k');
  semilogx([poli(2)*10 poli(3)*10], [-30, -90] , 'k')
  semilogx([poli(3)*10 r_kon], [-90, -90] , 'k')
 axis([ razpone -100 100])
 xlabel('frekvenca {\itw} [rad/s]'); ylabel('{\itfi} [^o]');
 grid on; title('Fazna karakteristika') 
 pause(2);