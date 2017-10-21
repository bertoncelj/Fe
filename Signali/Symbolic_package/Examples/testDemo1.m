## Demo of how to use a number (which was calculated in an octave
## variable) in a symbolic calculation, without getting a warning.

## use octave to calculate some number:
 a = pi/2

## now do some work with the symbolic pkg
 syms x
 f = x * cos(x)
 df = diff(f)

## Now we want to evaluate df at a:

 # subs (df, x, a)     # this gives the "rats" warning (and gives a symbolic answer)

## So instead, try

 dfh = function_handle (df)

 dfh (a)



## And you can evaluate dfh at an array of "double" values:

 dfh ([1.23 12.3 pi/2])

