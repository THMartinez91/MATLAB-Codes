function GeneradorPlanoDinf4(fmet)
%Dibuja el plano din�mico de la funci�n f_4(x) aplicando el m�todo definido
%en la funci�n fmet.
%Ejemplo de ejecuci�n en consola:
%GeneradorPlanoDinf4('MAmet')
li=-3;ls=3;%Definimos los l�mites para los intervalos
N=500; maxiter=80; tol=1e-6;
x=linspace(li,ls,N); y=x;
[X,Y]=meshgrid(x,y);
z=X+1i*Y;

%Se define la funci�n y su derivada de manera simb�lica
fun=@(x)(sqrt(x^3)-2*x^2+exp(x)-5);
dfun=@(x)(3/2*x^0.5-4*x+exp(x));

%Ra�ces de f_4(x)
raices=2.7389588203581988343401197404186;

for j=1:N
    for k=1:N
        z0=z(j,k);
        z0=feval(fmet,fun,dfun,z0); iter=1; dif=tol+1;
        while and(iter<maxiter,dif>tol)
            z0=feval(fmet,fun,dfun,z0);
            dif=abs(z0-raices); 
            %dif2=abs(z0-raices(2));
            %dif=min([dif1,dif2]);
            iter=iter+1;
        end
        y(j,k)=z0;
        IT(j,k)=iter;
    end
end
p=polyfit([min(IT(:)) max(IT(:))],[1 .25],1);
cIT=polyval(p,IT);

Z1=abs(y-raices)<tol;
%Z2=abs(y-raices(2))<tol;

I(:,:,1)=cIT.*(242/255*Z1);%+4/255*Z2);
I(:,:,2)=cIT.*(85/255*Z1);%+175/255*Z2);
I(:,:,3)=cIT.*(150/225*Z1);%+230/255*Z2);

figure, imshow(double(I),'XData',[li ls],'YData',[li ls]), axis on, axis xy
hold on
plot(real(raices),imag(raices),'w*'), xlabel('Real(z)'),...
    ylabel('Imag(z)'), grid
end