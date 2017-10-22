## Demo of how to use a number (which was calculated in an octave
## variable) in a symbolic calculation, without getting a warning.

## use octave to calculate some number:
 a = pi/2

## now do some work with the symbolic pkg

function dydt = f(t,y)
dydt(1) = y(2);
dydt(2) = y(3);
dydt(3) = y(1)*y(3)-1;