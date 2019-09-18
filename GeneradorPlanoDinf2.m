function GeneradorPlanoDinf2(fmet)
%Dibuja el plano dinámico de la función f_2(x) aplicando el método definido
%en la función fmet.
%Ejemplo de ejecución en consola:
%GeneradorPlanoDinf2('MAmet')
li=-3;ls=3;%Definimos los límites para los intervalos
N=500; maxiter=80; tol=1e-6;
x=linspace(li,ls,N); y=x;
[X,Y]=meshgrid(x,y);
z=X+1i*Y;

%Se define la función y su derivada de manera simbólica
fun=@(z)(cos(z) - z^2 - z);
dfun=@(z)(-sin(z)-2*z-1);

%Raíces de f_2(x)
raices=[-1.2511518352207648115928700687882, 0.55000934992726156666495361947173];

for j=1:N
    for k=1:N
        z0=z(j,k);
        z0=feval(fmet,fun,dfun,z0); iter=1; dif=tol+1;
        while and(iter<maxiter,dif>tol)
            z0=feval(fmet,fun,dfun,z0);
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