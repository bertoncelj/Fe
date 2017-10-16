clear all;
a = 10;
%fib = ones (1, 5)
%for i = 2:5
%  fib(i) = fib(i) + (i-1)
%endfor

[num,txt,raw] = xlsread('vaja2.xlsx','Sheet1');
numbro = xlsread('vaja2.xlsx','B3:B12');
original = xlsread('vaja2.xlsx','B2:B11');
cas = xlsread('vaja2.xlsx','C2:C11');
stevilke = num(:,1);
%stevilke1 = stevilke(:,2);

Minus = abs(numbro() - original());

stairs(cas,Minus,'LineWidth',3);

poloznica(287,1,70)
xlabel('Cas/h');ylabel('P / MW');