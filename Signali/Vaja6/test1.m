% Reševanje električnega vezja z Laplaceovo transformacijo
clear all; close all;
R1=1; R2=0.5; C=1; L=1; % vrednosti elementov
syms s V1 Vg Vizh H
f1 = '-(V1-Vizh)/(L*s)+Vizh/R2'; % vozliščne enačbe
f2 = '-(Vg-V1)/R1+V1*(C*s)+(V1-Vizh)/(L*s)';
f3 = 'H = Vizh/Vg';
A = solve(f1,f2,f3,V1,Vizh,H);
AH = A.H
AH_collect = collect(AH)
pretty(AH_collect)
AH = subs(AH); AH_collect = collect(AH)
[b, a] = numden(AH)
b = sym2poly(b)
a = sym2poly(a)
[n,p,k]=tf2zp(b,a)
t = 0:0.01:10;
y_impulse = impulse(b,a,t); y_step = step(b,a,t); u=sin(2*pi*t); y_lsim=lsim(b,a,u,t);
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
plot(p,'rx','LineWidth',2); hold on; plot(n,'go','LineWidth',2); grid;
xlabel('Re[s]'); ylabel('Im[s]');
title('Poli(x) in ničle (o) prevajalne funkcije {\itH}({\its})') 