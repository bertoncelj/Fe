function p = poloznica(vpis_energija, vpis_mesec, procVT)

%Konstante barve:
  BLACK = "\033[30m";     
  RED   = "\033[31m";      
  GREEN = "\033[32m";    
  YELLOW = "\033[33m";      
  BLUE  = "\033[34m";      
  MAGENTA = "\033[35m";     
  CYAN = "\033[36m";      
  WHITE = "\033[37m";
  RESET = "\033[0m";
%Vpis
%printf("Vpisi parametre: \n");
%a = scanf("%d");
%printf("\n %d \n", a);
%konstante
  %cena EE plina VT, MT
    K_MT_EE = 0.02900;
    K_VT_EE = 0.054440;
    %ET_EE = 0.0462;
  %Omrežnina za SODO
    K_Obra_moc   = 0.77490;
    K_Omre_VT    =  0.04213;
    K_Omre_MT    =  0.03239;
  %Prispevki
    K_Prisp_DOT = 0.00013;
    K_Prisp_EU  = 0.00080;
    K_Prisp_OVE = 0.73896;
  %Troserina
    K_troserina = 0.00305;
  %kurilno olje
    K_ELKO  = 10; %kWh/l
    K_ELKO_EUR = 0.8; %EUR/l
    K_ELKO_izkor = 1; %%
    K_ELKO_prevoz = 13.24;
%VPIS PODATKOV
  %energy kWh
    vpis_meseci = ceil(vpis_mesec);
    vpis_energy = vpis_energija;
   
    vpis_obracunska_moc = 7;
    
    
meseci = vpis_meseci;
energy = vpis_energy * meseci;
obracun_moc = vpis_obracunska_moc * meseci; 
   
%RACUNANJE-----------------------------------------------------------
  %Skupna elektricna energija
  VT_MT = procVT/100;
  energyVT = ceil(energy*(VT_MT));
  energyMT = ceil(energy*(1 - VT_MT));
  vpis_VT = VT_MT*100;
  vpis_MT = (1-VT_MT)*100;
 
  Z_ele_VT = (K_VT_EE * energyVT);
  Z_ele_MT = (K_MT_EE * energyMT);
  
  Z_skupaj_ele_energija = Z_ele_MT + Z_ele_VT;

  %Skupaj omrežnina za SODO
  Z_Obracun_moc = obracun_moc * K_Obra_moc;
  Z_OmrezninaVT =  energyVT * K_Omre_VT;
  Z_OmrezninaMT =  energyMT * K_Omre_MT;    
  
  Z_Skupaj_omreznina = Z_Obracun_moc + Z_OmrezninaMT + Z_OmrezninaVT;
  
  %Skupaj prispevki
  Z_Prisp_DOT = K_Prisp_DOT * energy ;
  Z_Prisp_EU  = K_Prisp_EU * energy ;
  Z_Prisp_OVE = K_Prisp_OVE * obracun_moc;
  
  Z_Skupaj_prispevki =  Z_Prisp_OVE + Z_Prisp_EU + Z_Prisp_DOT;
  
  %Skupaj troserina
  Z_troserina = energy * K_troserina;
   
  Z_Skupaj_troserina = Z_troserina;
  
  %Skupaj
  Skupaj =  Z_skupaj_ele_energija + Z_Skupaj_omreznina + Z_Skupaj_prispevki + Z_Skupaj_troserina;
 %kurilc--------------------------------------------------------------------------------------------
  lit_ELKO = ceil((energy * K_ELKO_izkor) / K_ELKO);
  cena_ELKO = lit_ELKO * K_ELKO_EUR;
  Z_Skupaj_ELKO = K_ELKO_prevoz + cena_ELKO;
 
%IZPIS-------------------------------------------------------------------------
 printf("%sVPIS PODATKOV:\n\tenergija:%d kWh \n\tobracun_moc: %d kW \n\tmeseci: %d\n\t VT: %d \n\t MT: %d %s\n",MAGENTA, vpis_energy,vpis_obracunska_moc, vpis_meseci,vpis_VT,vpis_MT, RESET);
 
 printf("%sRACUN EE%s\n",MAGENTA,RESET);
 printf("%s\nPRODUKT       OBDOBJE       KOLICINA    ENOTA  CENA EUR/EM ZNESEK €%s\n",RED, RESET);
  printf("\n");
  %Skupna elektricna energija
  printf("Elektricna energija VT\t\t %d\t kWh \t%d\t    %d \n", energyVT, K_VT_EE, Z_ele_VT);
  printf("Elektricna energija MT\t\t %d\t kWh \t%d\t    %d \n", energyMT, K_MT_EE, Z_ele_MT);
  printf("%sSkupaj elektricna energija%s \t\t\t\t    %s%d%s \n",BLUE, RESET,BLUE, Z_skupaj_ele_energija, RESET);
  printf("\n");

  %Skupaj omrežnina za SODO
  printf("Obracunska moc \t\t\t %d\t kW \t%d\t    %d \n", obracun_moc, K_Obra_moc, Z_Obracun_moc);
  printf("Omreznina VT \t\t\t %d\t kWh \t%d\t    %d \n", energyVT, K_Omre_VT, Z_OmrezninaVT);
  printf("Omreznina MT \t\t\t %d\t kWh \t%d\t    %d \n", energyMT, K_Omre_MT, Z_OmrezninaMT);
  printf("%sSkupaj omreznina za SODO \t\t\t\t    %d%s \n", BLUE, Z_Skupaj_omreznina, RESET);
  printf("\n");

  %Skupaj prispevki
  printf("Prispevek za delovanje ot \t %d\t kWh \t%d\t    %d \n", energy, K_Prisp_DOT, Z_Prisp_DOT);
  printf("Prispevek za energetsko u \t %d\t kWh \t%d\t    %d \n", energy, K_Prisp_EU, Z_Prisp_EU);
  printf("Prispevek za SPTE IN OVE \t %d\t kW \t%d\t    %d \n", obracun_moc, K_Prisp_OVE, Z_Prisp_OVE);
  printf("%sSkupaj prispevki  \t\t\t\t\t    %d%s \n",BLUE, Z_Skupaj_prispevki,RESET);
  printf("\n");

  %Troserina
  printf("Troserina \t\t\t %d\t kWh \t%d\t    %d \n", energy, K_troserina, Z_troserina);
  printf("%sSkupaj troserina  \t\t\t\t\t    %d%s \n",BLUE, Z_Skupaj_troserina,RESET);
  
  %Skupaj
  printf("%s_____________________________\n%s", RED, RESET);
  printf("%s Skupaj:(brez DDV) \t\t\t\t\t    %d %s \n",GREEN, Skupaj, RESET);
  printf("\n\n\n\n");
%kuril----------------------------------------------------------------------------
 
  printf("Izkoristek n = %d    energija = %d kWh,   kurilna vrednost = %d kWh/l \n", 1-(K_ELKO_izkor-1), energy, K_ELKO);
  printf("%s\nRACUN EL-KO%s\n",MAGENTA,RESET);
  printf("%s\nPRODUKT       OBDOBJE       KOLICINA    ENOTA  CENA EUR/EM ZNESEK €%s\n",RED, RESET);
  printf("EL-KO \t\t\t\t %d\t l\t %d\t    %d \n", lit_ELKO, K_ELKO_EUR, cena_ELKO);
  printf("Prevoz\t\t\t\t\t \t\t    %d \n",K_ELKO_prevoz);
  
  %Skupaj
  printf("%s_____________________________\n%s", RED, RESET);
  printf("%s Skupaj:(brez DDV) \t\t\t\t\t    %d %s \n",GREEN, Z_Skupaj_ELKO, RESET);
  printf("\n");
  










