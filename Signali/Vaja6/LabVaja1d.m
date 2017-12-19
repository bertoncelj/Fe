clear all; close all; 
R1=10000; R2=10000; C = 400*10^-12; R3 = 50000;                     
% vrednosti elementov
syms s t Vg V1 Vizh H;
f1 = '-(Vg-V1)/R1+(V1-Vizh)/R2';              
f2 = '-(Vg-V1)*C*s+V1/R3'; 
f3 = 'H=Vizh/Vg';
A = solve(f1,f2,f3,'V1,Vizh,Vg,H'); 
 
vg=cos(50000*t);
Vg=laplace(vg,s)
Vizh = A.H*Vg  %v laplacovem prostoru je konvolucija produkt prevajalne funkcije in Laplaca od vhodnega signala
Vizh=subs(Vizh)
[b, a] = numden(Vizh) 
b = sym2poly(b) 
a = sym2poly(a)

[R,P,K]=residue(b,a)
[n,p,k]=tf2zp(b,a) 
 
 if size(K) == 0
     Vizh_r = 0
 else
     Vizh_r = K
 end
 for i = 1:length(R)
     Vizh_r=Vizh_r+R(i)/(s-P(i))
 end
 vizh= ilaplace(Vizh_r)
 pretty(vpa(vizh,4))
t = 0:0.01:10;
vg=cos(50000*t)*ones(size(t));
vizh=subs(vizh)

 fig1 = figure(1);   set(fig1, 'Units', 'centimeters', 'Position', [1 2 12 11]); 
subplot(2,2,1); 
plot(t, vizh, 'r'); grid; xlabel('èas {\itt}  [s]'); ylabel('Vizh[V]'); 
title('Odziv na poljubni signal'); 
subplot(2,2,3); 
plot(t, vg, 'k'); grid; xlabel('èas {\itt}  [s]'); ylabel('Vg[V]'); 
title('Vhodni signal'); 
subplot(2,2,2);
plot(p,'rx','LineWidth',2); hold on;  plot(n,'go','LineWidth',2); grid; 
xlabel('Re[s]'); ylabel('Im[s]'); 
title('Poli(x) in nièle (o) prevajalne funkcije {\itH}({\its})') 
subplot(2,2,4);
plot(R,'rx','LineWidth',2); hold on;   
xlabel('Re[s]'); ylabel('Im[s]'); 
title('Residui prevajalne funkcije {\itH}({\its})') 