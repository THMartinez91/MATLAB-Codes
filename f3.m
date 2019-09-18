function [fun, dfun] = f3(x)
fun=log(2*x)+sin(x);
dfun=1/x+cos(x);
end