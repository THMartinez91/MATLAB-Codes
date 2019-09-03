function PlanoDinMAf14orden
%Dibuja el plano dinámico del método (MA4O) para la función f_1(x)

li=-3;ls=3;%Definimos los límites para los intervalos
N=500; maxiter=80; tol=1e-6;
x=linspace(li,ls,N); y=x;
[X,Y]=meshgrid(x,y);
z=X+1i*Y;

%Raíces del polinomio
raices=roots([1 4 0 -10]);

%Operador de punto fijo
R=@(z)(2*(80000000 + 768000000*z + 3097600000*z^2 + 6928640000*z^3 + ...
     9626880000*z^4 + ...
         8805728000*z^5 + 5533612000*z^6 + 3053145600*z^7 + ...
     6297851200*z^8 + 41146697840*z^9 + ...
         111549129600*z^10 + 161169692096*z^11 + 147972317148*z^12 + ...
     96522002304*z^13 + ...
         48996569024*z^14 + 20712592728*z^15 + 7390092240*z^16 + ...
     2122414112*z^17 + ...
         454437838*z^18 + 66396480*z^19 + 5833450*z^20 + 231301*z^21))/...
   (9*z^7*(8 + 3*z)^7*(400 + 1280*z + 1120*z^2 + 1304*z^3 + ...
     1088*z^4 + 392*z^5 + 49*z^6));
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

