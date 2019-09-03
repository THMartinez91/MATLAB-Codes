function [sol,incre,increfx,iter,ACOC,x] = WF4orden_Sistemas(f,x0,tol,maxiter)
% Generalización del método de Weerakoon y Fernando, extendido para sistemas
% Ejemplo de ejecución en consola:
%[sol,incre,increfx,iter,ACOC,x] = WF4orden_Sistemas('f',[2;3],1e-50,2000)

x0=vpa(x0);%Obliga a trabajar en aritmética de precisión variable.
iter=0;
incre =tol+1;
increfx =tol+1;
x = x0;
I=[];

while incre+increfx > tol && iter < maxiter
   [F,dF]=feval(f,x0);
    v=dF\F;%Resuelve el sistema dFx*v=Fx, ie, calcula Fx^{-1}Fx
    y=x0-2/3*v;
    [~,dFy]=feval(f,y);
    t=dF\dFy;
    w=(dF+dFy)\F;
    tam=size(dF);
    x1=x0-2*(3/4*t^2-7/4*t+2*eye(tam(1)))*w;
    incre = norm(x1-x0);
    [funx1,~]=feval(f,x1);
    increfx=norm(funx1);
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

%Función de ejemplo
function [fun,dfun]=f(x)
%Poner la función
fun=[exp(x(1))*exp(x(2))+x(1)*sin(x(2));...
    x(1)-x(2)-1];
%Poner la derivada de la función respecto a x, la fila corresponde a 
%ecuaciones y las columnas respecto a qué variable
dfun=[exp(x(1))*exp(x(2))+sin(x(2)),exp(x(1))*exp(x(2))+x(1)*cos(x(2));...
    1,-1];
end

