clc
close all
clear all
%%%%===================================================%%%%
% n = 200;
% delta_x = 1/(n+1);
% 
% b = ones(n,1); w = ones(n-1,1);
% A = 2*diag(b) - diag(w,1) - diag(w,-1);
% A = (1/delta_x^2)*A;
% 
% x = (delta_x:delta_x:1-delta_x)';
% g = max(0,1 - 100*(x - 0.7).^2);
% h = min(1,100*(x - 0.3).^2);

% lambda_1 = min(eig(A));
% lambda_n = max(eig(A));
% rho = 2/(lambda_1 + lambda_n);
% Tol = 10^-4;
% itmax = 10000;
% tic
% [u,v,it,err,vec_err,time] = PGM(A,b,g,h,x,rho,Tol,itmax);
% toc
% hold on
% plot(x,g,'r')
% plot(x,h,'g')
% plot(x,u,'b')

% lambda_1 = min(eig(A));
% rho = lambda_1;
% Tol = 10^-4;
% itmax = 10000;
% lambda0 = zeros(n,1);
% nu0 = zeros(n,1);
% [u,v,lambda,it,err,vec_err,time] = Uzawa(A,b,g,h,x,lambda0,nu0,rho,Tol,itmax);
% hold on
% plot(x,g,'r')
% plot(x,h,'g')
% plot(x,u,'b')

%% %%%%%
% % [t,sol] = ode45(@eq1,[0;10],[0;1]);
% % plot(sol(:,2),sol(:,1));
% % axis square
% % figure
% % plot(t,sol(:,1));
% 
A = [0 1; -1 0];
B = [0 0;0 1];
Q = eye(2,2);
R = Q;
J = care(A,B,Q,R);
a = sqrt(2*sqrt(2)-1);
Riccati = -[-a*sqrt(2) 1-sqrt(2); 1-sqrt(2) -a];

% u = -R^(-1)*B'*J*[0;1];
[t,sol] = ode45(@eq1,[0;10],[0;1]);

plot(t,sol(:,1));

[t,sol] = ode45(@eq1,[0;10],[-1;1]);
figure
plot(t,sol(:,1))
figure
plot(t,sol(:,2))
