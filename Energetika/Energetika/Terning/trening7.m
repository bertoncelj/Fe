%bere podatke is "qatar.xlsx"
EE_power = xlsread('qatar.xlsx', 'D8:AG8'); 
Motor_Gasoline = xlsread('qatar.xlsx', 'C13:C39');
Jet_full = xlsread('qatar.xlsx', 'H13:H39');

%rabim 2 razlicna leta, ker imam 2 razlicne dolge podatke
leta_long = 1985:1:2014; %30 parametrov
leta_short = 1986:1:2012; %27 parametrov

clf;
hold on;

%Calculation of EE_power
  model_EE = @(p, x) p(1) + p(2)*x + p(3).*x.^2 + p(4).*x.^3; %enacba 
  p = parametri([leta_long'], EE_power', model_EE, 4) %Tukaj mi vrne 4 parametre ker imam enacbo 3 stopnje (4 parametre)

  xo = linspace(leta_long(1), 2030); %ustvar mi 100 tock med prvim letom in do 2030 npr. 1985.0   1985.7   1986.3 ....  2028.6   2029.1   2029.5   2030.0 )
  yo = model_EE(p, xo); %v enacbo dam parametre in xo tocke da dobim vrednosti za y os.
 
  %ponovim za druga dva grafa.
%Calculation of Motor_Gasoline
  model_Motor = @(p, x) p(1) + p(2)*x + p(3).*x.^2 + p(4).*x.^3;
  p1 = parametri([leta_short' ], Motor_Gasoline, model_Motor, 4);

  x1 = linspace(leta_short(1), 2030);
  y1 = model_Motor(p1, x1);

%Calculation of Jet_full
  model_Jet = @(p, x) p(1) + p(2)*x + p(3).*x.^2 + p(4).*x.^3;
  p2 = parametri([leta_short' ], Jet_full, model_Jet, 4);

  x2 = linspace(leta_short(1), 2025);
  y2 = model_Jet(p2, x2);


%--------------------------------------------------  
%Graph EE_power
  subplot (3, 1, 1); hold on; %ta komanda je samo da vse 3 slike na en figure da
  plot(xo, yo,'r'); %rise aproksimacijsko crto NAPOVED!
  plot(leta_long, EE_power, 'o'); grid on; %narise krogce, oziroma tocke ki jih ima iz podatkov
  title ("Qatar cumsamption EE power"); %Tle dol se opremimo graf...
  axis([leta_long(1) 2050 0 80])
  xlabel('Leto'); ylabel('Poraba EE [Bilion Wh]')
  set(gca,'XTick',(1985:5:2030)); 
  set(gca,'YTick',(0:5:80)); 
  
%Graph Motor_Gasoline 
  subplot (3, 1, 2); hold on;
  plot(x1, y1,'r');
  plot(leta_short, Motor_Gasoline, 'o'); grid on;
  title ("Qatar consumption Motor gasolina");
  axis([leta_long(1) 2050 0 80])
  xlabel('Leto'); ylabel('1000 Barrles per day[Barrles per day]')
  set(gca,'XTick',(1986:4:2030)); 
  set(gca,'YTick',(0:5:80)); 
  
%Graph Jet_full 
  subplot (3, 1, 3); hold on;
  plot(x2, y2,'r');
  plot(leta_short, Jet_full, 'o'); grid on;
  title ("Qatar Jet full consumption");
  axis([leta_long(1) 2050 0 80])
  xlabel('Leto'); ylabel('1000 Barrels per day[Barrles per day]')
  set(gca,'XTick',(1986:4:2024)); 
  set(gca,'YTick',(0:5:80)); 