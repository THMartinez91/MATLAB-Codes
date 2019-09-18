function [F, dF] = FS5(v)
x=v(1);
y=v(2);
F=[sqrt(x*y^3)+2*x*y-4;3*x^7-2*y*x+y];
dF=[1/2*(x*y^3)^(-0.5)*y^3+2*y,1/2*sqrt(x*y^3)^(-0.5)*3*y^2+2*x;...
    21*x^6-2*y,-2*x+1];
end

