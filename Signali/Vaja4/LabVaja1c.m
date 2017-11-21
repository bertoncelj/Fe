#LabVaja1c
# ẋ = Ax + Bu
# ẏ = Cx + Du
clear all; close all;

#Casovni vektor
#tz = 0; tk = 0.01; dt = 0.000001;
t=0 : 0.1 : 100;


# constant for DE
C = 1; %HFarad
L = 1;  %Henry

#upornosti
R1 = 10; %ohm
R2 =  1; %ohm
R3 = 10; %ohm

#Zacetne vrednosti Vc(0)=1V iL(0) = 1A
Vc_zac = 1; iL_zac = 1;
V_zac_pogoj = [Vc_zac; iL_zac];

# U definition input, both zeros matrixs
U = [ones(length(t),1)];

#definirane izhodne matrike namenjene da risemo vec krivulj hkrati
Vc    = [ones(length(t),1)];
iL    = [ones(length(t),1)];
vizh  = [ones(length(t),1)];

a11 = -(1/C) * (1/(R1+R2) + 1/R3); 
a12 = -(R1/((R1+R2)*C));
a21 = R1/((R1+R2)*L);
a22 = -(R1*R2/((R1+R2)*L));

b11 = 1/((R1+R2)*C);
%b12 = 1/(R3*C);
b21 = (R2)/((R1+R2)*L);
%b22 = 0;

c11 = -1/(R1+R2); 
c12 = -R1/(R1+R2);

d11 = 1/(R1+R2);
%d12 = 0;

 #matrix definitons
A   = [a11, a12;
       a21, a22];
  
B   = [b11,b21]';
C_m = [c11, c12]; 
D   = [d11];
  
#solving systems
sys = ss(A,B,C_m,D);
[y,x,t] = impulse(sys,t);
  
#zapis outs, ki je da lsim: za vse R-je
Vc = x(:,1)
iL = x(:,2)
vizh = y(:,1)

%Vc