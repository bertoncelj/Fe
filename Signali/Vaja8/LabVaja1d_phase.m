close all; clear all; clc;
#Bode digram

#                    G0
# G(s) = ------------------------------
#         (1+s/wp1)(1+s/wp2)(1+s/wp3)


#Nastavitve 
  %w od kje do kje risat
  w = logspace(3,8, 10000);  #Frekvenca od kje rasati
  r_zac = 1e3;
  r_kon = 1e8; 
  razpone = [r_zac r_kon];
  %Nastevitem magnetud amplitudnega grafa
  mag_low =  -180;    
  mag_high = 180;

#Data:
wp1 = 10^5;
wp2 = 10^6;
wp3 = 10^7;

 barva = ['k', 'r', 'm', 'b', 'y', 'm'];
#G(s)
  %Numerator
  G0 = 10^4;
  
  %Dominator
  a3 = 1;
  a2 = wp1 + wp2 + wp3;
  a1 = wp1*wp2 + wp1*wp3 + wp2*wp3;
  a0 = wp1*wp2*wp3;

  #Draw Bode of G(s)
  num = [G0*wp1*wp2*wp3];
  den = [a3 a2 a1 a0];
  
  sys = tf(num, den);
  [mag, phase] = bode(sys, w);
  dbmag = 20*log10(mag);

  fig1 = figure(1);
  %Bode Graph Computer Real Line
  semilogx(w, phase, 'g', 'LineWidth', 2); 
  hold on;

 
#H(s)
  %Numerator
  G0 = 10^4;
  B = [ 0.012210 0.00148  0.2265];
 for i = 1:length(B);
  %Dominator
  a3 = 1;
  a2 = wp1 + wp2 + wp3;
  a1 = wp1*wp2 + wp1*wp3 + wp2*wp3;
  a0 = wp1*wp2*wp3*(1 + B(i)*G0);
    
  #Draw Bode of G(s)
  num = [G0*wp1*wp2*wp3];
  den = [a3 a2 a1 a0];
  
  sys = tf(num, den);
  [mag, phase] = bode(sys, w);
  dbmag = 20*log10(mag);
  
 
  #Draw
 
  semilogx(w, phase, barva(i), 'LineWidth', 2);
  endfor
 axis([ razpone -300 mag_high])
 xlabel('frekvencaa {\itw} [rad/s]'); ylabel('{\itM} [dB]');
  legend("Original", "Beta1", "Beta 2", "Beta 3")
 grid on; title('Phase karakteristika');
 pause(1);


#======













