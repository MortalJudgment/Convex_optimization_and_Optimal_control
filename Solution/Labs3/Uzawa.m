function [x,v,lambda,it,err,vec_err,time] = Uzawa(A,b,g,h,x0,lambda0,nu0,p,Tol,itmax)
if nargin < 6
    itmax = 10000;
    if nargin == 2
        Tol = 1e-4;
    end
end 
it = 0;
x = x0;         lambda = lambda0;   nu = nu0;
err = 1 + Tol;  vec_err = [err];
time  = cputime();
n = size(b);
%tic
while (err > Tol)&&(it < itmax)
    x_old = x;
    x = A\(b + lambda - nu);
    lambda = max(0,lambda + p*(g - x));
    nu = max(0,nu + p*(x - h));
    err = norm(x - x_old);
    vec_err = [vec_err;err];
    it = it + 1;
end
v = 0.5*x'*A*x - b'*x;
time = cputime() - time;
%time = toc
end