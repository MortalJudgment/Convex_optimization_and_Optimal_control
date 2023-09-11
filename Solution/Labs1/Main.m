% Lab1 : Optimization & equations in 1D

clc
close all
clear all

%===========================%
% Input value
a = -100;              % ensure that f(a)*f(b) < 0
b = 5;
Tol = 10^(-8);      % Tol is some fixed tolerance or precision
itmax = 100;        % itmax is the maximum nuber of iterations

%--- 1: Bisection Method ---%

% [x,v,it,nf] = BM(@func,a,b,Tol,itmax)

%----- 2: Newton Method -----%

% x0 = 1;
% [x,v,it,nf] = Newton(@func,x0,Tol,itmax)

%----- 3: Golden Section Method -----%
% [x,v,it,nf] = GSM(@func,a,b,Tol)

%----- 4: Line Search Methods -----%
% [x,v,it,nf] = GSM(a,b,Tol,itmax)
