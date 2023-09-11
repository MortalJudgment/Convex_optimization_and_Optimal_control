function Xdot = eq1(t,X)
% Xdot = [X(2);-X(1)];
A = [0 1;0 0];
B = [0 0;0 1];
u = [0;0];
a = sqrt(2*sqrt(2)-1);
P = -[-a*sqrt(2) 1-sqrt(2); 1-sqrt(2) -a];
% Q = eye(2,2); R = Q;
% P = care(A,B,Q,R);
Xdot = A*X + B*u - B'*P*X;