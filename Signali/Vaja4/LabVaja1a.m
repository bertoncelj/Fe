clear all; close all;

#Casovni vektor
#tz = 0; tk = 0.01; dt = 0.000001;
t=0 : 0.1 : 100;


# constant for DE
C = 1; %HFarad
L = 1;  %Henry
R = [0, 0.2, 1.4, 2, 4];  %primer za R3
%R = 2; %test R, DELETE ME later

# U definition input, both zeros matrixs
U = [ones(length(t),1)];

#definirane izhodne matrike namenjene da risemo vec krivulj hkrati
Vc    = [ones(length(t),5)];
iL    = [ones(length(t),5)];
vizh  = [ones(length(t),5)];


#Zacetne vrednosti Vc(0)=1V iL(0) = 1A
Vc_zac = 1; iL_zac = 1;
V_zac_pogoj = [Vc_zac; iL_zac];


for i = 1 : 5
  R(i)
  A   = [0,      1/C;
        -1/L,  -R(i)/L];
  
  B   = [0,    1/L]';
  %enotska matrika
  C_m = [1,0;
         0,1]; 
  D   = [0, 0]';
  
  #solving systems
  sys = ss(A,B,C_m,D);
  [y,t,x]=lsim(sys, U,t,V_zac_pogoj);
  
  #zapis outs, ki je da lsim: za vse R-je
  Vc(:,i) = x(:,1);
  iL(:,i) = x(:,2);
  vizh(:,i) = y(:,1);
endfor

#draw
fig1 = figure(1);
set(fig1,'Units','centimeters','Position',[1 4 14 12]);
plot(Vc(:,1),iL(:,1), Vc(:,2),iL(:,2), Vc(:,3),iL(:,3), Vc(:,4),iL(:,4), Vc(:,5),iL(:,5));
%%axis([-2.1 2.1 -2.1 2.1]); 
grid;
legend("ζ=0","ζ=0.1","ζ=0.7","ζ=1","ζ=2")
xlabel('{\itv_C} [V] ({\itx}_1)'); ylabel('{\iti_L} [V] ({\itx})');
title('Trajektorija v prostoru stanj')
%pause(1);
%
%fig2 = figure(2);

%set(fig2,'Units','centimeters','Position',[16.5 1.5 20 16]);
%plot(t, Vc1, 'g', t, Vc2, 'b', t, vizh, 'r'); axis([0 0.003 -4.5 4.5]); grid;
%xlabel('{\itt} [s]'); ylabel('{\itv_C}_1 [V], {\itv_C}_2 [V], {\itv_{izh}} [V]');
%title('Časovna odvisnost spremenljivk stanj')
%pause(2);
