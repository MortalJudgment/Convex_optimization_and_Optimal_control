function [t,x,it] = Armijo(f,d,x0,t0,alpha,beta,itmax)
it = 0;
t =  t0;
x = x0;
[v,g] = f(x);
v0 = v;
while (v > v0 + alpha*t*g*d) && (it < itmax)
    t = beta*t;
    x = x0 + t*d;
    v = f(x);
    it = it + 1;
end

