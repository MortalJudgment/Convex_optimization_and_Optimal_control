function [t,x,it] = Armijo(f,x0,d,t0,alpha,beta,itmax,type)
if nargin < 8
    type = 1;
    if nargin < 7 
        itmax = 1000;
    end     
end

it = 0;         t =  t0;
x = x0;
[v,g] = f(x,type);
v0 = v;
while (v > v0 + alpha*t*g'*d) && (it < itmax)
    t = beta*t;
    x = x0 + t*d;
    v = f(x,type);
    it = it + 1;
end

