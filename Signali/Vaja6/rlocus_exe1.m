clear all; close all;
b=[10 0];a=[.25 1 10]
Go=tf(b,a);
%sysout(Go,"tf")
rlocus(Go);
hold on
[rldata, k_break, rlpol, gvec] = rlocus(Go);
Nloci=length(rldata(:,1));
 
for n=1:N
[X,Y]=ginput(1);Wn=abs(X+i*Y);
k=1;
while k < Nloci + 1
%for k=1:Nloci
 
[A,B]=min(abs((X+Y*i)-(rldata(k,:))));
if(A)<.3;
BB=B;l=k;AA=A;
end
k = k+1;
end
plot(X+i*Y,'xr')%plot(rldata(l,BB),'xr')
text(X,Y+.2,['gain  =  ' num2str(gvec(BB)) ';  \zeta =' num2str(-X/Wn) ';'],'fontsize',9)
text(X,Y-.2,['\omega_n  =  ' num2str(Wn)],'fontsize',9)
end