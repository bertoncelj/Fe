P_mean = xlsread ('cetrtek_voda_kava_kava_I.xlsx', 'E3:E303');
Q_mean = xlsread ('cetrtek_voda_kava_kava_I.xlsx', 'E3:E303');

a1 = (1:301);
a2 = (2:302);

length(P_mean);
length(time);
Energy = sum(P_mean)
Energy = Energy/12
Energy = Energy/60 %Wh
Energy = Energy/1000 %kWh

  plot(a1, P_mean,'r'); grid on; %narise krogce, oziroma tocke ki jih ima iz podatkov
  title ("Prikaz moci grelca kave po minutah"); %Tle dol se opremimo graf...
  axis([a1(1) 301 0 800])
  xlabel('Minute'); ylabel('Poraba Moci [W]')
  set('XTick',(1:1:25)); 
  %set(gca,'YTick',(0:5:80)); 