function val=MHmet(fun,dfun,z)
%Método MH4O
f=feval(fun,z);
fp=feval(dfun,z);
y=z-2/3*f/fp;
fpy=feval(dfun,y);
t=fpy/fp;
val=z - ((17/8)*t^2 - 5*t + 47/8)*(f/(fp + fpy + sqrt(fp*fpy)));
end