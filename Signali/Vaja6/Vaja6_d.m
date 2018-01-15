clear all; close all;

R1 = 10e3; R2 = 10e3; R3 = 50e3; C = 400e-12;
w = 5e4; T = 2*pi/w;

syms V1 Vizh Vg s H w0
f1 = '-(Vg - V1)/R1 -(Vizh - V1)/R2';
f2 = '-(Vg - V1)*s*C - V1/R3';
f3 = 'H = Vizh/Vg';
A = solve(f1,f2,f3,V1,Vizh, H);
AH = A.H;

AH_collect = collect(AH);
H = subs(AH); H = collect(H);

[nx,dx] = numden(AH);

nx = collect(nx);
dx = collect(dx);

%nx = sym2poly(nx);
%dx = sym2poly(dx);

nx = vpa(nx/dx(1), 5);
dx = vpa(dx/dx(1), 5);
nx = poly2sym(nx, sym('s'));
dx = poly2sym(dx, sym('s'));

H = nx/dx

H_w = subs(AH, 's', 'i*w'); H_w = subs(H_w)
H_w_real = eval(real(H_w))
H_w_imag = eval(imag(H_w))

fi = atan(H_w_imag/H_w_real) *180/pi; fi = round(f1)
if (H_w_real<0)&&(H_w_imag<0)
    fi = fi-180;
elseif(H_w_real<0)&&(H_w_imag>0)
    fi = fi+180;
end
fi = vpa(fi,5)

Vg = sym('cos(w0*t)*heaviside(t)'); 
Vg = laplace(Vg,'t',s) 
Vg = subs(Vg, 'w0', w);
Vizh = H*Vg;
Vizh = vpa(Vizh,5)
Vizh = vpa(collect(Vizh),5)
vizh = ilaplace(Vizh,s,'t'); 
vizh = vpa(vizh,5)

t = 0: 3*T/100: 3*T;
x = cos(w*t);
y = subs(vizh,t);
%y = eval(y);

fig1= figure(1); 
plot(t,x,t,y); grid; 
title('Èasovni ozdiv na vhodni signal');


