function r = func(x,type)
if (nargin == 1)
    type = 1;
end
switch type
    case 1
        r = sqrt(abs(x-3))
%         r = x.^3 - 2.*x - 1;
    case 2
        r = sin(x).*cos(x.^2) + x.*(x-pi/2);
    otherwise
        r = 0;
end