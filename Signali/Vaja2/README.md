# 2. VAJA: KLASIČNO REŠEVANJE SISTEMOV V ČASOVNEM PROSTORU 

1. Mnoge fizikalne sisteme, kot je npr. RLC vezje ali mehanski sistem masa-vzmet-blažilec,
   lahko modeliramo z diferencialno enačbo drugega reda, oblike: 
		
	![first equation](http://latex.codecogs.com/gif.latex?%5Cfrac%7Bd%5E%7B2%7D%20y%28t%29%20%7D%7Bdt%5E%7B2%7D%7D%20&plus;%202%5Czeta%20%5Comega%20_%7Bn%7D%5Cfrac%7Bdy%28t%29%7D%7Bdt%7D&plus;%5Comega%20_%7Bn%7D%5E%7B2%7Dy%28t%29%20%3D%20Kx%28t%29)
	
1.a Zapišite diferencialno enačbo v dani standardni obliki za primer serijskega RLC vezja
s priključenim napetostnim generatorjem vg(t) na vhodu in napetostjo na kondenzatorju
kot izhodno napetostjo (vizh(t)=vC(t)) ter izrazite ωn, ζ in K z elementi vezja. 

![screenshot from 2017-11-02 18-47-22](https://user-images.githubusercontent.com/4838487/32341679-78037378-bffe-11e7-99b3-617f72871346.png)
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
