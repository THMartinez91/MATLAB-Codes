function PlanoDinJarrattf24orden
%Dibuja el plano dinámico del método de JARRATT para la función f_2(x)

li=-3;ls=3;%Definimos los límites para los intervalos
N=500; maxiter=80; tol=1e-6;
x=linspace(li,ls,N); y=x;
[X,Y]=meshgrid(x,y);
z=X+1i*Y;

%Raíces de f_2(x)
raices=[-1.2511518352207648115928700687882, 0.55000934992726156666495361947173];

%Operador de punto fijo
R=@(z)((4*cos(z)^2 + cos(z)*(6 + 40*z + 64*z^2 + 3*sin(z)^2 +...
    (3 + 6*z)*sin((z + 4*z^2 + 2*cos(z) + 3*z*sin(z))/(3 + 6*z +...
    3*sin(z))) + ...
     3*sin(z)*(3 + 14*z + sin((z + 4*z^2 + 2*cos(z) + 3*z*sin(z))/(3 + ...
         6*z + 3*sin(z))))) + ...
   z*(6 + 22*z + 32*z^2 + 28*z^3 - 6*sin(z)^3 - 3*sin(z)^2*(1 + z - ...
       6*sin((z + 4*z^2 + 2*cos(z) + 3*z*sin(z))/(3 + 6*z +...
       3*sin(z)))) + ...
     3*(5 + 21*z + 22*z^2)*sin((z + 4*z^2 + 2*cos(z) + 3*z*sin(z))/(3 +...
         6*z + 3*sin(z))) + ...
     3*sin(z)*(3 + 7*z + 10*z^2 + (11 + 23*z)*sin((z + 4*z^2 + 2*cos(z) +...
         3*z*sin(z))/(3 + 6*z + 3*sin(z))))))/...
  (6*(1 + 2*z + sin(z))*(2 + 4*z + 4*z^2 + 4*cos(z) - sin(z)^2 + ...
  3*sin((z + 4*z^2 + 2*cos(z) + 3*z*sin(z))/(3 + 6*z + 3*sin(z))) + ...
    6*z*sin((z + 4*z^2 + 2*cos(z) + 3*z*sin(z))/(3 + 6*z + 3*sin(z))) +...
        sin(z)*(1 + 2*z + 3*sin((z + 4*z^2 + 2*cos(z) + 3*z*sin(z))/(3 + ...
        6*z + 3*sin(z)))))));
for j=1:N
    for k=1:N
        z0=z(j,k);
        z0=R(z0); iter=1; dif=tol+1;
        while and(iter<maxiter,dif>tol)
            z0=R(z0);
            dif1=abs(z0-raices(1)); 
            dif2=abs(z0-raices(2));
            dif=min([dif1,dif2]);
            iter=iter+1;
        end
        y(j,k)=z0;
        IT(j,k)=iter;
    end
end

p=polyfit([min(IT(:)) max(IT(:))],[1 .25],1);
cIT=polyval(p,IT);
Z1=abs(y-raices(1))<tol;
Z2=abs(y-raices(2))<tol;

I(:,:,1)=cIT.*(242/255*Z1+4/255*Z2);
I(:,:,2)=cIT.*(85/255*Z1+175/255*Z2);
I(:,:,3)=cIT.*(150/225*Z1+230/255*Z2);

figure, imshow(double(I),'XData',[li ls],'YData',[li ls]), axis on, axis xy
hold on

plot(real(raices),imag(raices),'w*'), xlabel('Real(z)'),...
    ylabel('Imag(z)'), grid
end

