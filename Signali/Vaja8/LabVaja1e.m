close all; clear all; clc;
#Bode digram Phase

#                    G0
# G(s) = ------------------------------
#         (1+s/wp1)(1+s/wp2)(1+s/wp3)


#Nastavitve 
  %w od kje do kje risat
  w = logspace(3,8, 1000);  #Frekvenca od kje rasati
  %Nastevitem magnetud amplitudnega grafa


#Data:
wp1 = 10^5;
wp2 = 10^6;
wp3 = 10^7;
 
 %Nastavitve za risanje grafa
 naslov_grafa = [ "mejno stabilen"; "Stabilen"; "Nestabilen"];
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
  [re, im] = nyquist(sys, w);

  fig1 = figure(1);
  %Bode Graph Computer Real Line
  #plot(re, im, 'g'); 
  grid on; 
  hold on;

 #Enotski krog
 x = -0.707; y = 0.707; y1 = -0.707;
 k = 0:0.01:2*pi; re = cos(k); im = sin(k);
 plot(re, im, 'b')
 
#H(s) 
  %Numerator
  G0 = 10^4;
  B = [ 0.012210 0.00148  0.2265];
 for i = 1:length(B);
  %Dominator
  a3 = 1;
  a2 = wp1 + wp2 + wp3;
  a1 = wp1*wp2 + wp1*wp3 + wp2*wp3;
  a0 = wp1*wp2*wp3;
    
  #Draw Bode of G(s)
  num = [G0*wp1*wp2*wp3*B(i)];
  den = [a3 a2 a1 a0];
  
  sys = tf(num, den);
  [re, im] = nyquist(sys, w);
 
  #Draw 
  plot(re, im, barva(i));
  endfor
  axis([-2 2 -2 2])
  call_string = cellstr(naslov_grafa);
  legend(["-", call_string(1), call_string(2), call_string(3)])
  xlabel('Re [H(jw)]'); ylabel('Im [H(jw)]');
  title('Polarni diagram'); 
 pause(1);


#======













