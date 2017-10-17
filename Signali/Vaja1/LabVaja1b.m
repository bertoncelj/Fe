%1.B Signal trikotne oblike s casom 5s, start t = 2s in vrh B = 6 v casu t =6s
clear all; close all;

dt = 0.001;  %časovni inkrement
 
%definiranje časovnih območji in vrednosti signalov
t1 = 0 : dt : 2; r1 = zeros(size(t1));
t2 =  2 : dt : 6; r2 = 5/4 * (t2 - 2);
t3 = 6 : dt : 7; r3 = -5 * (t3 - 7);
t4 = 7 : dt : 10; r4 = zeros(size(t4));

t = [t1 t2 t3 t4]; r = [r1 r2 r3 r4]; %časovni in signalni vektor


%1.B Drawing 

plot(t, r, 'LineWidth', 2);
axis([0 10 -1 6]);
grid;
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
xlabel('čas {\itt} [s]'); ylabel('{\itr}({\itt})');
title('Enotina strmina');
