function GeneradorPlanoDinf3(fmet)
%Dibuja el plano dinámico de la función f_3(x) aplicando el método definido
%en la función fmet.
%Ejemplo de ejecución en consola:
%GeneradorPlanoDinf3('MAmet')
li=-3;ls=3;%Definimos los límites para los intervalos
N=500; maxiter=80; tol=1e-6;
x=linspace(li,ls,N); y=x;
[X,Y]=meshgrid(x,y);
z=X+1i*Y;

%Se define la función y su derivada de manera simbólica
fun=@(z)(log(2*z) + sin(z));
dfun=@(z)(1/z+cos(z));

%Raíces de f_3(x)
raices=[0.3536436663642881032587333366551,-2.5352605640857055530755738294391+...
    1.8372370842401005301111045551469*1i,-2.5352605640857055530755738294391-...
    1.8372370842401005301111045551469*1i];

for j=1:N
    for k=1:N
        z0=z(j,k);
        z0=feval(fmet,fun,dfun,z0); iter=1; dif=tol+1;
        while and(iter<maxiter,dif>tol)
            z0=feval(fmet,fun,dfun,z0);
            dif1=abs(z0-raices(1)); dif2=abs(z0-raices(2));
            dif3=abs(z0-raices(3));
            dif=min([dif1,dif2,dif3]);
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
Z3=abs(y-raices(3))<tol;

I(:,:,1)=cIT.*(237/255*Z1+3/255*Z3+100/255*Z2);
I(:,:,2)=cIT.*(85/255*Z1+102/255*Z2+200/255*Z3);
I(:,:,3)=cIT.*(70/225*Z1+205/255*Z2+79/255*Z3);

figure, imshow(double(I),'XData',[li ls],'YData',[li ls]), axis on, axis xy
hold on
plot(real(raices),imag(raices),'w*'), xlabel('Real(z)'),...
    ylabel('Imag(z)'), grid
end