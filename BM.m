% Bisection method
%input: f:     function
    %       a, b:  are 2 real numbers such that (b>a) and (f(a)f(b)<0)
    %       tol:   is some fixed tolerance or precision
    %       itmax: maximum number of iteration
    
 %output:      x: approximate solution of "f(x)=0"
    %          fx: approximate value
    %          it: number of iteration
    %          nf: number of function's evaluation
    
function [x,v,it,nf,time] = BM(f,a,b,tol,itmax)

p = nargin();
if p<5
    itmax = 1000;
end

if p<4
    tol = sqrt(eps);
end

it = 0;

x = (a + b)/2;
v = f(x);
w = f(a);
time = cputime();
while max(b-a,abs(v))>tol && it<itmax
    it = it+1;    
    if v*w>0
        a = x;
        w = v;
    else 
        b = x;        
    end
    x = (a+b)/2;
    v = f(x);
end
time = cputime()-time;
nf = it+2;
end
