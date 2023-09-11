function [x,v,it,err,vec_err,time] = CGM(A,b,x0,Tol,itmax)
if nargin < 5
    itmax = 1000;
    if nargin == 2
        Tol = sqrt(eps);
    end
end 
it = 0;
x = x0;         r = A*x - b;    d = -r;
err = norm(d);  vec_err = [err];
time  = cputime();
%tik
while (err > Tol) && (it < itmax)
    p = (-d'*r)/(d'*A*d);
    x = x + p*d;
    r1 = A*x - b;
    beta = (r1'*r1)/(r'*r);
    d = - r1 + beta*d;
    err = norm(r1);
    vec_err = [vec_err;err];
    it = it + 1;
    r = r1;
end
v = 0.5*x'*A*x - b'*x;
time = cputime() - time;
%time = tok
end



