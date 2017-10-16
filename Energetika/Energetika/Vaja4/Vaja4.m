%kWh je kolicina zemeljskega PLINA
kolicina_plina = 3.187 ;
%cene
  %cena plina VT, MT
  MT_ZP = 0.02900;
  VT_ZP = 0.054440;
  ET_ZP = 0.0462;
%Izračun energije PLIN
ENE_ogrevanje_hise =  letn_poraba_plina*kurilna_vrednost_plina;

%letna poraba plina v Sm^3
letn_poraba_plina = 2000;

%kurilne vrednosti
kurilna_vrednost_plina = 10.62;
kv_EL_KO = 10;    %kWh/l
UNP = 6.95;       %kWh/l
Paleti = 4.9;    %kWh/kg
elektrika = 1;   %kWh EE

%koliko mase, litrov energije rabimo:
litrov_ELKO = ENE_ogrevanje_hise / kv_EL_KO;
litrov_UNP = ENE_ogrevanje_hise / UNP;
mase_KG_paleti = ENE_ogrevanje_hise /Paleti;


%v kWh + celotni izkoristek
Energija_ZP = letn_poraba_plina*kurilna_vrednost_plina*0.85

%Plačal ZP v €/letna
Pay_ZP = (VT_ZP*Energija_ZP*(1/3))+ (MT_ZP*Energija_ZP*(2/3))

%Naloga
Energija_naloga = 4500;
Pay_Letna_VT = (VT_ZP*Energija_naloga)
Pay_Letna_MT = (MT_ZP*Energija_naloga)
Pay_Letna_MVplusVT = (VT_ZP*Energija_naloga*(1/3))+ (MT_ZP*Energija_naloga*(2/3))
 
