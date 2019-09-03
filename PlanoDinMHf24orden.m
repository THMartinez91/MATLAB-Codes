function PlanoDinMHf24orden
%Dibuja el plano din�mico del m�todo (MH4O) para la funci�n f_2(x)

li=-3;ls=3;%Definimos los l�mites para los intervalos
N=500; maxiter=80; tol=1e-6;
x=linspace(li,ls,N); y=x;
[X,Y]=meshgrid(x,y);
z=X+1i*Y;

%Ra�ces de f_2(x)
raices=[-1.2511518352207648115928700687882, 0.55000934992726156666495361947173];

%Operador de punto fijo
R=@(z)(72*z + 672*z^2 + 2528*z^3 + 4056*z^4 + 2448*z^5 + 176*z^6 - 272*cos(z)^3 - 72*z*sin(z)^5 -... 
   7740*z^2*sin(2*z)- 5352*z^3*sin(2*z)+ 120*sin(2*z)^2 - ...
   126*z*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))- ...
   1362*z^2*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))- ...
   4332*z^3*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))- ...
   5424*z^4*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))- ...
   2400*z^5*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
   153*z*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))^2 + ...
   765*z^2*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))^2 + ...
   1224*z^3*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))^2 + ...
   612*z^4*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))^2 + ...
   24*cos(z)^2*(3 + 46*z + 46*z^2 + sin(z)*(23 + 46*z - ...
       17*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))) - ...
     17*(1 + 2*z)*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))) + ...
   24*sqrt(3)*z*sqrt(3 + 8*z + 8*z^2 + 4*cos(z)+ ...
      3*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
      6*z*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
      3*sin(z)*(1 + 2*z + sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))))+ ...
   192*sqrt(3)*z^2*sqrt(3 + 8*z + 8*z^2 + 4*cos(z)+ ...
      3*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
      6*z*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
      3*sin(z)*(1 + 2*z + sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))))+ ...
   576*sqrt(3)*z^3*sqrt(3 + 8*z + 8*z^2 + 4*cos(z)+ ...
      3*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
      6*z*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
      3*sin(z)*(1 + 2*z + sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))))+ ...
   768*sqrt(3)*z^4*sqrt(3 + 8*z + 8*z^2 + 4*cos(z)+ ...
      3*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
      6*z*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
      3*sin(z)*(1 + 2*z + sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))))+ ...
   384*sqrt(3)*z^5*sqrt(3 + 8*z + 8*z^2 + 4*cos(z)+ ...
      3*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
      6*z*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
      3*sin(z)*(1 + 2*z + sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))))- ...
   3*cos(z)*(8*(9 + 82*z + 304*z^2 + 452*z^3 + 234*z^4) + 141*sin(z)^4 + ...
     4*sin(z)^3*(111 + 230*z - 30*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/...
          (3 + 6*z + 3*sin(z)))) - 2*(9 + 190*z + 516*z^2 + 344*z^3)*...
      sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
     51*(1 + 2*z)^2*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))^2 + ...
     sin(z)^2*(537 + 2564*z + 2660*z^2 - 258*(1 + 2*z)*...
        sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
       51*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))^2) + ...
     sin(z)*(306 + 2300*z - 4*(39 + 224*z + 224*z^2)*...
        sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
       102*(1 + 2*z)*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))^2)) - ...
   3*z*sin(z)^4*(3 + 147*z + 24*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/...
        (3 + 6*z + 3*sin(z)))- 8*sqrt(3)*sqrt(3 + 8*z + 8*z^2 + 4*cos(z)+ ...
        3*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
        6*z*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
        3*sin(z)*(1 + 2*z + sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/...
            (3 + 6*z + 3*sin(z)))))) - 12*z*sin(z)^3*(-27 - 5*z + 106*z^2 + ...
     6*(9 + 13*z)*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))-... 
     8*sqrt(3)*sqrt(3 + 8*z + 8*z^2 + 4*cos(z)+ ...
        3*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
        6*z*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
        3*sin(z)*(1 + 2*z + sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/...
            (3 + 6*z + 3*sin(z)))))- 16*sqrt(3)*z*...
      sqrt(3 + 8*z + 8*z^2 + 4*cos(z)+ 3*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/...
           (3 + 6*z + 3*sin(z)))+ 6*z*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/...
           (3 + 6*z + 3*sin(z)))+ 3*sin(z)*(1 + 2*z + ...
          sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))))) - ...
   3*z*sin(z)^2*(-153 - 637*z - 296*z^2 + 572*z^3 + 6*(67 + 225*z + 182*z^2)*...
      sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))- ...
     51*(1 + z)*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))^2 - ...
     48*sqrt(3)*sqrt(3 + 8*z + 8*z^2 + 4*cos(z)+ ...
        3*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
        6*z*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
        3*sin(z)*(1 + 2*z + sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/...
            (3 + 6*z + 3*sin(z)))))- 192*sqrt(3)*z*...
      sqrt(3 + 8*z + 8*z^2 + 4*cos(z)+ 3*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/...
           (3 + 6*z + 3*sin(z)))+ 6*z*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/...
           (3 + 6*z + 3*sin(z)))+ 3*sin(z)*(1 + 2*z + ...
          sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))))- ...
     192*sqrt(3)*z^2*sqrt(3 + 8*z + 8*z^2 + 4*cos(z)+ ...
        3*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
        6*z*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
        3*sin(z)*(1 + 2*z + sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/...
            (3 + 6*z + 3*sin(z)))))) - ...
   6*z*sin(z)*(2*(63 + 373*z + 668*z^2 + 382*z^3)*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/...
        (3 + 6*z + 3*sin(z)))- 51*(1 + 3*z + 2*z^2)*...
      sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))^2 - ...
     (1 + 2*z)*(45 - 64*z^3 + 16*sqrt(3)*sqrt(3 + 8*z + 8*z^2 + 4*cos(z)+ ...
          3*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
          6*z*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ...
          3*sin(z)*(1 + 2*z + sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z +3*... 
                sin(z)))))+ 64*z^2*(4 + sqrt(3)*sqrt(3 + 8*z + 8*z^2 + 4*cos(z)+ ...
            3*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ... 
            6*z*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ... 
            3*sin(z)*(1 + 2*z + sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + ... 
                 3*sin(z)))))) + z*(257 + 64*sqrt(3)*sqrt(3 + 8*z + 8*z^2 + 4*cos(z)+ ... 
            3*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ... 
            6*z*sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + 3*sin(z)))+ ... 
            3*sin(z)*(1 + 2*z + sin((z + 4*z^2 + 2*cos(z)+ 3*z*sin(z))/(3 + 6*z + ... 
                 3*sin(z)))))))));
for j=1:N
    for k=1:N
        z0=z(j,k);
        z0=R(z0); iter=1; dif=tol+1;
        while and(iter<maxiter,dif>tol)
            z0=R(z0);
            dif1=abs(z0-raices(1)); dif2=abs(z0-raices(2));
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
