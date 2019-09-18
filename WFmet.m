function val=WFmet(fun,dfun,z)
%Método WF4O
f=feval(fun,z);
fp=feval(dfun,z);
y=z-2/3*f/fp;
fpy=feval(dfun,y);
t=fpy/fp;
val= z- (3/2*t^2 - 7/2*t + 4)*f/(fp + fpy);
end