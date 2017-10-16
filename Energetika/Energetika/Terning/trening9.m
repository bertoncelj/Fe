%elektricni avto
%upostevajte upadlost kapacitete na leta
%elektricna poraba
 MT_ZP = 0.02900;
 VT_ZP = 0.054440;
 
 %ladjo
 ladja = 80.174 *10^6 %MW
 energija_ladje = 10*10^3 %kWh/l
 %cena goriv
Dizel = 1,153 %EUR/L 
poraba_dizel = 4.2 %litrov na 100km
%elektricni avto
%upostevajte upadlost kapacitete na leta
kapaciteta_batarije = 43; %kWh al Ah
estimate_rage = 300; %km
charging_speed = (1+(3/4))  % minutes/ 80 filled
charging_time_max = 8 * 60  %minutes

estimate_year_range = 20000;%km

%calulation 
Energy_year_car = (kapaciteta_batarije/estimate_rage)*estimate_year_range
%Energy_year_car = 2050; %kWh

Pay_ZP = (VT_ZP*Energy_year_car*(1/3))+ (MT_ZP*Energy_year_car*(2/3))
 
%Dizel Avto
litrov_dizel =estimate_year_range*(poraba_dizel/100);
cena_dizel = litrov_dizel*Dizel

%ladja
litriNaSekundoLadja = (ladja/energija_ladje)/3600

%avto
litriNaSekundoLadja = ()