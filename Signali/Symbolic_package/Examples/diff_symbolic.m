clear all; close all;

tz = 0; dt =  .01; tk = 20; t = tz : dt : tk;

a2 = 1; a1 = .02; a0 = 1; b0 = 01;
x = '1';
y0 = 0; dy0 = 0;

syms y(x)

y0_zst = 'y(0) = y0'; y0_zst = strrep(y0_zst, 'y0', num2str(y0));
dy0_zst = 'Dy(0) = dy0'; dy0_zst = strrep(dy0_zst, 'y0', num2str(dy0));

diff_en = 'a2*D2y + a1*Dy + a0*y = b0*x';

diff_en = strrep(diff_en, 'a2', num2str(a2));
diff_en = strrep(diff_en, 'a1', num2str(a1));
diff_en = strrep(diff_en, 'a0', num2str(a0));
diff_en = strrep(diff_en, 'b0', num2str(b0));
diff_en = strrep(diff_en, 'x', x);

#y = dsolve(diff_en, y0_zst, dy0_zst, 't')