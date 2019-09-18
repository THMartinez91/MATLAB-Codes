function [F, dF] = FS3(v)
x=v(1);
y=v(2);
F=[x^2+y^2-2*x+3*y-7;x^2-y^2-4*x-2*y-1];
dF=[2*x-2, 2*y+3;...
    2*x-4,-2*y-2];
end

