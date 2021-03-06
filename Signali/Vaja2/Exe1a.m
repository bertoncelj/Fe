close all; clear all;

##Function_handle
#Function handles are used to call other functions indirectly, 
#or to pass a function as an argument to another function like quad or fsolve


vpis = disp("x^2 + 3*x - 1 + 5*x*sin(x)")
str_fucn = vpis;
fucn_sym=sym(str_fucn)
f=function_handle(fucn_sym)
# now back to symbolic
syms x;
ff=formula(f(x));
% now calculate the derivative of the function 
ffd=diff(ff);
% and convert it back to an Anonymous function
df=function_handle(ffd)
% now lets do the second derivative
ffdd=diff(ffd);
ddf=function_handle(ffdd)
% and now plot them all 
x1 = -10 : .01 : 10;
plot(x1,f(x1),x1,df(x1),x1,ddf(x1))
grid minor on
legend("f","f '", "f '' ")