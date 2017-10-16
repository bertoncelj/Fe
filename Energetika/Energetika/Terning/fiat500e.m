%Fiat 500e
  %stats
  MT_ZP = 0.02900;
  VT_ZP = 0.054440;
  ET_ZP = 0.0462;
  
kapaciteta_batarije = 24; %kWh al Ah
estimate_rage = 160; %km
charging_speed = (1+(3/4));  % minutes/ 80 filled
charging_time_max = 8 * 60;  %minutes

estimate_year_range = 20000;%km


%calulation 
Energy_year_car = (kapaciteta_batarije/estimate_rage)*estimate_year_range;
%Energy_year_car = 2050; %kWh

Pay_VT_MT = (VT_ZP*Energy_year_car*(1/3))+ (MT_ZP*Energy_year_car*(2/3));
Skupaj_plusDDV_VT_MT = Pay_VT_MT*1.2

Pay_ET = Energy_year_car*ET_ZP;
Skupaj_plusDDV_ET  = Pay_ET*1.2