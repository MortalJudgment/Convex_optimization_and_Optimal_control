function [x,v,it,nf,time] = GSM(f,a,b,tol,itmax)

%% Input
    % f is an m function
    % a; b (b > a) are two real numbers
    % Tol is some fixed tolerance or precision
    % itmax is the maximum number of iterations

%% Output

    %x is a minimum point of f over [a; b]
    % v is a minimum of f over [a; b]
    % it is the number of iterations
	% nf is the number of function's evaluations
p1 = nargin();
if p1<5
    itmax = 1000;
end

if p1<4
    tol = sqrt(eps);
end

p = (sqrt(5)-1)/2;
it = 0;
c = b - p*(b-a);
d = a + p*(b-a);
f_c  = f(c);
f_d  = f(d);
time = cputime();

while it< itmax  && abs(c-d)>tol
    
    it = it + 1;
    if f_c  <  f_d 
        b  = d;
        d = c;
        f_d = f_c;
        c  =  b -p*(b-a);
        f_c = f(c);
    else
        a = c;
        c  = d;
        f_c = f_d;
        d = a + p*(b-a);
        f_d = f(d);
    end
end
    time = cputime()-time;
    nf = it+2;
    x=c;
    v=f_c;
end



    
    
    
    

