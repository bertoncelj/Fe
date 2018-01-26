close all; clear all; clc;
#Bode digram


# Sistem G(jω) brez povratne vezave
#                    G0
# G(s) = ------------------------------
#         (1+s/wp1)(1+s/wp2)(1+s/wp3)


# Sistem celotnega sistema H(jω)
#             G(s)
# H(s) = --------------
#         1 + K(s)*G(s)

#Nastavitve 
  %w od kje do kje risapt
  w = logspace(3,8, 1000);  #Frekvenca od kje rasati
  r_zac = 1e3;
  r_kon = 1e8; 
  razpone = [r_zac r_kon];
  %Nastevitem magnetud amplitudnega grafa
  mag_low  =  -20;    
  mag_high =  100;

#Data:
wp1 = 10^5;
wp2 = 10^6;
wp3 = 10^7;

 barva = ['k', 'r', 'm', 'b', 'y', 'm'];

#I. sistema G(jω) brez povratne vezave,

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
  semilogx(w, dbmag, 'g', 'LineWidth', 2); 
  hold on;

 
#II. celotnega sistema H(jω):
# 1. za vrednost β, pri kateri je sistem mejno (ne)stabilen,
# 2. za vrednost β, pri kateri je sistem stabilen in je fazni razloček ali fazna varnost Φm ≈ +45⁰,
# 3. za vrednost β, pri kateri je sistem nestabilen in je fazni razloček ali fazna varnost Φm ≈ ‒ 45⁰

  %Numerator
  G0 = 10^4;
  B = [ 0.012210 0.00148  0.2265]; # 1. mejno nestabilen, 2. stabilen s fazno varnostjo +45 3. nestabilen z fazno varnostjo -45
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
  [mag] = bode(sys, w);
  dbmag = 20*log10(mag);
  
 
  #Draw
  semilogx(w, dbmag, barva(i), 'LineWidth', 2);
  endfor
 axis([ razpone mag_low mag_high])
 xlabel('frekvencaa {\itw} [rad/s]'); ylabel('{\itM} [dB]');
  legend("Original", "mejno stabilen","stabilen","nestabilen")
 grid on; title('Amplitudna karakteristika');
 pause(1);


#======













