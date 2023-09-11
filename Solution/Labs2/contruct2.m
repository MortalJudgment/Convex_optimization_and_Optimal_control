function [A,b,AA,bb] = contruct2(n)
b = ones(n,1);

w = ones(n-1,1);
v = 1:n;
v = 3*v.^2;
A = diag(v) + diag(w,1) + diag(w,-1);

c = 1:n;
c = 1./c;
C = diag(c);
AA = C*A*C;
bb = C*b;