%Izpis signala komplexsnega programa funkcije
clear all; close all;

dt = 0.001;  %časovni inkrement

% Signal description by unit step and 
  t1 = -5 : dt : -1;  u1 = zeros(size(t1));
  t2 = -1 : dt : -1;  u2 = -2 * ones(size(t2));
  t3 = -1 : dt :  1;  u3 =  2 * (t3);
  t4 =  1 : dt :  2;  u4 =  2 * ones(size(t4));
  t5 =  2 : dt :  2;  u5 =  3 * ones(size(t5));
  t6 =  2 : dt :  4;  u6 =  (5 - t6);
  t7 =  4 : dt :  5;  u7 =  ones(size(t7));
  t8 =  5 : dt :  7;  u8 = (6 - t8);
  t9 =  7 : dt :  7;  u9 = -1 * zeros(size(t9));

  
  t = [t1 t2 t3 t4 t5 t6 t7 t8 t9];
  u = [u1 u2 u3 u4 u5 u6 u7 u8 u9];



%1.B Drawing 
  plot(t, u, 'LineWidth', 2);
  axis([-2 8 -5 5]);
  grid;
  set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
  xlabel('čas {\itt} [s]'); ylabel('{\itx}({\itt})');
  title('Enotina strmina');
