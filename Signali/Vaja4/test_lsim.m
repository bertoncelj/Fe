R1 = 2; R2 = 1; C1 = 1; C2 = 1; 

a11 = -1/C1*(1/R1+1/R2); a12 = -1/(R1*C1); a21 = -1/(R1*C2); a22 = -1/(R1*C2);
b11 = 1/(R2*C1); b12=0; b21=0; b22=0;
c11 = -1; c12 = -1; c21=0; c22=1;
d11 = 1; d12=0; d21=0; d22=0;
u1 = zeros(size(t)); u2 = zeros(size(t)); u1 = sin(t);
U = [u1; u2];
A = [a11, a12; a21, a22]; % osnovna matrika sistema
B = [b11, b12; b21, b22]; % vhodna matrika
C = [c11, c12; c21, c22]; % izhodna matrika
D = [d11, d12; d21, d22];
x01 = 1; x02 = 0;                    % začetno stanje
X0 = [x01; x02]; 

T = 0:0.01:2; 
size(T)
size(U)                 % simulation time = 10 seconds
#U = 0.1*sin(5*T+1);             % input as a function of time
sys = sys2ss(A,B,C,D);              % construct a system model
[Y, Tsim, X] = lsim(A,B,C,D,U,T);   % simulate
plot(Tsim,Y)                    % plot the output vs. time
title('Response to a Sinusoid Input with Zero Initial Conditions');
