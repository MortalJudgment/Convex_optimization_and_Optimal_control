% *The projected gradient method:*
% The projected gradient algorithm combines
% a proximal step with a gradient step. This permits us solve a variety of
% constrained optimization problems with simple constrains, especially some
% non-smooth problems at linear rates.

% Input argument:
% A: matrix approximate second order derivative
% b: vetor 1
% g: function g that we approve maximum
% h: function h that we approve minimum
% x0: initial point
% p: gradient step size
% Tol: error
% itmax: maximum number of iteration
%%
function [x,v,it,err,vec_err,time] = PGM(A,b,g,h,x0,p,Tol,itmax)
if nargin < 6
    itmax = 10000;
    if nargin == 2
        Tol = 1e-4;
    end
end 
it = 0;
x = x0;         d = A*x - b;
err = 1 + Tol;  vec_err = [err];
time  = cputime();
while (err > Tol)&&(it < itmax)
    x_old = x;
    x = x - p*d;
    x = max(x,g);
    x = min(x,h);
    d = A*x - b;
    err = norm(x - x_old);
    vec_err = [vec_err;err];
    it = it + 1;
end
v = 0.5*x'*A*x - b'*x;
time = cputime() - time;
end



