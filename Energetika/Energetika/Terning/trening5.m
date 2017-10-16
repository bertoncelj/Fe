%before load: 1.) CHANGE DIRECTORY
%             2.)pkg load io


numbro = xlsread('meritve1.xlsx','J2:J962');
a = numbro(1:rows(numbro)-1);
b = numbro(2:rows(numbro));
Power = b - a ;
rows(Power);
cas = (0:rows(Power)-1)*1.5;
rows(cas');
casS = (0:rows(Power)-1)*90;

clf;
hold on; %daje vse na eno sliko

stairs(cas, Power);

%15 minuta POWA
Power15 = reshape(Power,10,(rows(Power)/10));
size(Power15);
SumPower15 = mean(Power15)';

%15min cas
cas15min = (0:rows(SumPower15)-1)*15';

%15min GRAPH
stairs(cas15min,SumPower15,'r')
axis([0 1440 0 150])
set(gca,'XTick',0:60:1440)
%casMin =caS(1) 



%60 minut POWA
Power60 = reshape(Power,40,(rows(Power)/40));
size(Power60);
SumPower60 = mean(Power60)';

%60min cas
cas60min = (0:rows(SumPower60)-1)*60';


%60min GRAPH
stairs(cas60min, SumPower60,'g')
axis([0 1440 0 150])
xlabel('Čas / min'); ylabel('P / [W]')
legend('1,5min povp. moc','15 min povp. moc','60 min povp.moc',3)
set(gca,'XTick',0:60:1440)
