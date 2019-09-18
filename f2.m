function [fun, dfun] = f2(x)
fun=cos(x)-x^2-x;
dfun=-sin(x)-2*x-1;
end