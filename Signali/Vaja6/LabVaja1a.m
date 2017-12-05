close all; clear all;

#Casovni vektor
tz=0; tk=10; dt=0.01;
t=tz:dt:tk;

#create symbolic operators
syms s

#function from LTI system calculated by MATLAB
fun = 8/(s^3 + 9*s^2 + 22*s +32)

#seperate on numeretor and denominator
[num, den] = numden(fun)
a = sym2poly(num,s)
b = sym2poly(den,s)

#convert symbolic to numerical
A = double(a) 
B = double(b)

#calcuate Zeros, pols, and Konstants
[z, p, k] = tf2zp (A, B)
z %zero
p %pols 
k %konstants




#build system LTI
h = tf(A,B)
u = sin(2*t) + 0.2*sin(20*t) + 0.1*sin(100*t);

#
y_step = step(h,t);           %step input
y_impulse = impulse(h, t);    %impluse imput
Ug_sin_singal = lsim(h,u,t);  %sin input

#draw
%y_impulse = impulse(b,a,t); y_step = step(b,a,t); u=sin(2*pi*t); y_lsim=lsim(b,a,u,t);

fig1 = figure(1); set(fig1, 'Units', 'centimeters', 'Position', [1 2 12 11]);
plot(t, y_impulse, 'k', 'LineWidth', 1); grid;
xlabel('čas {\itt} [s]'); ylabel('{\itv}_i_z_h [V]');
title('Časovni odziv na enotin impulz');
pause(1);

fig3 = figure(3)
plot(t, y_step, 'k', 'LineWidth', 1); grid;
xlabel('čas {\itt} [s]'); ylabel('{\itv}_i_z_h [V]');
title('Časovni odziv na enotino stopnico');
pause(3)
fig2 = figure(2); set(fig2, 'Units', 'centimeters', 'Position', [14 2 12 11]);
plot(t,Ug_sin_singal,'r','LineWidth',2); grid;
legend("u = sin(2*t) + 0.2*sin(20*t) + 0.1*sin(100*t);")
xlabel('čas {\itt} [s]'); ylabel('{\itv}_i_z_h [V]');
title('Časovni odziv na vhodni signal')
pause(2);

figure(4)
 set(fig3, 'Units', 'centimeters', 'Position', [27 2 12 11]);
plot(p,'rx','LineWidth',2); hold on; plot(n,'go','LineWidth',2); grid;
xlabel('Re[s]'); ylabel('Im[s]');
title('Poli(x) in ničle (o) prevajalne funkcije {\itH}({\its})') 
pause(4)