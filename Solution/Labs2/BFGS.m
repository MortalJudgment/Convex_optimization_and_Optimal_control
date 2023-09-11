function [x,v,it,err,vec_err,time] = BFGS(f,x0,Tol,itmax,type)
it = 0;     x = x0;
[v,g] = f(x,type);
n = size(x,1);
S = eye(n,n);
err = norm(g);      vec_err = [err];
time  = cputime();
%tik
while (err > Tol)&&(it < itmax)
    it = it + 1;
    d = -S*g;
    t = Armijo(f,x,d,1,0.4,0.5,20,type);
    x = x + t*d;
    p = t*d;
    g0 = g;
    [v,g] = f(x,type);
    err = norm(g);
    vec_err = [vec_err;err];
    q = g - g0;
    S = S + (1+((q'*S*q)/(q'*p)))*((p*p')/(p'*q)) - ((p*q'*S + S*q*p')/(q'*p));
end
time = cputime() - time;
%time = tok
end