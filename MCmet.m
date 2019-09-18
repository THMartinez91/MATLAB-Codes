function val=MCmet(fun,dfun,z)
%Método MC4O
f=feval(fun,z);
fp=feval(dfun,z);
y=z-2/3*f/fp;
fpy=feval(dfun,y);
t=fpy/fp;
val=z - ((7/8)*t^2 - (5/2)*t + 21/8)*(f/sqrt((1/2)*(fp^2 + fpy^2)));
end