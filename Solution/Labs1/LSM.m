% Line Search Methods
% Armijo "Backtracking"
% beta is step size
% d is a descent direction 
% t0 is initial time
function [x,v,it,nf] = LSM(x0,alpha,beta,t0,d,Tol,itmax)
it = 0;
x = zeros(1,length(x0));
v = f(x);
while (it < itmax) && (abs(v) > Tol)
    
end