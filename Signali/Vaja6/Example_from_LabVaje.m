% Reševanje električnega vezja z Laplaceovo transformacijo
clear all; close all;
R1=1; R2=0.5; C=1; L=1; % vrednosti elementov
syms s 



fun = (R2)/(s^2*C*R1*L +s*(R1*R2*C + L) + R1+R2)


[num, den] = numden(fun)

#just take constants
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

t = 0:0.01:10;

#Generiran inpulz na roko
U_imp = zeros(size(t));
U_imp(1) = 1;

  
 y_impulse = lsim(h, U_imp, t);
 y_step = step(h,t); 
 u=sin(2*pi*t);
 y_lsim=lsim(h,u,t);
 
fig1 = figure(1); set(fig1, 'Units', 'centimeters', 'Position', [1 2 12 11]);
subplot(2,1,1);
plot(t, y_impulse, 'k', 'LineWidth', 1); grid;
xlabel('čas {\itt} [s]'); ylabel('{\itv}_i_z_h [V]');
title('Časovni odziv na enotin impulz');
subplot(2,1,2);
plot(t, y_step, 'k', 'LineWidth', 1); grid;
xlabel('čas {\itt} [s]'); ylabel('{\itv}_i_z_h [V]');
title('Časovni odziv na enotino stopnico');

fig2 = figure(2); set(fig2, 'Units', 'centimeters', 'Position', [14 2 12 11]);
plot(t,y_lsim,'k','LineWidth',2); grid;
xlabel('čas {\itt} [s]'); ylabel('{\itv}_i_z_h [V]');
title('Časovni odziv na vhodni signal')

fig3 = figure(3); set(fig3, 'Units', 'centimeters', 'Position', [27 2 12 11]);
plot(p,'rx','LineWidth',2); hold on; 
plot(z,'go','LineWidth',2); grid;
xlabel('Re[s]'); ylabel('Im[s]');
title('Poli(x) in ničle (o) prevajalne funkcije {\itH}({\its})') 