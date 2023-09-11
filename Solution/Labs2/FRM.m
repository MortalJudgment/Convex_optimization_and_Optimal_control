function [x,v,it,err,vec_err,time] = FRM(f,x0,Tol,itmax,type)

it = 0;
x = x0;
itar = 20;
[v,g] = f(x,type);
err = norm(g);      vec_err = [err];
time  = cputime();  d = -g;
%tik
while (err > Tol)&&(it < itmax)
    p = Armijo(f,x,d,1,0.4,0.5,itar,type);
    x = x + p*d;
    r0 = err;
    [v,g] = f(x,type);
    beta = (err^2)/(r0^2);
    d = -g + beta*d;
    err = norm(g);
    vec_err = [vec_err;err];
    it = it + 1;
end
time = cputime() - time;
%time = tok
end
