

%numbro = xlsread('vaja2.xlsx','A2:A12');
%original = xlsread('vaja2.xlsx','B2:B11');
%cas15 = xlsread('meritve1.xlsx','A2:A12');

%cas = 0:1.5:(24*60);
%cas15 = cas(1:10:end);
data = xlsread('meritve1.xlsx','J2:J50');
data_shift =  xlsread('meritve1.xlsx','J3:J51');

Power = abs(data_shift - data);
Energy1_5Ws = Power * 90;

Sum_Energy_per_sec = sum(Energy1_5Ws) 
Energy_per_hour = Energy1_5Ws / 3600;

Sum_Energy_per_hour = Sum_Energy_per_sec / 3600 

%stairs(cas15,Power,'LineWidth',3);