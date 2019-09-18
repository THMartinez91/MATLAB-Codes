function val=MGmet(fun,dfun,z)
%Método MG4O
f=feval(fun,z);
fp=feval(dfun,z);
y=z-2/3*f/fp;
fpy=feval(dfun,y);
t=fpy/fp;
val=z - ((5/8)*t^2 - (3/2)*t + 15/8)*(f/sqrt(fp*fpy));
end