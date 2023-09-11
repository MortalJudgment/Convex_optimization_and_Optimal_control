clc
clear all
close all
%%-----------------------------------------------------------------------%%
% %% Question 2.1
% n = 1 + floor(100*rand(1));
% b = 100*(rand(n,1)-0.5);
% A = 10*(rand(n,n) - 0.5);
% A = A'*A + 0.1*eye(n,n);
% x0 = zeros(n,1);
%
% p = 0.001;
% Tol = 1e-6;
% itmax = 10000;
%
% [x1,v1,it1,err1,vec_err1,time1] = GMC(A,b,x0,p,Tol,itmax);
% [x2,v2,it2,err2,vec_err2,time2] = GMO(A,b,x0,Tol,itmax);
% [x3,v3,it3,err3,vec_err3,time3] = CGM(A,b,x0,Tol,itmax);
% y1 = 0:1:it1;
% y2 = 0:1:it2;
% y3 = 0:1:it3;
% hold on
% plot(y1,vec_err1,'r')
% plot(y2,vec_err2,'b')
% plot(y3,vec_err3,'g')
% legend('Gradient Method with Constant step-size','Gradient Method with Optimal step-size','Conjugate Gradient Method')
% hold off

%%-----------------------------------------------------------------------%%
%% Question 2.2
% n = 10;
% [A,b] = contruct(n);
% if min(eig(A)) > 0
%     disp('A is positive defined')
% end
% p = 0.1;
% Tol = 1e-6;
% itmax = 100;
% x0 = zeros(n,1);
% [x1,v1,it1,err1,vec_err1,time1] = GMC(A,b,x0,p,Tol,itmax);
% [x2,v2,it2,err2,vec_err2,time2] = GMO(A,b,x0,Tol,itmax);
% [x3,v3,it3,err3,vec_err3,time3] = CGM(A,b,x0,Tol,itmax);
% y1 = 0:1:it1;
% y2 = 0:1:it2;
% y3 = 0:1:it3;
% hold on
% plot(y1,vec_err1,'r')
% plot(y2,vec_err2,'b')
% plot(y3,vec_err3,'g')
% legend('Gradient Method with Constant step-size','Gradient Method with Optimal step-size','Conjugate Gradient Method')
% hold off
%%
% %% Question 2.5
% p = 0.1;
% Tol = 1e-6;
% itmax = 10000;
% Vect_cond = [];
% vect_it1 = [];
% vect_it2 = [];
% vect_it3 = [];
% for n = 10:2:30
%     [A,b] = contruct(n);
%     c = cond(A);
%     Vect_cond = [Vect_cond;c];
%     x0 = zeros(n,1);
%     [x1,v1,it1,err1,vec_err1,time1] = GMC(A,b,x0,p,Tol,itmax);
%     [x2,v2,it2,err2,vec_err2,time2] = GMO(A,b,x0,Tol,itmax);
%     [x3,v3,it3,err3,vec_err3,time3] = CGM(A,b,x0,Tol,itmax);
%     vect_it1 = [vect_it1;it1];
%     vect_it2 = [vect_it2;it2];
%     vect_it3 = [vect_it3;it3];
% end
% figure(1)
% plot(vect_it1,Vect_cond,'-xr')
% figure(2)
% plot(vect_it2,Vect_cond,'-xr')
% figure(3)
% plot(vect_it3,sqrt(Vect_cond),'-xr')

%%-----------------------------------------------------------------------%%
%% Question 2.6a
% p = 0.1;
% Tol = 1e-6;
% itmax = 20000;
% Vect_cond = [];
% vect_it1 = [];
% vect_it2 = [];
% vect_it3 = [];
% for n = [10,100,1000]
%     [A,b] = contruct2(n);
%     c = cond(A);
%     Vect_cond = [Vect_cond;c];
%     x0 = zeros(n,1);
%     [x1,v1,it1,err1,vec_err1,time1] = GMC(A,b,x0,p,Tol,itmax);
%     [x2,v2,it2,err2,vec_err2,time2] = GMO(A,b,x0,Tol,itmax);
%     [x3,v3,it3,err3,vec_err3,time3] = CGM(A,b,x0,Tol,itmax);
%     vect_it1 = [vect_it1;it1];
%     vect_it2 = [vect_it2;it2];
%     vect_it3 = [vect_it3;it3];
% end

%% Question 2.6b
% p = 0.1;
% Tol = 1e-10;
% itmax = 20000;
% % Vect_cond = [];
% vect_it1 = [];
% vect_it2 = [];
% vect_it3 = [];
% for n = [100]
%     [A,b,AA,bb] = contruct2(n);
% %     c = cond(AA);
% %     Vect_cond = [Vect_cond;c];
%     x0 = zeros(n,1);
%     [x1,v1,it1,err1,vec_err1,time1] = GMC(A,b,x0,p,Tol,itmax);
%     [x2,v2,it2,err2,vec_err2,time2] = GMO(A,b,x0,Tol,itmax);
%     [x3,v3,it3,err3,vec_err3,time3] = CGM(A,b,x0,Tol,itmax);
% %     vect_it1 = [vect_it1;it1];
% %     vect_it2 = [vect_it2;it2];
% %     vect_it3 = [vect_it3;it3];
% end

%% Exercise 2.6c
% Question 1
% Tol = 1e-10;
% itmax = 20000;
% Vect_cond = [];
% vect_it1 = [];
% vect_it2 = [];
% vect_it3 = [];
% for n = [100]
%     [A,b,AA,bb] = contruct2(n);
%     c = cond(AA);
%     Vect_cond = [Vect_cond;c];
%     x0 = zeros(n,1);
%     [x11,v11,it11,err11,vec_err11,time11] = GMC(AA,bb,x0,p,Tol,itmax);
%     [x22,v22,it22,err22,vec_err22,time22] = GMO(AA,bb,x0,Tol,itmax);
%     [x33,v33,it33,err33,vec_err33,time33] = CGM(AA,bb,x0,Tol,itmax);
%     vect_it11 = [vect_it11;it11];
%     vect_it22 = [vect_it22;it22];
%     vect_it33 = [vect_it33;it33];
% end

% [L,U] = ilu(sparse(A));
% M = inv(L*U);
% [x111,v111,it111,err111,vec_err111,time111] = GMC(M*A,M*b,x0,Tol,itmax);
% [x222,v222,it222,err222,vec_err222,time222] = GMO(M*A,M*b,x0,Tol,itmax);
% [x333,v333,it333,err333,vec_err333,time333] = CGM(M*A,M*b,x0,Tol,itmax);
% s1 = 'GCM';
% % semilogy(vec_err1,'-x', 'DisplayName',s1)
% % hold on
% semilogy(vec_err11,'-x', 'DisplayName',s1)
% % hold on
% % semilogy(vec_err111,'-x', 'DisplayName',s1)
% s2 = 'GMO';
% % hold on
% % semilogy(vec_err2,'-x', 'DisplayName',s2)
% hold on
% semilogy(vec_err22,'-x', 'DisplayName',s2)
% hold on
% semilogy(vec_err222,'-x', 'DisplayName',s2)
% s3 = 'CGM';
% hold on
% semilogy(vec_err3,'-x', 'DisplayName',s3)
% hold on
% semilogy(vec_err33,'-x', 'DisplayName',s3)
% hold on
% semilogy(vec_err333,'-x', 'DisplayName',s3)
% 
% % legend('CG with preconditioner','LU decomposition')
% title('Comparison error between CG and CG with difference preconditioners, n = 10')
%%-----------------------------------------------------------------------%%
%% Exersice 3:
% x0 = [2;3];
% x0 = rand(50,1);
% Tol = 1e-6;
% itmax = 1000;
% neq = 4;            % number of equation
% [x1,v1,it1,err1,vec_err1,time1] = SDM(@func,x0,Tol,itmax,neq);
% [x2,v2,it2,err2,vec_err2,time2] = FRM(@func,x0,Tol,itmax,neq);
% y1 = 0:it1;
% y2 = 0:it2;
% hold on
% plot(y1,vec_err1,'r')
% plot(y2,vec_err2,'b')
% hold off

% Tol = 1e-6;
% itmax = 100;
% % neq = 1;            % number of equation
% [x1,v1,it1,err1,vec_err1,time1] = Newton0(@func,[2;3],Tol,itmax,2);
% [x2,v2,it2,err2,vec_err2,time2] = Newton0(@func,[2;3],Tol,itmax,3);
% [x3,v3,it3,err3,vec_err3,time3] = Newton0(@func,rand(50,1),Tol,itmax,4);


Tol = 1e-6;
itmax = 1000;
n = 50;
type = 6;
x0 = rand(n,1);
% neq = 1;            % number of equation
tic
[x1,v1,it1,err1,vec_err1,time1] = SR1(@func,x0,Tol,itmax,type);
toc
semilogy(vec_err1,'-*')
tic
[x2,v2,it2,err2,vec_err2,time2] = DFP(@func,x0,Tol,itmax,type);
toc
hold on
semilogy(vec_err2,'-*')
tic
[x3,v3,it3,err3,vec_err3,time3] = BFGS(@func,x0,Tol,itmax,type);
toc
semilogy(vec_err3,'-*')
legend('SR1','DFP','BFGS')

% [x2,v2,it2,err2,vec_err2,time2] = BFGS(@func,[2;3],Tol,itmax,3);
% [x3,v3,it3,err3,vec_err3,time3] = BFGS(@func,rand(50,1),Tol,itmax,4);


