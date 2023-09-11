function [x ,v ,it , nf] = Newton(fgradf, x0, Tol, itmax)
  
   [v,g] = fgradf(x0);
   x = x0;
   it = 0;
   error = abs(v);
   while  error > Tol && it < itmax
     it = it + 1;
     x = x - v/g;
     [v,g] = fgradf(x);
     error = abs(v);
   end
   nf = it + 1;
   
  end