 ## This is a demo of a second order transfer function and a unit step input.
 ## in laplace we would have        1                       1
 ##                              _______________         *  _____
 ##                             s^2 + sqrt(2)*s +1           s
 ##
 ## So the denominator is s^3 + sqrt(2) * s^2 + s
 # and for laplace initial conditions area
 ##             t(0)=0 t'(0) =0  and the step has initial condition of  1
 ## so we set   t''(0)=1
 ## In the code we use diff(y,1)(0) == 0 to do t'(0)=0
 ##
 ## I know that all this can be done using the control pkg
 ## But I used this to verify that this solution is the
 ##   same as if I used the control pkg.
 ## With this damping ratio we should have a 4.321% overshoot.
 ##
 syms y(x) 
 de =diff(y, 3 ) +sqrt(2)*diff(y,2) + diff(y) == 0;
 f = dsolve(de, y(0) == 0, diff(y,1)(0) == 0 , diff(y,2)(0) == 1)
 ff=function_handle(rhs(f))
  x1=0:.01:10;
 y=ff(x1);
 plot(x1,y)
 grid minor on