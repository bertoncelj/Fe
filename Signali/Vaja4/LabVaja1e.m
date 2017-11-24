# constant for DE
clear all; close all; 

freq = 1000; %Hertz
R1 = 1;
R4 = 1;

R2 = 2;
R3 = 2; 

#kapacitivnosti
C = 0.5;  %Farad
L = 0.5;  %henry 

#Casovni vektor
#tz = 0; tk = 0.01; dt = 0.000001;
tz=0; tk=10; dt=0.01; t=tz:dt:tk;

#Zacetne vrednosti iL(0)=1A Vc2(0) = 0V
iL_zac = 1; Vc_zac = 0;
Zac_pogoj = [iL_zac; Vc_zac];

# definition of A,B,C,D konstants
a11 = -(R1*R2/(R1+R2)+R3*R4/(R3+R4))/L;
a12 = (-R2/(R1+R2)+R3/(R3+R4))/L;
a21 = (-R1/(R1+R2)+R4/(R3+R4))/C;
a22 = -(1/(R1+R2)+1/(R3+R4))/C;

b11 = R2/(R1+R2)/L; 
b12 = -R3/(R3+R4)/L; 
b21 = 1/(R1+R2)/C; 
b22 = 1/(R3+R4)/C;

c11 = R1*R2/(R1+R2); 
c12 = -R1/(R1+R2); 
c21 = -R3*R4/(R3+R4);
c22 = -R4/(R3+R4);

d11 = R1/(R1+R2);
d12 = 0;
d21 = 0;
d22 = R4/(R3*R4);

#konstante v prostoru matrix
A   = [a11, a12; a21, a22];
B   = [b11, b12; b21, b22];
C_m = [c11, c12; c21, c22];
D   = [d11, d12; d21, d22];

# U definition input, both zeros matrixs
wn = sqrt(a11*a22-a12*a21); #definition of natural frequancy
U = [ones(length(t),1),ones(length(t),1)];

for i = 1 :  length(t)
  U(i,1) = sin(wn*t(i));
  U(i,2) = 0.1 *sin(10 * wn * t(i));
endfor


#solving systems
sys = ss(A,B,C_m,D);
[y,t,x] = lsim(sys, U,t, Zac_pogoj);

#zapis outs
iL = x(:,1); Vc = x(:,2); 
vR1 = y(:,1); vR4 = y(:,2);

#draw

fig1 = figure(1);
set(fig1,'Units','centimeters','Position',[1 4 14 12]);
plot(Vc, iL);  
grid;
axis([-0.5 0.5 -0.5 0.5]);
xlabel('{\iti}_L [V] ({\itx}_1)'); ylabel('{\itv_C} [V] ({\itx}_2)');
title('Trajektorija v prostoru stanj')
pause(1);

fig2 = figure(2);

set(fig2,'Units','centimeters','Position',[16.5 1.5 20 16]);
plot(t, iL, 'g', t, Vc, 'b', t, vR1, 'r', t, vR4, 'k'); 
legend("IL","Vc","VR1","VR4")
axis([tz tk -0.6 0.6]); 
grid;
xlabel('{\itt} [s]'); 
ylabel('{\iti_L} [A], {\itv_C} [V], {\itv_R}_1 [V], {\itv_R}_4 [V]');
title('Časovna odvisnost spremenljivk stanj')
pause(2);
