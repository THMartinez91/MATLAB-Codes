function [fun, dfun] = f4(x)
fun=sqrt(x^3)-2*x^2+exp(x)-5;
dfun=3/2*x^0.5-4*x+exp(x);
end