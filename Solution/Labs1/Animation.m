% Lab1 : Optimization & equations in 1D

clc
close all
clear all

%===========================%
%--- 1: Bisection Method ---%
% Input value
a = 1;              % ensure that f(a)*f(b) < 0
b = 3;
Tol = 10^(-6);      % Tol is some fixed tolerance or precision
itmax = 100;        % itmax is the maximum nuber of iterations
it = 0;
nf = 0;
type = 2; 
figh = figure;
% Draw a function
y = a:0.05:b;
hold on
plot(y,func(y,type),'r')
plot(y,zeros(size(y,2)),'k')

u = [a,b];
v = [func(a,type),func(b,type)];
scatter(u,v,'*g')
% line(u,v)
axis auto
%axis([ a b f(a,type) f(b,type) ])

j = 1;
while (it < itmax)
    
    x = (a+b)/2;
    v = func(x,type);
    nf = nf + 1;
    if (abs(v) < Tol || abs((b-a)/2) < Tol)
        break;
    end
    it = it + 1;
    if (v*f(a,type) > 0)
        a = x;
        u = [a,x];
        v = [func(a,type),func(x,type)];
    else
        b = x;
        u = [x,b];
        v = [func(x,type),func(b,type)];
    end
    nf = nf+1;
    scatter(u,v,'*g')
    pause(1^(-70))
    
    title(['Iteration = ', num2str(it),' value x =  ',num2str(x)])
    
    movieVector(j) = getframe(figh, [10 10 520 400]);
    j = j + 1;
end
title(['Iteration = ', num2str(it),' optimal point =  ',num2str(x),' with error = ', num2str(Tol)])
myWriter = VideoWriter('Bisection');
myWriter.FrameRate = 8;
open(myWriter);
writeVideo(myWriter,movieVector);
close(myWriter);