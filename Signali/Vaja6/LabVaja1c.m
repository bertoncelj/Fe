clear all; close all;

#symbolic sytem
syms x(t) s X;

#define coiff in circuit
R1 = 1; 
R2 = 1; 
gm = 1; 
C1 = vpa ('1 / 4', 32);     %Farad
C2 = vpa('1/2', 32);        %Farad
L  = vpa('1/2', 32);         %Henry

#original rhs VG signal 
#coifficients of Vg signal transform in c0, c1, c2 
#beacuse passing floating-point values to sym is dangerous
c0 = 1;
c1 = vpa ('1/5', 32);
c2 = vpa ('1/10', 32);
rhs = c0*sin(2*t) + c1*sin(20*t) + c2*sin(100*t);

#transfrom lhs to LHS
  #coificinets
  a3 = R1*C1*L*C2;
  a2 = C1*L*R2*R1;
  a1 = R1*C2;
  a0 = R1(1/R2 - gm +1);
  
  #start possition
  x0 = 0;
  x1 = 0;
  xdot0 = 0;
  
  #LT for eaxh diff equation
  Lx   = X;
  LTx  = s*X;
  LT2x = s^2*X;
  LT3x = s^3*X;

LHS = a3*LT3x + a2*LT2x + a1*LTx + a0*Lx;

#transform rhs to RHS
RHS = laplace(rhs,t,s); % The t and s in laplace aren't necessary, as they are default

#getter both equations
IVP = LHS - RHS;

coeff = coeffs(IVP,X);
IVPEQ = coeff*[1;X] == 0;

X = solve(IVPEQ,X);

X = partfrac(X);

sol = ilaplace(X, s, t)

#STAPH
printf("We pause program. Press ENTER to continue! \n");
pause;

#DRAW
#Translate solutions to functions  for numeric solution
printf("Numeric translate solution: \n");
ff   = function_handle(sol)

#time vector to draw
tz=0; tk=10; dt=0.001;
t=tz:dt:tk;
y  = ff(t);

#plot of input Vg to output
fig1 = figure(1);
plot(t, y);

grid;
xlabel('čas {\itt} [s]'); 
ylabel('{\itv}_i_z_h [V]');
title('Časovni odziv na vhodni signal');
pause(1);
