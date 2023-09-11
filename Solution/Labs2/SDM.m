function [x,v,it,err,vec_err,time] = SDM(f,x0,Tol,itmax,type)
if nargin < 5
    type = 1;
    if nargin < 4
        itmax = 1000;
        if nargin < 3
            Tol = sqrt(eps);
        end
    end
end

it = 0;     x = x0;
itar = 20;
[v,g] = f(x,type);
err = norm(g);      vec_err = [err];
time  = cputime();  d = -g;
%tik
while (err > Tol)&&(it < itmax)
       %Armijo(f,x0,d,t0,alpha,beta,itmax,type)
    p = Armijo(f,x,d,1,0.4,0.5,itar,type);
    x = x + p*d;
    [v,g] = f(x,type);
    d = -g;
    err = norm(g);
    vec_err = [vec_err;err];
    it = it + 1;
end
time = cputime() - time;
%time = tok
end



