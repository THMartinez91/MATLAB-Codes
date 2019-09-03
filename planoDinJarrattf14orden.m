function planoDinJarrattf14orden
%Dibuja el plano dinámico del método de JARRATT para la función f_1(x)

li=-3;ls=3;%Definimos los límites para los intervalos
N=500; maxiter=80; tol=1e-6;
x=linspace(li,ls,N); y=x;
[X,Y]=meshgrid(x,y);
z=X+1i*Y;

%Raíces del polinomio
raices=roots([1 4 0 -10]);

%Operador de punto fijo
R=@(z)((2000 + 6400*z + 14400*z^2 + 45760*z^3 + 49600*z^4 + 28048*z^5 +...
    13014*z^6 + 5344*z^7 + 1332*z^8 + 133*z^9)/(6*z*(8 + 3*z)*(200 +....
    640*z + 560*z^2 + 396*z^3 + 256*z^4 + 88*z^5 + 11*z^6)));
for j=1:N
    for k=1:N
        z0=z(j,k);
        z0=R(z0); iter=1; dif=tol+1;
        while and(iter<maxiter,dif>tol)
            z0=R(z0);
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

