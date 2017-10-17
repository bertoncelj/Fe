% Generiranje diskretne enotine stopnice
clear all; close all;

T = 0.2                   %časovni inkrement
tz = -4; tk = 4; t1 = 0;  %Zacetni, koncni cas in cas prehoda z 0 in 1
n1 = tz/T : 1 : t1/T-1; u1 = zeros(size(n1));
n2 = t1/T : 1 : tk/T;   u2 = ones(size(n2));
n = [n1 n2];
u = [u1 u2];

% Izris
stem(n, u, 'ko', 'MarkerFaceColor','g');
axis([tz/T tk/T -0.5 1.5]); grid;
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
xlabel('{\itn}');
ylabel('{\itu}({\itn})');
title('Diskretna enotina stopnica');
