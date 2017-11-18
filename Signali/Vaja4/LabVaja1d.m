#primer 3.6
# ẋ = Ax + Bu
# ẏ = Cx + Du

clear all; close all; 

# constant for DE
R1 = 2; #ohm
R2 = 1; #ohm
 
#kapacitivnost
C1 = 1; 
C2 = 1;

#Casovni vektor
#tz = 0; tk = 0.01; dt = 0.000001;
T=0 : 0.000001 : 0.01;

# U definition input
##Prva je enotina stopnica
##Druga je sinusen signal
U = ones(length(T),1); 
%U = [ones(length(t),1), sin(length(t),1)];

#Zacetne vrednosti Vc1(0)=0V Vc2(0) = 0V
Vc01 = 0; Vc02 = 0;
Vc = [Vc01; Vc02];  #oba sta nic

# definition of A,B,C,D konstants

a11 = -(1 + (R1/R2)) * 1/(R2*C1); 
a12 = 1/(R1*C1);
a21 = 1/(R1*C2); 
a22 = -1/(R1*C2);

b11 = 1/(R2*C1); 
b12 = 0;
 
c11 = -1;
c12 = 1;

d11 = 1;
d12 = 0;

#konstante v prostoru matrix
A = [a11, a12; a21, a22];
B = [b11, b12]';
C = [c11, c12];
D = [d11, d12]';

#solving systems
sys = ss(A,B,C,D);
[y,t,x]=lsim(sys, U,t);


#zapis outs
U = ones(size(T)); 
sys = ss(A,B,C,D);             % construct a system model
[Y, Tsim, X] = lsim(sys,U,T);  % simulate
plot(Tsim,Y)                   % plot the output vs. time
title('Step Response with Zero Initial Conditions');

figure(3)

T = 0:0.01:10;                  % simulation time = 10 seconds
U = sin(T);             % input as a function of time
sys = ss(A,B,C,D);              % construct a system model
[Y, Tsim, X] = lsim(sys,U,T);   % simulate
plot(Tsim,Y)                    % plot the output vs. time
title('Response to a Sinusoid Input with Zero Initial Conditions')

