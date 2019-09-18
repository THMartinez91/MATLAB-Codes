function val=Jarrattmet(fun,dfun,z)
%Método de Jarratt
f=feval(fun,z);
fp=feval(dfun,z);
y=z-2/3*f/fp;
fpy=feval(dfun,y);
val=z - (1/2)*((fpy + fp)/(3*fpy - fp))*(f/fp);
end