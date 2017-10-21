## The following code will produce the same vector field plot as Figure 1.14 from Example 1.6 (pg. 39) from A Student's Guide to Maxwell's Equations by Dr. Daniel Fleisch.

## Make sure symbolic package is loaded and symbolic variables declared.
pkg load symbolic
syms x y

## Write a Vector Field Equation in terms of symbolic variables 
vectorfield = [sin(pi*y/2); -sin(pi*x/2)];

## Vector components are converted from symbolic into "anonymous functions" which allows them to be graphed.
## The "'vars', [x y]" syntax ensures each component is a function of both 'x' & 'y'
iComponent = function_handle (vectorfield(1), 'vars', [x y]); 
jComponent = function_handle (vectorfield(2), 'vars', [x y]); 

## Setup a 2D grid
[X,Y] = meshgrid ([-0.5:0.05:0.5]);

figure
quiver (X, Y, iComponent (X, Y), jComponent (X,Y))