%energija elektricna
 MT_ZP = 0.02900;
 VT_ZP = 0.054440;

%kurilne vrednosti kWh/m^3
K_ELKO  = 10;
K_IZKOristek = 0.85;
letn_poraba_ELKO = 2000; %litrov
COP = 2.5;
Energija_ELKO = K_ELKO*letn_poraba_ELKO*K_IZKOristek;


%EE 484.65
%ELKO 1613.24

%%EE_COP 1024.86
%%EE 667.37


Cena_EE_ELKO = (484.65+1613.24)*1.2;
Cena_EE_COP = 1024.86 * 1.2;

Ujame = Cena_EE_ELKO - Cena_EE_COP;
12000/Ujame;
Toplotna_crpalka = Energija_ELKO / COP;

Gasolina_TWh = 23058/3600;
Dizel_TWh = 58571/3600;
Add_TWh = Gasolina_TWh + Dizel_TWh
Elektrarne_GWh = 16.100

Porabe_EE_Slo = 12.380
              EE=(((Add_TWh/2.5) + Elektrarne_GWh )/Elektrarne_GWh)*100