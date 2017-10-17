%Generiranje enotine strmine
clear all; close all;
dt = 0.01;  %časovni inkrement
%definiranje časovnih območji in vrednosti signalov
t1 = -4 : dt : 0; r1 = zeros(size(t1));
t2 =  dt : dt : 4; r2 = t2;
t = [t1 t2]; r = [r1 r2]; %časovni in signalni vektor
plot(t, r, 'LineWidth', 2);
axis([-7 7 -1 4]);
grid;
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
xlabel('čas {\itt} [s]'); ylabel('{\itr}({\itt})');
title('Enotina strmina');