function [x,v,it,err,vec_err,time] = Newton0(f,x0,Tol,itmax,type)
it = 0;     x = x0;
[v,g,H] = f(x,type);
err = norm(g);      vec_err = [err];
time  = cputime();
%tik
while (err > Tol)&&(it < itmax)
    d = -H\g;
    x = x + d;
    [v,g,H] = f(x,type);
    err = norm(g);
    vec_err = [vec_err;err];
    it = it + 1;
end
time = cputime() - time;
%time = tok
end