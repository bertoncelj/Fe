#1.d Preučite priloženi program, ki v simbolični obliki zapiše diferencialno enačbo sistema drugega reda (n = 2, m = 0) in izpiše 
#ter grafično prikaže njeno rešitev. Da ima rešitev pregledno obliko, je program zasnovan tako, da so številske vrednosti 
#koeficientov diferencialne enačbe privzete pred pričetkom reševanja.
clear all; close all;
#define symbols for constant with actual symbols
C = sym ('C')
L = sym ('L')
R = sym ('R')

#define output voltage
syms Uo(t)

#write differential equations for first exec
DE  = C*L*diff(Uo, t, t) + R*C*diff(Uo, t) + Uo == 0

# Solving DE without starting voltage 
sol = dsolve (DE)

#Output is only symboling solution
