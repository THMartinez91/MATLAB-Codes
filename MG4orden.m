function [sol,incre,increfx,iter,ACOC,x] = MG4orden(f,x0,tol,maxiter)
% Método de orden 4 con media geométrica para aproximar una solución de f(x)=0 % Sintaxis:
%Ejemplo de ejecución en consola:
%[sol,incre,increfx,iter,ACOC,x] = MG4orden('f',0.5,1e-40,500)

x0=vpa(x0);%Obliga a trabajar en aritmética de precisión variable
iter=0;
incre =tol+1;
increfx =tol+1;
x = x0;
I=[];
while incre+increfx > tol && iter < maxiter
    [fun,dfun]=feval(f,x0);
    y=x0-2/3*fun/dfun;
    [~,dfuny]=feval(f,y);
    t=dfuny/dfun;
    x1=x0-(5/8*t^2-3/2*t+15/8)*fun/sqrt(dfun*dfuny);
    incre = norm(x1-x0);
    increfx=norm(feval(f,x1));
    x=[x,x1];
    I=[I,incre];
    iter = iter + 1; % Contador de iteraciones
    x0=x1;
end
ACOC=log(I(3:end)./I(2:end-1))./log(I(2:end-1)./I(1:end-2));
if incre+increfx>tol
    disp('Necesito más iteraciones')
end
incre=vpa(incre);
increfx=vpa(increfx);
sol = x1;
end

%Ejemplo de función
function [fun,dfun]=f(x)
fun=(x-1)^6-1;%Poner la función
dfun=6*(x-1)^5;%Poner la derivada de la función respecto a la variable 
                %independiente.
end
