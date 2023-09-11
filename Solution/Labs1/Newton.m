% Newton's method
function [x,v,it,nf] = Newton(f,x0,Tol,itmax)
it = 0;
nf = 1;
v = f(x0);
while (it < itmax)
    if abs(v) < Tol
        break;
    end
    x =  x0 - f(x0)/df(x0);
    %Update
    x0 = x;
    v = f(x0);
    it = it + 1;
    nf = nf + 1;
end
