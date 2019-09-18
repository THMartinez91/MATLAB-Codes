function [F, dF] = FS4(v)
x=v(1);
y=v(2);
F=[sin(x)*cos(x*y)+x+3;log(x+y)-2*y+7];
dF=[cos(x)*cos(x*y)-sin(x)*sin(x*y)*y+1,-sin(x*y)*x*sin(x);...
    1/(x+y),1/(x+y)-2];
end

