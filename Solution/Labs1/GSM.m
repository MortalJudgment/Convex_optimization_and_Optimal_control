% Minimization of unimodular functions ( the Golden Section Method )
function [x,v,it,nf] = GSM(f,a,b,Tol,itmax)
if nargin < 5
    itmax = 1000;
    if nargin == 2
        Tol = sqrt(eps);
    end
end 
it = 0;
p = (sqrt(5)-1)/2;
c = b - p*(b-a);
d = b + p*(b-a);
fc = f(c);
fd = f(d);
x = c;
v = f(x);

while (it < itmax)
    if (abs(v) < Tol || abs(c-d) < Tol)
        break;
    end
    if (fc < fd)
        b = d;
        d = c;
        fd = fc;
        c = b - p*(b-a);
        fc = f(c);
    else
        a = c;
        c = d; 
        fc = fd;
        d = a + p*(b-a);
        fd = f(d);
    end
    it = it + 1;
    x = c;
    v = f(c);
end
nf = it + 2;