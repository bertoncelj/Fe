clear all; close all;


numer = 4500 * [1 18 900]
denom = [1 1180 188100 8100000]
%denom=conv([1/9600^2 1.8502/9600 1.2209],[1/9600^2 0.41128/9600 0.65519])

sys = tf(numer,denom);

#First part
fig1 = figure(1);
w = logspace(-1, 5, 200); % 900 pt w vector from 1krad/s (10^1) to 1Mrad/s (10^18)
[mag_basic, phase_basic] = bode(sys, w);
bode(sys, w);
pause(1);


#Upper
num1 = [1/900 18/900 1]; 
den1 = [1];
sys1 = tf(num1,den1);
[mag1, phase1] = bode(sys1, w);
dbmag1 = 20*log10(mag1);

#Downner
num2 = [1]; 
den2 = [1/8100 180/8100 1];
sys2 = tf(num2, den2);
[mag2, phase2] = bode(sys2, w);
dbmag2 = 20*log10(mag2);
dbamp_test = 20*log10(30)


fig2 = figure(2);
 
  
  semilogx(w, mag_basic,  'k', 'LineWidth', 2); 
  hold on;
       
  semilogx(w, dbmag1, 'g', 'LineWidth', 2); 
  hold on;
 
  semilogx(w, dbmag2, 'm', 'LineWidth', 2);
  hold on;
 
  axis([1e0 1e4 -20 40]);
  xlabel('frekvenca {\itw} [rad/s]'); 
  ylabel('{\itM} [dB]');
  grid on; title('Amplitudna karakteristika');
pause(2);

fig3 = figure(3);

 semilogx(w, phase_basic,  'k', 'LineWidth', 2); 
 hold on;
 
 semilogx(w, phase1, 'g', 'LineWidth', 2); 
 hold on;
 
 semilogx(w, phase2, 'm', 'LineWidth', 2); 
 hold on;
 
 axis([1e0 1e4 -200 200]);
 xlabel('frekvenca {\itw} [rad/s]'); 
 ylabel('{\itfi} [^o]');
 grid on; title('Fazna karakteristika')
 pause(3);
 
#Second part
