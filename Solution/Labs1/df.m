function r = df(x,type)
if (nargin == 1)
    type = 1;
end
switch type
    case 1
        r = 3*x.^2 - 2;
    case 2
        r = 2*x - pi/2 + cos(x.^2).*cos(x) - 2*x.*sin(x.^2).*sin(x);
    otherwise
        r = 0;
end