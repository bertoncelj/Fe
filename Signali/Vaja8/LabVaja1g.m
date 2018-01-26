close all; clear all; clc;

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
  w = logspace(0,10, 1000);  #Frekvenca od kje rasati
  r_zac = 1e0;
  r_kon = 1e10; 
  razpone = [r_zac r_kon];
  %Nastevitem magnetud amplitudnega grafa
  mag_low  =  -100;    
  mag_high =  100;

#Data:
wp1 = 10^5;
wp2 = 10^6;
wp3 = 10^7;
wp4 = 10;

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
  
  sys1 = tf(num, den);
  [mag1, phase1] = bode(sys1, w);
  dbmag1 = 20*log10(mag1);

  fig1 = figure(1);
  %Bode Graph Computer Real Line
  semilogx(w, dbmag1, 'r', 'LineWidth', 2); 
  hold on;
 
  
# 2 DEL-> dodamo nov pol wd4

 #Bode digram


# Sistem G(jω) brez povratne vezave
#                          G0
# G(s) = --------------------------------------
#         (1+s/wp1)(1+s/wp2)(1+s/wp3)(1+s/wp4)


# Sistem celotnega sistema H(jω)
#             G(s)
# H(s) = --------------
#         1 + K(s)*G(s)

#Poli:

  a4 = 1;
  a3 = wp1 + wp2 + wp3 + wp4;
  a2 = wp1*wp3 + wp1*wp4 + wp2*wp3 + wp2*wp4 + wp1*wp2 + wp3*wp4;
  a1 = wp1*wp2*wp3 + wp1*wp2*wp4 + wp1*wp3*wp4 + wp2*wp3*wp4;
  a0 = wp1*wp2*wp3*wp4

  #Draw Bode of G(s)
  num = [G0*wp1*wp2*wp3*wp4];
  den = [a4 a3 a2 a1 a0];
  
  sys2 = tf(num, den);
  [mag2, phase2] = bode(sys2, w);
   dbmag2 = 20*log10(mag2);

  %Bode Graph Computer Real Line
  semilogx(w, dbmag2, 'b', 'LineWidth', 2); 
  hold on;
   
  axis([ razpone mag_low mag_high])
  xlabel('frekvencaa {\itw} [rad/s]'); ylabel('{\itM} [dB]');
  legend("Original", "z dodatnim polom wd4=10")
  grid on; 
  title('Amplitudna karakteristika z in brez dodatnim polom');
  pause(1);
  
#PHASE

phase_graph = figure(2)
  hold on;
  semilogx(w, phase1, 'r', 'LineWidth', 2);
  semilogx(w, phase2, 'b', 'LineWidth', 2);
  axis([ razpone -300 mag_high])
   xlabel('frekvencaa {\itw} [rad/s]'); ylabel('{\itM} [dB]');
  legend("Original", "z dodatnim polom wd4=10")
  grid on; title('Phase karakteristika');
  
  pause(2);

