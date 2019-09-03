function [sol,incre,increfx,iter,ACOC,x] = MA4orden_Sistemas(f,x0,tol,maxiter)
% Método con media harmónica de orden 4 para sistemas de ecuaciones% 
% Ejemplo de ejecución en consola:
%[sol,incre,increfx,iter,ACOC,x] = MA4orden_Sistemas('f',[2;3],1e-50,2000)

x0=vpa(x0);%Obliga a trabajar en aritmética de precisión variable.
iter=0;
incre =tol+1;
increfx =tol+1;
x = x0;
I=[];
while incre+increfx > tol && iter < maxiter
    [Fx,dFx]=feval(f,x0);
    v=dFx\Fx;%Resuelve el sistema dFx*v=Fx, ie, calcula Fx^{-1}Fx
    y=x0-2/3*v;
    [~,dFy]=feval(f,y);
    t=dFx\dFy;
    w1=dFx\Fx;
    w2=dFy\Fx;
    w3=w1+w2;
    tam=size(t);
    x1=x0-2*(1/2*t^2-5/4*t+7/4*eye(tam(1)))\w3;
    incre = norm(x1-x0);
    [funx1,~]=feval(f,x1);
    increfx=norm(funx1);
    x=[x,x1];
    I=[I,incre];
    iter = iter + 1; % Contador de iteraciones
    x0=x1;
end
ACOC=log(I(3:end)./I(2:end-1))./log(I(2:end-1)./I(1:end-2));
if incre>tol
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
