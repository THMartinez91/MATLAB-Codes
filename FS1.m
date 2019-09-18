function [F, dF] = FS1(v)
x=v(1);
y=v(2);
F=[x^5*y-sin(x)-2*x*y+3;tan(x*y^3)-2*exp(3*x^5)+x];
dF=[5*x^4*y-cos(x)-2*y, x^5-2*x;...
    sec(x*y^3)^2*y^3-30*exp(3*x^5)*x^4+1,3*y^2*sec(x*y^3)^2];
end

