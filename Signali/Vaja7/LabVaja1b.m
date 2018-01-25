#LabSignaliVaja 1a

#         K                 1 
# H(s) = ---   ------------------------------
#        Wn^₂   1 + 2*zeta*(s)/Wn + s^2/Wn^2
 

close all; clear all; clc;
#BODE  2 order
#Nastavitve 
  %w od kje do kje risat
  w = logspace(-2,3, 1000);  #Frekvenca od kje rasati
  r_zac = 1e-2;
  r_kon = 1e3; 
  %Nastevitem magnetud amplitudnega grafa
  mag_low = -60;    
  mag_high = 20;
  #zapisemo ulomek kar direktno iz enacbe
  
  zeta = [0.1, 0.2, 0.3, 0.5, 0.7, 1]
  barva = ['k', 'r', 'g', 'b', 'y', 'm'];
  
  Mrb = 20 * log10(1 ./(2 .*zeta.*sqrt(1-zeta.^2)));
  printf("All resonace summit:\n");
  
  for i=1:length(zeta)
  
  wn = 1; 

  num =  1 * [ 1 ];
  den = [1 2*zeta(i) 1];
 

  
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
%poli = [r_zac, 30,  90, 1000, r_kon]

#Oznacimo zacetek in konec
  razpone = [r_zac r_kon];
  
  printf("\t Zeta: %f -> Mrb = %f\n", zeta(i) ,Mrb(i))

#==============AMPLITUDE=====================
#====REAL DIAGRAM?==============
  fig1 = figure(1);
  set(fig1,'Units','centimeters','Position',[5 2 20 18]);
  %Bode Graph Computer Real Line
   hold on;
  semilogx(w, dbmag, barva(i), 'LineWidth', 2); hold on;

  
  axis([ razpone mag_low mag_high])
  endfor
   xlabel('frekvenca {\itw} [rad/s]'); ylabel('{\itM} [dB]');
   legend("Zeta -> 0.1", "Zeta -> 0.2", "Zeta -> 0.3", "Zeta -> 0.5", "Zeta -> 0.7", "Zeta -> 1");
  grid on; title('Amplitudna karakteristika');
 
 pause(1);
 
 
 #=================PHASE=========================
   for i=1:length(zeta)
    wn = 1; 

  num =  1 * [ 1 ];
  den = [1 2*zeta(i) 1];
 

 #PHASE
 #BODE COMPUTER DRAW =======  
  #naredimo system matriko
  sys = tf(num, den);
  #pretvori v bode
  [mag, phase] = bode(sys, w);
  phase;
  

  %poiscemo zeto numerator
  zeta_num = 18/(2*sqrt(900));
  wn = 30;
  %poiscemo zeto dominator
  zeta_dom = 1;

#Prepisani poli, nicle, konstanta    
  a = 5;
  b = 30;
  c = 90;
  d = 1000;

#Zapisemo v vektor "frekvenc", za manj pisanja in racunaja pri izrisu grafa
%poli = [r_zac, 30,  90, 1000, r_kon]

#Oznacimo zacetek in konec
  razpone = [r_zac r_kon];
  

#Draw diagrom
  fig1 = figure(2);
  set(fig1,'Units','centimeters','Position',[5 2 20 18]);
  %Bode Graph Computer Real Line
   hold on;
  semilogx(w, phase, barva(i), 'LineWidth', 2); hold on;

  
  axis([ razpone mag_low mag_high])
   
   
   endfor
  xlabel('frekvenca {\itw} [rad/s]'); ylabel('{\itfi} [^o]');
  grid on; title('Fazna karakteristika') 
  legend("Zeta -> 0.1", "Zeta -> 0.2", "Zeta -> 0.3", "Zeta -> 0.5", "Zeta -> 0.7", "Zeta -> 1");

 
 pause(2);
 
 
#==================POLAR DIAGRAM========================
for i= 1:length(zeta)

  num =  1 * [ 1 ];
  den = [1 2*zeta(i) 1];
  sys = tf(num, den);
  [re, im] = nyquist(sys, w);
 fig2 = figure(3);
  
  hold on;
  plot(re, im, barva(i)); grid on;
  
  endfor;
  xlabel('Re [H(jw)]'); ylabel('Im [H(jw)]');
  legend("Zeta -> 0.1", "Zeta -> 0.2", "Zeta -> 0.3", "Zeta -> 0.5", "Zeta -> 0.7", "Zeta -> 1");
  title('Polarni diagram'); 
 pause(3);

 