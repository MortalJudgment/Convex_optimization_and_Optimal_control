function [t,v,it] = Armijo(f,x0,d,alpha,beta,t0,itmax)

t = t0;
u =  x0+t*d;
[v,g]  = f(u);
v0 = f(x0);
it = 0;
while (v  > v0 +  alpha*t*g'*d) && it<itmax
    it = it+1;
    t = beta*t;
    u =  x0+t*d;
    v = f(u);
    
end
end