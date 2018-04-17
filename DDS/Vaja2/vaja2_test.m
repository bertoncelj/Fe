%Izpis signala komplexsnega programa funkcije
clear all; close all;

dt = 0.001;  %časovni inkrement

% Signal description by unit step and 
  t1 =-10 : dt : -6;  u1 = zeros(size(t1));
  t2 = -6 : dt :  3;  u2 =  ones(size(t2));
  t3 =  3 : dt :  10; u3 =  zeros(size(t3));

  
  t = [t1 t2 t3];
  u = [u1 u2 u3];



%1.B Drawing 
  plot(t, u, 'LineWidth', 2);
  axis([-10 10 -2 2]);
  grid;
  set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
  xlabel('čas {\itt} [s]'); ylabel('{\itx}({\itt})');
  title('Enotina strmina');