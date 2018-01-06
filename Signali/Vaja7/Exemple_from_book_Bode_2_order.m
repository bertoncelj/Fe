#primer z knjige Signali in Sistemi
#Primer 6.7, stran: 256!
#            110s
# H(s) = ------------------- 
#          s^2 + 110*s + 1000
 
close all; clear all; clc;
#BODE  2 order
#Nastavitve 
  %w od kje do kje risat
  w = logspace(-1,4);
  r_zac = 1e-1;
  r_kon = 1e4; 
  mag_low = -40;
  mag_high = 20;
  #zapisemo ulomek
  num = [110 0];
  den = [1 110 1000];
#naredimo system matriko
sys = tf(num, den);
#pretvori v bode
[mag, phase] = bode(sys, w);
dbmag = 20*log10(mag);

#apsimthote
a = 0.11;
b = 1;
c = 10;
d = 100;

 poli = [r_zac, 1,  10, 100, r_kon]
#Oznacimo zacetek in konec
razpone = [r_zac r_kon];

fig1 = figure(1);
set(fig1,'Units','centimeters','Position',[5 2 20 18]);

 semilogx(w, dbmag, 'g', 'LineWidth', 2); hold on;
 #AAAAA
 a_log = 20*log10(a);
 semilogx(razpone, [a_log a_log], 'r--');
 
 #BBBBBBBB
 semilogx([r_zac 1e1], [-20 20]);

 
 #CCCCCCCCCCCc
  semilogx([r_zac poli(3)], [0 0], 'm--', [poli(3) 1e3], [0, -40], 'm--')
 
 #DDDDDDDDDDD
 semilogx([r_zac poli(4)], [0 0], 'c--', [poli(4) 1e4], [0, -40], 'c--')


 ##SKUPAJ
 a_z =  20*log10(a)
 b_z =  20*log10(poli./b) 
 c_z = -20*log10(sqrt(1+(poli./c).^2))
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
a_z
b_z
c_z
d_z
 z = a_z + b_z + c_z + d_z

 for i = 1:length(poli)-1
  semilogx([poli(i) poli(i+1)], [z(i), z(i+1)] , 'k'  )
 endfor
 axis([ razpone mag_low mag_high])
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
 
 semilogx([r_zac r_kon], [90 90], 'b--');
 

 
% #CCCCCCCCCCCc
  c_draw = -atand(c)
  semilogx([r_zac poli(3)/10], [0 0], 'b--', [poli(3)/10 poli(3)*10], [0 -90], 'b--', [poli(3)*10 r_kon], [-90 -90], 'b--');

% #DDDDDDDDDDD
 semilogx([r_zac poli(4)/10], [0 0], 'c--', [poli(4)/10 poli(4)*10], [0 -90], 'c--', [poli(4)*10 r_kon], [-90 -90], 'c--');


% ##SKUPAJ
 a_z =  0
 b_z =  90
 c_z = -atand(poli./c)
 d_z = -atand(poli./d)
 
 for i=1:length(poli)
  if(abs(c_z(i)) < 3.5)
    c_z(i) = 0;
  endif
  
  
  if(abs(d_z(i)) < 3.5)
    d_z(i) = 0;
  endif
 endfor

 z = a_z + b_z + c_z + d_z

  semilogx([poli(1) poli(2)], [z(1) z(1)] , 'k');
  semilogx([poli(2) poli(3)], [z(1)  45 ] , 'k');
  semilogx([poli(3) poli(3)*10], [45  -45 ] , 'k')
  semilogx([poli(3)*10 poli(3)*100], [-45  -90 ] , 'k')
  semilogx([poli(3)*100 r_kon], [-90 -90], 'k')
 axis([ razpone -100 100])
 xlabel('frekvenca {\itw} [rad/s]'); ylabel('{\itfi} [^o]');
 grid on; title('Fazna karakteristika') 
 pause(2);