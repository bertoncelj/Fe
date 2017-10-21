% this is just a formula to start with,
% have fun and change it if you want to.

f = @(x) x.^2 + 3*x - 1 + 5*x.*sin(x);

% these next lines take the Anonymous function into a symbolic formula

pkg load symbolic
syms x;
ff = f(x);

% now calculate the derivative of the function

ffd = diff(ff, x);

% and convert it back to an Anonymous function

df = function_handle(ffd)


% this uses the interval pkg to find all the roots between -15 an 10 

pkg load interval
fzero (f, infsup (-15, 10), df)

