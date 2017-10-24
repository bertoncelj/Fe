%Izpis signala komplexsnega programa funkcije
clear all; close all;

dt = 0.02;  %časovni inkrement

% Signal description by unit step and 
  %t1 = 0 : dt : 0;  u1 = zeros(size(t1));
  t2 = 0 : dt : 0;  u2 = -0.5 * ones(size(t2));
  t3 = 0 : dt : 1;  u3 =  -0.5 + 0.5*(t3);
  t4 =  1 : dt :2;u4 =  0.5 * ones(size(t4));
  t5 = 2 : dt : 2; u5 = 1 * zeros(size(t5));


  
  t = [ t2 t3 t4 t5];
  u = [ u2 u3 u4 u5];
  
  periodic_t = t'*ones(1,4);
  periodic_t = (periodic_t(:))';
  periodic_u = u'*ones(1,4); 
  periodic_u = (periodic_u(:))';

%1.B Drawing 
  plot(periodic_t, periodic_u, 'LineWidth', 2);
  axis([-2 8 -5 5]);
  grid;
  set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
  xlabel('čas {\itt} [s]'); ylabel('{\itx}({\itt})');
  title('Enotina strmina');
