% Bisection method
function [x,v,it,nf] = BM(f,a,b,Tol,itmax)
if nargin < 5
    itmax = 1000;
    if nargin == 2
        Tol = sqrt(eps);
    end
end 

it = 0;
nf = 0; va = f(a);
while (it < itmax)
    x = (a+b)/2;
    v = f(x);
    if (abs(v) < Tol || abs((b-a)/2) < Tol)
        break;
    end
    it = it + 1;
    if (v*va > 0)
        a = x;
    else
        b = x;
    end
    nf = nf+1;
end

