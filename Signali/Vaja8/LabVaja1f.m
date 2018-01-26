clear all; close all
#LabVaja1f
%1.f Za vse primere pod c. narišite časovne odzive na enotino stopnico in jih opišite.

#definiran cas
  t = 0:0.00000001:0.0001;

#Data za polinom
G0 = 10^4;
wp1 = 10^5;
wp2 = 10^6;
wp3 = 10^7;

#Za izris grafa nastavljeni vektorji, za vsako beto posebej
  barva = ['k', 'r', 'm', 'b', 'y', 'm'];
  barve = ['r', 'b', 'g', 'm', 'k'];
  B = [0 0.012210 0.00148  0.2265];
  naslov_grafa = ["Brez povratne zanke"; "mejno stabilen"; "Stabilen"; "Nestabilen"];
  osi_mag = [0, 10000, 180, 900];
  osi_cas = [0.0001, 2e-05, 6e-05];
 
 
  # DRAW GRAPHS
  # Imamo brez povratne, mejno in stabilen tlele
  for i = 1:length(B) - 1
  
    a3 = 1; 
    a2 = wp1 + wp2 + wp3;
    a1 = wp1*wp2 + wp1*wp3 + wp2*wp3;
    a0 = wp1*wp2*wp3*(1 + B(i)*G0);
    
    num = [G0*wp1*wp2*wp3];
    den = [a3 a2 a1 a0];
    sys = tf(num, den);
    y = step(sys, t);
      
    fig = figure(i)
    plot(t, y, barve(i));
    axis([0 osi_cas(i) osi_mag(1) osi_mag(i+1)]);
    call_string = cellstr(naslov_grafa);
    title(call_string(i));
    pause(i);
  endfor
  
  # NESTABILEN
  # Za nestabilen je posebej graf
  %   Razlaga: Problem je bil, ko je step func bila racunana je dobu prevlke vrednosti za izris nekej na e^124
  %   Zato se ga posebej racuna, da se vzame samo nekej 1000 prvih rezultatov in graf omeji njegov casovn raznose
  
  # Poracunamo senkrat polinosko enacbo za nestabilen sistem
  printf("Calculating NESTABILEM sistem. \n Please waite... \n");
  a3 = 1; 
  a2 = wp1 + wp2 + wp3;
  a1 = wp1*wp2 + wp1*wp3 + wp2*wp3;
  a0 = wp1*wp2*wp3*(1 + B(4)*G0);
  
  num = [G0*wp1*wp2*wp3];
  den = [a3 a2 a1 a0];
  sys = tf(num, den);
  y = step(sys, t); 

  #Vzamemo samo prvih 1000 vrenosti y in t (casa)
  y = y(1:1000);
  t = t(1:1000);
  
  #Zasiftamo y v levo, in mu spredej dodamo nekej null, enako za cas, samo da mu na koncu dodamo enke
  a = zeros(45,1:45)';
  ones = ones(45,1:45)';
  y_shift = vertcat(a', y) ;
  t_shift = vertcat(t', ones');

  printf("Done calculating!\n");
  #Izris grafa NESTABILEN
  fig = figure(4)
  plot(t_shift, y_shift, barve(4))
  axis([0 3e-06 -30 30])
  title(call_string(4));
  pause(4)
