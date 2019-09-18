function [fun, dfun] = f5(x)
fun=sin(x)+cos(x)-tan(2*x);
dfun=cos(x)-sin(x)-2/(cos(2*x))^2;
end