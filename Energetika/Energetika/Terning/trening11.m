Power_neg = xlsread('Test1.xlsx', 'Test1','L3:L127');
temp1 = xlsread('Test1.xlsx', 'Test1','H3:H26');
time_10s = (0:10:230);
time_2s = (0:2:248);
length(Power_neg);
length(time_2s);
Power = abs(Power_neg)

plot(time_10s,temp1,'r')
xlabel('Čas / sekunde'); ylabel('Temperatura / [°C]')
