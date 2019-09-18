function val=MAmet(fun,dfun,z)
%Método MA4O
f=feval(fun,z);
fp=feval(dfun,z);
y=z-2/3*f/fp;
fpy=feval(dfun,y);
t=fpy/fp;
val= z - ((1/4)*t^2 - (5/8)*t + 7/8)*f*(1/fp + 1/fpy);
end