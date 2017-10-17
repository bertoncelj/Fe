

%1.B Signal trikotne oblike s casom 5s, start t = 2s in vrh B = 6 v casu t =6s
clear all; close all;

dt = 0.001;  %časovni inkrement

%stopnica 
%casovni inkremnt
A = -2;
  
  t1 = -5 : dt : -1;  u1 = zeros(size(t1));
  t2 = -1 : dt : -1  
  u2 = A * ones(size(t2));
  t3 = -1 : dt : 0;   u3 = -2t3;
  
  
  t = [t1 t2 t3];
  u = [u1 u2 u3];

%definiranje časovnih območji in vrednosti signalov

%t1 = -1 : dt : 2; r1 = zeros(size(t1));
%t2 =  2 : dt : 6; r2 = 5/4 * (t2 - 2);
%t3 = 6 : dt : 7; r3 = -5 * (t3 - 7);
%t4 = 7 : dt : 10; r4 = zeros(size(t4));

%časovni in signalni vektor

plot(t, u, 'LineWidth', 2);

%1.B Drawing 

axis([-2 8 -5 5]);
grid;
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
xlabel('čas {\itt} [s]'); ylabel('{\itr}({\itt})');
title('Enotina strmina');
