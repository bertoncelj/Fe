#primer 3.6
# ẋ = Ax + Bu
# ẏ = Cx + Du

clear all; close all; 

# constant for DE
R1 = 2; #ohm
R2 = 1; #ohm
 
#kapacitivnost
C1 = 1; %farad
C2 = 1; %farad

#Casovni vektor
tz = 0; tk = 20; dt = 0.1; t=tz:dt:tk;


# U definition input
##Prva je enotina stopnica
##Druga je sinusen signal
U = ones(length(t),1); 
U_sin = sin(t);
%U = [ones(length(t),1), sin(length(t),1)];

#Zacetne vrednosti Vc1(0)=0V Vc2(0) = 0V
Vc01 = 0; Vc02 = 0;
Vc = [Vc01; Vc02];  #oba sta nic

# definition of A,B,C,D konstants

a11 = -1/C1*(1/R1+1/R2);
a12 = 1/(R1*C1);
a21 = 1/(R1*C2);
a22 = -1/(R1*C2);

b11 = 1/(R2*C1);
b12 = 0;

c11 = -1;
c12 = 1;

d11 = 1;

#konstante v prostoru matrix
A = [a11, a12; a21, a22];
B = [b11, b12]';
C = [c11, c12];
D = [d11];

#solving systems for unit step
sys = ss(A,B,C,D);
[y,t,x]=lsim(sys, U,t);

#solving system sin(x)
sys = ss(A,B,C,D);
[y_sin, t, x_sin] = lsim(sys, U_sin, t)

#zapis outs for unit step
Vc1 = x(:,1); Vc2 = x(:,2); vizh = y(:,1);

Vc1_sin = x_sin(:,1); Vc2_sin = x_sin(:,2); vizh_sin = y_sin(:,1);
#draw
  #Odziv na stopnico

fig1 = figure(1);
set(fig1,'Units','centimeters','Position',[1 4 14 12]);
plot(Vc1, Vc2);
grid;
xlabel('{\itv_C}_1 [V] ({\itx}_1)'); ylabel('{\itv_C}_2 [V] ({\itx}_2)');
title('Trajektorija v prostoru stanj, odziv na stopnico')
pause(1);

fig2 = figure(2);

set(fig2,'Units','centimeters','Position',[16.5 1.5 20 16]);
plot(t, Vc1, 'g', t, Vc2, 'b', t, vizh, 'r'); 
axis([tz tk -0.1 1.1]); grid;
legend("Vc1", "Vc2", "output")
xlabel('{\itt} [s]'); ylabel('{\itv_C}_1 [V], {\itv_C}_2 [V], {\itv_{izh}} [V]');
title('Časovna odvisnost spremenljivk stanj na enotino stponico')
pause(2);


#Odziv na sin
fig1 = figure(3);
set(fig1,'Units','centimeters','Position',[1 4 14 12]);
plot(Vc1_sin, Vc2_sin);
grid;
xlabel('{\itv_C}_1 [V] ({\itx}_1)'); ylabel('{\itv_C}_2 [V] ({\itx}_2)');
title('Trajektorija v prostoru stanj, odziv na sinus')
pause(3);

fig2 = figure(4);

set(fig2,'Units','centimeters','Position',[16.5 1.5 20 16]);
plot(t, Vc1_sin, 'g', t, Vc2_sin, 'b', t, vizh_sin, 'r'); 
; grid;
legend("Vc1", "Vc2", "output")
xlabel('{\itt} [s]'); ylabel('{\itv_C}_1 [V], {\itv_C}_2 [V], {\itv_{izh}} [V]');
title('Časovna odvisnost spremenljivk stanj na sinusesen signal')
pause(4);
  
#zapis outs
%U = ones(size(T)); 
%sys = ss(A,B,C,D);             % construct a system model
%[Y, Tsim, X] = lsim(sys,U,T);  % simulate
%plot(Tsim,Y)                   % plot the output vs. time
%title('Step Response with Zero Initial Conditions');
%
%figure(3)
%
%T = 0:0.01:10;                  % simulation time = 10 seconds
%U = sin(T);             % input as a function of time
%sys = ss(A,B,C,D);              % construct a system model
%[Y, Tsim, X] = lsim(sys,U,T);   % simulate
%plot(Tsim,Y)                    % plot the output vs. time
%title('Response to a Sinusoid Input with Zero Initial Conditions')

