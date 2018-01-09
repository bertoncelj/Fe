clear all; close all
#LabVaja1f

t = 0:0.0000001:0.0001;

#Data:
wp1 = 10^5;
wp2 = 10^6;
wp3 = 10^7;

 barva = ['k', 'r', 'm', 'b', 'y', 'm'];
#G(s)
  %Numerator
  G0 = 10^4;
  barve = ['r', 'b', 'g', 'm', 'k']
  B = [ 0.012210 0.00148  0.2265];
  %Dominator
  a3 = 1; 
  a2 = wp1 + wp2 + wp3;
  a1 = wp1*wp2 + wp1*wp3 + wp2*wp3;
  a0 = wp1*wp2*wp3;
  
  
 
  #Draw Bode of G(s)
  for i = 1:length(B)
  fig = figure(i)
  num = [G0*wp1*wp2*wp3*B(i)];
  den = [a3 a2 a1 a0];
  sys = tf(num, den);
  y = step(sys, t);
  plot(t,y, barve(i))
  pause(i)
  endfor
  
  