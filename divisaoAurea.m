function [ xMin, yMin, xInicial, xFinal, Iteracoes] = divisaoAurea( fun, xInicial, xFinal, epsilon, num_iteracao, CritParada )

    FIM=0;
    Iteracoes=0;
    y=fun;
    
%     xa=xInicial;
%     xb=xFinal;
%     ya=y(xa);
%     yb=y(xb);
    
    if strcmp(CritParada,'Iterações')==1
        while (num_iteracao~=Iteracoes)
            x1=xInicial; x4=xFinal; Li=xFinal-xInicial; u=(sqrt(5)-1)/2;
        x2=u*x1+(1-u)*x4;
        x3=u*x4+(1-u)*x1;

        f2=y(x2);
        f3=y(x3);

        if (f2<f3)
            xInicial=x1; xFinal=x3; Lf=xFinal-xInicial;
        end
    
        if (f2>=f3)
            xInicial=x2; xFinal=x4; Lf=xFinal-xInicial;
        end
        Iteracoes=Iteracoes+1;
        end
                xMin=(xFinal+xInicial)/2;
                yMin=(f2+f3)/2;
                Iteracoes;
        
    else
   
    while (FIM~=1)

        x1=xInicial; x4=xFinal; Li=xFinal-xInicial; u=(sqrt(5)-1)/2;
        x2=u*x1+(1-u)*x4;
        x3=u*x4+(1-u)*x1;

        f2=y(x2);
        f3=y(x3);

        if (f2<f3)
            xInicial=x1; xFinal=x3; Lf=xFinal-xInicial;
            if (Lf<epsilon)
                FIM=1;
                xMin=(xFinal+xInicial)/2;
                yMin=(f2+f3)/2;
                Iteracoes;
            end
        end
    
        if (f2>=f3)
            xInicial=x2; xFinal=x4; Lf=xFinal-xInicial;
            if (Lf<epsilon)
                FIM=1;
                xMin=(xFinal+xInicial)/2;
                yMin=(f2+f3)/2;
                Iteracoes;
            end
        end
        Iteracoes=Iteracoes+1;
    end
    
    end
    
%     xMin=(xFinal+xInicial)/2;
%     yMin=(f2+f3)/2;
%     plot([xMin,yMin],[0,0],'+');

%      Esses plots eu que criei
%      plot([x2,x3],[f2,f3],'-d');  %Na main já faz de x1 e x4, melhor nao
%      hold on
%      plot([xa,xb],[ya,yb],'o');  %Esse já tem na main

    Iteracoes
    
end

