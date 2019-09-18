function [F, dF] = FS2(v)
x=v(1);
y=v(2);
z=v(3);
F=[x^3*exp(x)-3*z*cos(x)-y*z-10;log(x^4)-sqrt(3*x)+z;cos(x*y*z)+9*x^2*y-5];
dF=[3*x^2*exp(x)+x^3*exp(x)+3*z*sin(x),z,3*cos(x)-y;...
    4/x-3/2*(3*x)^(-0.5),0,1;...
    -sin(x*y*z)*y*z+18*x*y,-sin(x*y*z)*x*z+9*x^2,-sin(x*y*z)*x*y];
end

