function PlanoDinWFf14orden
%Dibuja el plano dinámico del método (WF4O) para la función f_1(x)

li=-3;ls=3;%Definimos los límites para los intervalos
N=500; maxiter=80; tol=1e-6;
x=linspace(li,ls,N); y=x;
[X,Y]=meshgrid(x,y);
z=X+1i*Y;

%Raíces del polinomio
raices=roots([1 4 0 -10]);

%Operador de punto fijo
R=@(z)(2*(200000 + 1280000*z + 3088000*z^2 + 2564000*z^3 - 2316800*z^4 - ...
     5845600*z^5 + ...
         2323380*z^6 + 14061120*z^7 + 15669872*z^8 + 9972792*z^9 + ...
     4856272*z^10 + 2076632*z^11 + ...
         715910*z^12 + 167568*z^13 + 22550*z^14 + 1303*z^15))/...
   (z^4*(8 + 3*z)^4*(200 + 640*z + 560*z^2 + 1420*z^3 + 1408*z^4 + ...
     520*z^5 + 65*z^6));
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

