function [x,v,it,err,vec_err,time] = GMC(A,b,x0,p,Tol,itmax)
if nargin < 5
    itmax = 1000;
    if nargin == 2
        Tol = sqrt(eps);
    end
end 
it = 0;
x = x0;         d = b - A*x;
err = norm(d);  vec_err = [err];
time  = cputime();
%tik
while (err > Tol)&&(it < itmax)
    x = x + p*d;
    d = b - A*x;
    err = norm(d);
    vec_err = [vec_err;err];
    it = it + 1;
end
v = 0.5*x'*A*x - b'*x;
time = cputime() - time;
%time = tok
end



