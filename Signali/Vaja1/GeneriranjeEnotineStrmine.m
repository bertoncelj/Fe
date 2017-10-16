clear all; close all;
dt = 0.1; %časovni inkrement
%defeniranje časonih omočji in vrednosti singnalov
t1 = -4 : dt : 0; r1 = zeros(size(t1));
t2 = dt : dt : 4; r2  =  t2;
t = [t1 t2]; r = [r1 r2]; %časonvi in singalni vektor
plot(t, r, 'LineWidth', 2);
axis([-4 4 -1 4]);
grid;
set(gca, 'FontName', 'Times New Roamn', 'FontSize', 12);
xlabel('čas {\itt} [s]'); ylabel('{\itu}({\itt})');
title('Enotina strmina');