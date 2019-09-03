function PlanoDinMGf14orden
%Dibuja el plano dinámico del método (MG4O) para la función f_1(x)

li=-3;ls=3;%Definimos los límites para los intervalos
N=500; maxiter=80; tol=1e-6;
x=linspace(li,ls,N); y=x;
[X,Y]=meshgrid(x,y);
z=X+1i*Y;

%Raíces del polinomio
raices=roots([1 4 0 -10]);

%Operador de punto fijo
R=@(z)(1000000*sqrt(3) + 6400000*sqrt(3)*z + 15440000*sqrt(3)*z^2 + 12564000*sqrt(3)*z^3 - ...
   12691200*sqrt(3)*z^4 - 32920000*sqrt(3)*z^5 + 5374920*sqrt(3)*z^6 - ...
   156980*sqrt(3)*z^14 - 7849*sqrt(3)*z^15 - ...
   32*z^10*(608861*sqrt(3) - 77760*sqrt((400 + 1280*z + 1120*z^2 + 1304*z^3 + 1088*z^4 + ...
         392*z^5 + 49*z^6)/(8*z + 3*z^2))) - ...
   16*z^12*(387112*sqrt(3) - 6561*sqrt((400 + 1280*z + 1120*z^2 + 1304*z^3 + 1088*z^4 + ...
         392*z^5 + 49*z^6)/(8*z + 3*z^2))) - ...
   320*z^11*(50408*sqrt(3) - 2187*sqrt((400 + 1280*z + 1120*z^2 + 1304*z^3 + 1088*z^4 + ...
         392*z^5 + 49*z^6)/(8*z + 3*z^2))) + ...
   z^13*(-1336992*sqrt(3) + 6561*sqrt((400 + 1280*z + 1120*z^2 + 1304*z^3 + 1088*z^4 + ...
         392*z^5 + 49*z^6)/(8*z + 3*z^2))) + ...
   256*z^7*(245705*sqrt(3) + 9216*sqrt((400 + 1280*z + 1120*z^2 + 1304*z^3 + 1088*z^4 + ...
         392*z^5 + 49*z^6)/(8*z + 3*z^2))) + ...
   256*z^8*(223429*sqrt(3) + 20736*sqrt((400 + 1280*z + 1120*z^2 + 1304*z^3 + 1088*z^4 + ...
         392*z^5 + 49*z^6)/(8*z + 3*z^2))) + ...
   64*z^9*(124739*sqrt(3) + 77760*sqrt((400 + 1280*z + 1120*z^2 + 1304*z^3 + 1088*z^4 + ...
         392*z^5 + 49*z^6)/(8*z + 3*z^2))))/(9*z^6*(8 + 3*z)^6*...
   sqrt((400 + 1280*z + 1120*z^2 + 1304*z^3 + 1088*z^4 + 392*z^5 + 49*z^6)/(8*z + 3*z^2)));
  
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

