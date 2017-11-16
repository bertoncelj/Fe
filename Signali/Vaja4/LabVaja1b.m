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
clear all; close all;
#constante
f = 1000;
Ra = 1000;
Rb = 2000;
R1 = 1000;
R2 = 1000;
C  = 1/(2*pi*f*sqrt(R1*R2));
C1 = C;
C2 = C;
tz = 0; tk = 0.01; dt = 0.000001; t=tz:dt:tk;


#Matrike
a11 = Rb/Ra/(R2*C1)-1/(R1*C1); a12 = -1/(R2*C1);
a21 = Rb/Ra/(R2*C2); a22 = -1/(R2*C2);
b11 = 0; b12 = 0; b21 = 0; b22 = 0;
c11 = 1 + Rb/Ra; c12 = 0;
d11 = 0; d12 = 0;

A = [a11, a12; 
     a21, a22;];
     
B = [b11; b12];        #transpose
C = [c11,   c12];
D = [0; 0];               #transpose
sys = ss([0, 1; 2, -3], [0;  1], [1, 0; 0, 1], [0; 0]);
figure(1)
T = 0:0.01:10;         % simulation time = 10 seconds
U = [zeros(size(T)) , zeros(size(T))];    % no input
X0 = [0.1 0.1 0.1];    % initial conditions of the three states
%sys = ss(A,B,C,D);     % construct a system model
lsim(sys, U, T, X0)    % simulate and plot the response (the output)
title('Response to Non-Zero Initial Conditions')

#unit step
figure(2)
U = ones(size(T));             % u = 1, a step input
sys = ss(A,B,C,D);             % construct a system model
[Y, Tsim, X] = lsim(sys,U,T);  % simulate
plot(Tsim,Y)                   % plot the output vs. time
title('Step Response with Zero Initial Conditions')

#sinus input
figure(3)
T = 0:0.01:10;                  % simulation time = 10 seconds
U = 0.1*sin(5*T+1);             % input as a function of time
sys = ss(A,B,C,D);              % construct a system model
[Y, Tsim, X] = lsim(sys,U,T);   % simulate
plot(Tsim,Y)                    % plot the output vs. time
title('Response to a Sinusoid Input with Zero Initial Conditions')