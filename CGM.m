function [ x,v,it,err,vecterr ] = CGM( A,b,x0,tol,itmax)
    x = x0;
    r = A*x - b;  %(gradJ(x))
    d = -r;
    err = norm(r);
    vecterr = [err];
    it = 1;
    
    while err > tol && it < itmax
        it = it+1;
        p = (-d'*r)/(d'*A*d);% take care to the numerator
        x = x + p*d;
        r0 = r;  % store the previous gradient 
        r = A*x - b;% compute the new one 
        beta = (r'*r)/(r0'*r0); % compute beta
        d = -r + beta*d;% correct the direction
        err = norm(r);
        vecterr = [vecterr err];
    end
    
    v = .5*(x'*A*x) - b'*x;

end


