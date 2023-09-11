clc
close all
clear all
%% %%===================================================%% %%
% n = [10,100];
n = 5:5:100; 
it = zeros(length(n),1);
err = zeros(length(n),1);
time = zeros(length(n),1);

for ii = 1:length(n)
    delta_x = 1/(n(ii)+1);
    
    b = ones(n(ii),1); w = ones(n(ii)-1,1);
    A = 2*diag(b) - diag(w,1) - diag(w,-1);
    A = (1/delta_x^2)*A;
    
    x = (delta_x:delta_x:1-delta_x)';
    g = max(0,1 - 100*(x - 0.8).^2) + max(0,1 - 100*(x - 0.2).^2);
    h = min(1,100*(x - 0.5).^2);
    
    %% Projected gradient methods
    
%     lambda_1 = min(eig(A));
%     lambda_n = max(eig(A));
%     rho = 2/(lambda_1 + lambda_n);
%     Tol = 10^-4;
%     itmax = 10000;
%     tic
%     [u,v,it(ii),err(ii),vec_err,time(ii)] = PGM(A,b,g,h,x,rho,Tol,itmax);
%     toc
%     figure
%     plot(x,g,'r','LineWidth',2)
%     hold on
%     plot(x,u,'b','LineWidth',2)
%     plot(x,h,'r','LineWidth',2)
%     title(['n = ', num2str(n(ii))])
%     legend('obstacle','rope')
    
    %% Uzawa's method
    
    lambda_1 = min(eig(A));
    rho = lambda_1;
    Tol = 10^-4;
    itmax = 10000;
    lambda0 = zeros(n(ii),1);
    nu0 = zeros(n(ii),1);
    tic
    [u,v,lambda,it(ii),err(ii),vec_err,time(ii)] = Uzawa(A,b,g,h,x,lambda0,nu0,rho,Tol,itmax);
    toc
    figure
    plot(x,g,'r')
    hold on
    plot(x,u,'b')
    plot(x,h,'r')
    legend('obstacle','rope')
end
table(n',it,err,time)