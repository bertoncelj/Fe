#primer 3.6
# ẋ = Ax + Bu
# ẏ = Cx + Du

#  | dil1/dt|   |-R1/L  0   -1/L  |   |il1|   |1/L1|
#  | dil2/dt| = |0    -R2/L2  1/L2| * |il2| + | 0  |Vg
#  | dVc/dt |   |1/C  -1/C    0   |   |vc |   | 0  |
#       ẋ     =            A            X       B    u

#   |Vr1|    |R1*il1 |   |R1 0 0 |   |il1|   |0|
#   |   | =  |       | = |       | * |il2| + | |*Vg
#   |Vr2|    |R2*il2 |   |0 R2 0 |   |vc |   |0|
#     ẏ   =                  C         x   +  D   u
# constant for DE
clear all; close all; 

freq = 1000; %Hertz
Ra = 1000;
Rb = 2000;
 
R1 = 1000; #ugotovljena upornost R1 in R2 da nihasitem
R2 = 1000; #vprasej profesorja kje so to dobi

#kapacitivnosti
C = 1/(2 * pi * freq * sqrt(R1*R2));
C1 = C; 
C2 = C;

#Casovni vektor
#tz = 0; tk = 0.01; dt = 0.000001;
t=0 : 0.000001 : 0.01;

# U definition input, both zeros matrixs
U = [zeros(length(t),1), zeros(length(t),1)];

#Zacetne vrednosti Vc1(0)=1V Vc2(0) = 0V
Vc01 = 1; Vc02 = 0;
Vc = [Vc01; Vc02];

# definition of A,B,C,D konstants
a11 = Rb/Ra/(R2*C1)-1/(R1*C1); a12 = -1/(R2*C1);
a21 = Rb/Ra/(R2*C2); a22 = -1/(R2*C2);
b11 = 0; b12 = 0; b21 = 0; b22 = 0;
c11 = 1 + Rb/Ra; c12 = 0;
d11 = 0; d12 = 0;

#konstante v prostoru matrix
A = [a11, a12; a21, a22];
B = [b11, b12; b21, b22];
C = [c11, c12];
D = [d11, d12];

#solving systems
sys = ss(A,B,C,D);
[y,t,x]=lsim(sys, U,t,Vc);

#zapis outs
Vc1 = x(:,1); Vc2 = x(:,2); vizh = y(:,1);

#draw
fig1 = figure(1);
set(fig1,'Units','centimeters','Position',[1 4 14 12]);
plot(Vc1, Vc2); axis([-2.1 2.1 -2.1 2.1]); grid;
xlabel('{\itv_C}_1 [V] ({\itx}_1)'); ylabel('{\itv_C}_2 [V] ({\itx}_2)');
title('Trajektorija v prostoru stanj')
pause(1);

fig2 = figure(2);

set(fig2,'Units','centimeters','Position',[16.5 1.5 20 16]);
plot(t, Vc1, 'g', t, Vc2, 'b', t, vizh, 'r'); axis([0 0.003 -4.5 4.5]); grid;
xlabel('{\itt} [s]'); ylabel('{\itv_C}_1 [V], {\itv_C}_2 [V], {\itv_{izh}} [V]');
title('Časovna odvisnost spremenljivk stanj')
pause(2);
