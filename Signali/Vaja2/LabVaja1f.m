clear all; close all;


##konstante 1.b
Lr = vpa ('1 / 100', 32);     %Henry
Cr = vpa('1/1000000', 32);    %Farad
Rr = vpa('1', 32);            %ohm
Rr0 = 0;
Rr01 = 20;
Rr07 = 140;
Rr1 = 200;
Rr2 = 400;

syms Uc(t)

DE  = Cr*Lr*diff(Uc, t, t) + Rr0*Cr*diff(Uc, t) + Uc == 1
DE1 = Cr*Lr*diff(Uc, t, t) + Rr01*Cr*diff(Uc, t) + Uc == 1
DE2 = Cr*Lr*diff(Uc, t, t) + Rr07*Cr*diff(Uc, t) + Uc == 1
DE3 = Cr*Lr*diff(Uc, t, t) + Rr1*Cr*diff(Uc, t) + Uc == 1
DE4 = Cr*Lr*diff(Uc, t, t) + Rr2*Cr*diff(Uc, t) + Uc == 1

sol = dsolve (DE, Uc(0) == 10, diff(Uc)(0) == 0)
sol1 = dsolve (DE1, Uc(0) == 10, diff(Uc)(0) == 0)
sol2 = dsolve (DE2, Uc(0) == 10, diff(Uc)(0) == 0)
sol3 = dsolve (DE3, Uc(0) == 10, diff(Uc)(0) == 0)
sol4 = dsolve (DE4, Uc(0) == 10, diff(Uc)(0) == 0)


#casovna skala
t1 = 0 : .000001 : .002;

 ff   = function_handle(rhs(sol));
 ff01 = function_handle(rhs(sol1));
 ff07 = function_handle(rhs(sol2));
 ff1 = function_handle(rhs(sol3));
 ff2 = function_handle(rhs(sol4));

y  = ff(t1);
y1 = ff01(t1); 
y2 = ff07(t1);
y3 = ff1(t1);
y4 = ff2(t1);
 
plot(t1,y,'b', t1, y1, 'r', t1, y2, 'g', t1, y3, 'y', t1, y4, 'k')

#tok

IL0 = Lr*diff(rhs(sol), t)
IL01 = Lr*diff(rhs(sol1), t)
IL07 = Lr*diff(rhs(sol2), t)
IL1 = Lr*diff(rhs(sol3), t)
IL2 = Lr*diff(rhs(sol4), t)

FF   = function_handle((IL0));
FF01 = function_handle((IL01));
FF07 = function_handle((IL07));
FF1  = function_handle((IL1));
FF2  = function_handle((IL2));

tok_graf0 = FF(t1);
tok_graf1 = FF01(t1);
tok_graf2 = FF07(t1);
tok_graf3 = FF1(t1);
tok_graf4 = FF2(t1);

plot(t1,tok_graf0 ,'b', t1, tok_graf1, 'r', t1, tok_graf2, 'g', t1, tok_graf3, 'y', t1, tok_graf4, 'k')
 