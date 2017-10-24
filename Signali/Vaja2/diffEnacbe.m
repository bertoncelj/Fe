% Simbolicno resevanje diferencialnih enacb 2 reda

clear all; close all;
pkg load symbolic

tz = 0; dt = 0.01; tk = 20;   t = tz : dt : tk; %casovni vektor
a2 = 1; a1 = 0.2; a0 = 1; b0 = 1;    % koeficienti dif. enacbe
x = '1';      %vzbujanje - vhod signal

y0 = 0; dy0 = 0;  % zacetno stanje

y0_zst = 'y(0) = y0'; y0_zst = strrep(y0_zst, 'y0', num2str(y0));
dy0_zst = 'Dy(0) = dy0'; dy0_zst = strrep(dy0_zst, 'dy0', num2str(dy0));

dif_en = 'a2 * D2y + a1 * Dy + a0 * y = b0 * x';

dif_en = strrep(dif_en, 'a2', num2str(a2));
dif_en = strrep(dif_en, 'a1', num2str(a1));
dif_en = strrep(dif_en, 'a0', num2str(a0));
dif_en = strrep(dif_en, 'b0', num2str(b0));
dif_en = strrep(dif_en, 'x', x);

y = dsolve(dif_en, y0_zst, dy0_zst, 't');   %resitev diff enacbe

%izris slike
plot(t, eval(y)); axis([tz tk 0 2]);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
xlabel('cas t [s]'); ylabel('y(t)');
title('casovni potek y(t) pri y(0)=0V, Dy(0)= 0 in x(t)=1');grid;