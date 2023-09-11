function [v,g,H] = func(x,type)
% where v is a function of x
% g is Gradient of v r.p.t x
% H is Hessian metric of v r.p.t x
if nargin < 2
    type = 1;
end
if type == 1
    v = x(1).^2 + 6*x(1)*x(2)+25*x(2)^2 - 12*x(1) - 2*x(2) - 6;
    g = [2*x(1)+6*x(2)-12;...
        6*x(1)+50*x(2)-2];
    H = [ 2,6;...
        6,50];
elseif type == 2                                    % Rosenbrock
    v = 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;
    g = [2*x(1) - 400*x(1)*(-x(1)^2 + x(2)) - 2;...
        -200*x(1)^2 + 200*x(2)];
    H = [ 1200*x(1)^2 - 400*x(2) + 2, -400*x(1);...
        -400*x(1), 200];
elseif type == 3                                    % Himmelblau
    v = (x(2) + x(1)^2 - 11)^2 + (x(1) + x(2)^2 - 7)^2;
    g = [2*x(1) + 4*x(1)*(x(1)^2 + x(2) - 11) + 2*x(2)^2 - 14;...
        2*x(2) + 4*x(2)*(x(2)^2 + x(1) - 7) + 2*x(1)^2 - 22];
    H = [ 12*x(1)^2 + 4*x(2) - 42, 4*x(1) + 4*x(2);...
        4*x(1) + 4*x(2) ,    12*x(2)^2 + 4*x(1) - 26];
elseif type == 4                                    % DENNI
    n = size(x,1);
    a = (1:n)';
    v = sum(a.*x.^2) + (sum(x))^2;
    g = 2*a.*x + 2*sum(x);
    H = 2*ones(n,n) + 2*diag(a);
elseif type == 5                                     % VAR
    n = size(x,1);
    a = (1:n)';
    k = sqrt(a);
    v = sum(x.^2) + (sum(k.*x))^2 + (sum(k.*x))^4;
    g = 2*x + 2*k.*sum(k.*x) + 4*k.*(sum(k.*x))^3;
elseif type == 6
    n = length(x);
    
    v = 100*sum((x(1) - x(2:n).^2).^2) + sum((1-x).^2);
    
    g = 100*(-4)*x.*(x(1)-x.^2)-2*(1-x) ;
    g(1) = 200*(sum(x(1)-x(2:end).^2))-2*(1-x(1));
    
    h1 = -400*x(2:n);
    vii = -400*x(1)  + 1200*x(2:n).^2 + 2;
    hij = diag(vii);
    H = [(n-1)*200 + 2 , h1.' ; h1 , hij];
else
    disp('Not supported!!')
end
