# 2. VAJA: KLASIČNO REŠEVANJE SISTEMOV V ČASOVNEM PROSTORU 


1.Mnoge fizikalne sisteme, kot je npr. RLC vezje ali mehanski sistem masa-vzmet-blažilec,
   lahko modeliramo z diferencialno enačbo drugega reda, oblike: 
		
![first equation](http://latex.codecogs.com/gif.latex?%5Cfrac%7Bd%5E%7B2%7D%20y%28t%29%20%7D%7Bdt%5E%7B2%7D%7D%20&plus;%202%5Czeta%20%5Comega%20_%7Bn%7D%5Cfrac%7Bdy%28t%29%7D%7Bdt%7D&plus;%5Comega%20_%7Bn%7D%5E%7B2%7Dy%28t%29%20%3D%20Kx%28t%29)

![first equation](http://latex.codecogs.com/gif.latex?a_2%5Cfrac%7Bd%5E2%20y%28t%29%7D%7Bdt%5E2%7D%20&plus;%20a_1%5Cfrac%7Bdy%7D%7Bdt%7D%20&plus;%20a_0%20y%28t%29%20%3D%200%20%3B%20y%28t%29%20%3D%20Ce%5E%7Bst%7D%20%5Crightarrow%20a_2s%5E2%20&plus;a_1s%20&plus;%20a_0%20%3D%200)

![first equation](http://latex.codecogs.com/gif.latex?s%5E2%20&plus;%20%5Cfrac%7Ba_%7B1%7D%7D%7Ba_2%7Ds%20&plus;%20%5Cfrac%7Ba_0%7D%7Ba_2%7D%20%3D%20s%5E2%20&plus;%202%5Czeta%20%5Comega%20_n%20s%20&plus;%20%5Comega%20_%7Bn%7D%5E%7B2%7D%20%3D%20s%5E2%20&plus;%202%5Czeta%20%5Comega%20_n%20s%20&plus;%20%5Comega_n%5E2)	

 1.a Zapišite diferencialno enačbo v dani standardni obliki za primer serijskega RLC vezja
s priključenim napetostnim generatorjem vg(t) na vhodu in napetostjo na kondenzatorju
kot izhodno napetostjo (vizh(t)=vC(t)) ter izrazite ωn, ζ in K z elementi vezja. 

   ![vezje 1a naloga](https://user-images.githubusercontent.com/4838487/32341679-78037378-bffe-11e7-99b3-617f72871346.png)

![solution of equation](http://latex.codecogs.com/gif.latex?LC%5Cfrac%7Bd%5E2U_o%28t%29%7D%7Bdt%5E2%7D%20&plus;%20RC%5Cfrac%7BdU_o%28t%29%7D%7Bdt%7D%20&plus;%20U_o%28t%29%20%3D%20V_g%28t%29)

![wn and zeta](http://latex.codecogs.com/gif.latex?%5Comega_n%20%3D%20%5Cfrac%7B1%7D%7B%5Csqrt%7BLC%7D%7D%3B%20%5Czeta%20%3D%20%5Cfrac%7B1%7D%7B2%7DR%5Csqrt%7B%5Cfrac%7BC%7D%7BL%7D%7D)

 1.b Predpostavite, da sta L in C konstantna, in sicer L = 10 mH in C = 1 µF, upornost R pa
 naj se spreminja v območju od 0 do ∞. Določite območja vrednosti R, pri katerih sta
 karakteristična korena: i) čisto imaginarna, ii) kompleksna, iii) realna.
 
 1.c Napišite program MATLAB, ki bo v kompleksni ravnini s narisal odvisnost lege
karakterističnih korenov od stopnje dušenja ζ . Stopnjo dušenja ζ izrazite z upornostjo
R, ki naj se spreminja v območju od 0 do 1000 Ω (L = 10 mH, C = 1 µF).

 1.d Preučite priloženi program, ki v simbolični obliki zapiše diferencialno enačbo sistema
drugega reda (n = 2, m = 0) in izpiše ter grafično prikaže njeno rešitev. Da ima rešitev
pregledno obliko, je program zasnovan tako, da so številske vrednosti koeficientov
diferencialne enačbe privzete pred pričetkom reševanja.

 1.e Program priredite za reševanje danega RLC vezja, za katerega naj izračuna in grafično
prikaže odzive (vizh(t) = vC(t)) na začetno stanje (vg(t) = 0, vC(0−
) = 10 V, iL(0−
) = 0) za
naslednje stopnje dušenja: ζ = 0, ζ = 0.1, ζ = 0.7, ζ = 1 in ζ = 2.

 1.f Za iste stopnje dušenja naj program izračuna in prikaže še odziv (vizh(t) = vC(t)) na
enotino stopnico (vg(t) = u(t)) pri ničelnem začetnem stanju.

1.g Program MATLAB dopolnite tako, da bo izračunal in grafično prikazal še tok skozi
 tuljavo iL(t), in sicer za primera pod 1.e in 1.f. Za hkratno risanje vC(t) in iL(t)
 uporabite ukaz subplot. 
 
2.Zapišite diferencialno enačbo za tok skozi tuljavo iL(t) in jo rešite s pomočjo programa
 MATLAB. Program dopolnite, da bo izračunal še napetost na kondenzatorju vC(t) in
 nato obe spremenljivki grafično prikazal na podgrafih.
 (C = 1 mF, L = 110 mH, R1 = 100 Ω, R2 = 10 Ω, iL(0) = 1 A, vC(0) = 0 V) 
 
 ![2exe1vaja](https://user-images.githubusercontent.com/4838487/32342069-a19061f0-bfff-11e7-9ccc-6e240ea7bc81.png)


3.Zapišite diferencialno enačbo za tok skozi tuljavo iL(t) in jo rešite s pomočjo programa
 MATLAB. Program dopolnite, da bo izračunal še napetost na kondenzatorju vC(t) in
 nato obe spremenljivki grafično prikazal na podgrafih. Krmiljenje naj bo enotina
 stopnica (ig = u(t)), nato pa še sinusni signal (ig = sin(t)).
 (C = 1 F, L = 1 H, R = 2Ω, iL(0) = 0 A, vC(0) = 0 V) 
 
 ![3exe2vaja](https://user-images.githubusercontent.com/4838487/32342072-a8dcdcb8-bfff-11e7-94a3-879358f3b1f0.png)
 
