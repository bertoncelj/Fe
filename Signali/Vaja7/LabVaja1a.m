#LabSignaliVaja 1a

#            45000[s^2 + 18s +900]
# H(s) = ------------------------------
#            (s +90)^2 (s + 1000)
 

close all; clear all; clc;
#BODE  2 order
#Nastavitve 
  %w od kje do kje risat
  w = logspace(0,4);  #Frekvenca od kje rasati
  r_zac = 1e0
  r_kon = 1e4; 
  %Nastevitem magnetud amplitudnega grafa
  mag_low = -20;    
  mag_high = 40;
  #zapisemo ulomek kar direktno iz enacbe
  num =  45000 * [1 18 900];
  den = [1 1180 188100 8100000];
  
  
#BODE COMPUTER DRAW =======  
  #naredimo system matriko
  sys = tf(num, den);
  #pretvori v bode
  [mag, phase] = bode(sys, w);
  dbmag = 20*log10(mag);
#=========

#BODE 2 stopnje
#DRAW AOSINTOTE!!
  %poiscemo zeto numerator
  zeta_num = 18/(2*sqrt(900));
  wn = 30;
  %poiscemo zeto dominator
  zeta_dom = 1;
#apsimthote-> enacba pretvorjena, da dobimo pole in nicle
#            5*[1 + 2*0.3(s/30) + (s/30)^2]
# H(s) = -----------------------------------
#            (1+(s/90))^2 (1 + s/1000)
#V imenovalcu imamo a = 5 in 2 stopnje dode diagram zeta = 0.3;
   %posebej bomo morali računati amplitude in phase zaradi te značilnosti
#V števcu imamo 2 oklepaja. Prvi je Bode 2 stopnje, ampak je theta=1 in se lahko pretvori
    %v dva diagrama 1 stopnje, in se racuna vse x2.
    %Ta drug oklepaj je bode diagram 1 stopnje in se ga racuna po tastarem znanem postopku.

#Prepisani poli, nicle, konstanta    
a = 5;
b = 30;
c = 90;
d = 1000;

#Zapisemo v vektor "frekvenc", za manj pisanja in racunaja pri izrisu grafa
poli = [r_zac, 30,  90, 1000, r_kon]

#Oznacimo zacetek in konec
razpone = [r_zac r_kon];

#==============AMPLITUDE=====================

fig1 = figure(1);
set(fig1,'Units','centimeters','Position',[5 2 20 18]);
  %Bode Graph Computer Real Line
 semilogx(w, dbmag, 'g', 'LineWidth', 2); hold on;

 #_____________AMPSINTOTE___________________
 #A
 a_log = 20*log10(a);
 semilogx(razpone, [a_log a_log], 'r--');
 
 #B
 b_end = 40*log10(1e3/30)
 semilogx([r_zac 30], [0 0], 'b--', [30, 1e3], [0 b_end], 'b--');

 #C
  #Ker je zata=1, se lahko tega pretvori v 2dvojnega bodejovega
  % Zracunan padec je okoli -40dB. 
  c_end = -40*log10(r_kon/poli(3))
  semilogx([r_zac poli(3)], [0 0], 'm--', [poli(3) 1e3], [0, -40], 'm--')
 
 #D
 d_end = -20*log10(r_kon/poli(4))
 semilogx([r_zac poli(4)], [0 0], 'c--', [poli(4) r_kon], [0, d_end], 'c--')

 ##SKUPAJ
 a_z =  20*log10(a)
 b_z =   20*log10(sqrt( (1-(poli).^2./(b).^2).^2   +  (2*zeta_num.*(poli)./(b)).^2 )) 
 c_z =  -40* log10(sqrt(1+(poli./b).^2))
 c_z =  -20*log10(sqrt( (1-(poli).^2./(c).^2).^2   +  (2*zeta_dom.*(poli)./(c)).^2 )) 
 d_z = -20*log10(sqrt(1+(poli./d).^2))

  %Tukaj se napravi, zanka,kjer magnitude manjše od 3.5dB zamenjamo za 0
  %Razlog je bol naravnos in lepse crte dobimo
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
 %Vrednosti aplitud, za posamezne nicle, pole, ki jih rabimo pri izrisu
 z = a_z + b_z + c_z + d_z
 
 %Risemo ampsintote
  semilogx([poli(1) poli(2)], [z(1), z(1)] , 'k')
  semilogx([poli(2) poli(3)], [z(1), z(4)] , 'k')
  semilogx([poli(3) poli(4)], [z(4), z(4)] , 'k')
  semilogx([poli(4) poli(5)], [z(4), z(5)] , 'k')
 axis([ razpone mag_low mag_high])
 xlabel('frekvenca {\itw} [rad/s]'); ylabel('{\itM} [dB]');

 grid on; title('Amplitudna karakteristika');
 pause(1);

  #############################PHASE########################

fig1 = figure(2);
  set(fig1,'Units','centimeters','Position',[5 2 20 18]);
  semilogx(w, phase, 'g', 'LineWidth', 2); hold on;
 
 #A
 a_draw = atand(a)
 semilogx(razpone, [0 0], 'r--');
 
 #B
 semilogx([r_zac poli(2)*0.5], [0 0], 'b--', [poli(2)*0.5 poli(2)*2], [0 180], 'b--', [poli(2)*2 r_kon], [180 180], 'b--');


% #C
  c_draw = -atand(c)
  semilogx([r_zac poli(3)/10], [0 0], 'm--', [poli(3)/10 poli(3)*10], [0 -180], 'm--', [poli(3)*10 r_kon], [-180 -180], 'm--');

% #D
  semilogx([r_zac poli(4)/10], [0 0], 'c--', [poli(4)/10 poli(4)*10], [0 -90], 'c--', [poli(4)*10 r_kon], [-90 -90], 'c--');

% ##SKUPAJ
  %Tukaj je blo na uč narejeno iz primera iz knjige
  %Vrednosti so iz grafa iz ubenika pobrane kar se tiče stopinj (-12, 112, 87...)
  semilogx([r_zac poli(3)/10], [0 0] , 'k');
  semilogx([poli(3)/10 poli(2)*0.5], [0 -12] , 'k');
  semilogx([poli(2)*0.5 poli(2)*2], [-12  112 ] , 'k');
  
  semilogx([poli(2)*2 poli(4)/10], [112  87 ] , 'k')
  semilogx([poli(4)/10 poli(3)*10], [87  -45 ] , 'k')
  semilogx([poli(3)*10 r_kon], [-45  -90 ] , 'k')
  
 axis([ razpone -190 190])
 xlabel('frekvenca {\itw} [rad/s]'); ylabel('{\itfi} [^o]');
 grid on; title('Fazna karakteristika') 
 pause(2);
 