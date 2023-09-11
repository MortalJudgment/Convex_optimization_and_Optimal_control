function [A,b] = contruct(n)
b = ones(n,1);

v = ones(n-1,1);
A = 4*diag(b) - 2*diag(v,1) - 2*diag(v,-1);
A(n,1) = -1;
A(1,n) = -1;