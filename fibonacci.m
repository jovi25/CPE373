function [x_min, y_min, int, a, b] = fibonacci (CritParada,f,a,b,tol,n)

% f: função a ser minimizada
% a: início do intervalo
% b: final do intervalo
% sigma: tolerância
% n: número de reduções


% Índice de Fibonacci final pela fórmula de Binet
k_max = 100;   % Número máximo de iterações
L_in = b - a; % Intervalo inicial

% Índice de Fibonacci final a partir de n
if (strcmp(CritParada,'Iterações')==1)
    ni = n;
    ki = n+1;

else
    for i=1:k_max
        fk = @(k)(sqrt(5)/5)*((((1+sqrt(5))/2)^(k+1))-(((1-sqrt(5))/2)^(k+1)));
        fki = fk(i);
        if fki >= (L_in/tol)
            break;
        end
    end

    ki = i;
    ni = ki-1;
end

% Coeficiente de redução inicial
p = (1-sqrt(5))/(1+sqrt(5));
alpha = (2/(1+sqrt(5)))*((1-p.^ki)/(1-p.^(ki+1)));

 
% Executa até atingir número de reduções necessárias
num_it = 1;
while num_it <= ni

    L_in = b-a;
    x1 = a;
    x4 = b;
    
    
    %Verifica se redução coincide e calcula a redução do intervalo
    if alpha == 0.5 
        x2 = x2 *0.9;
        x3 = x3 *1.1;
    else
        x2 = alpha*x1 + (1-alpha)*x4;
        x3 = alpha*x4 + (1-alpha)*x1;
    end
    
    % Valor da função nos pontos x2 e x3
    y2 = f(x2);
    y3 = f(x3);
    
    % Definição dos novos intervlaos
    if y2 < y3
        a = x1;
        b = x3;
        plot(x2,y2,'b-s')
    else
        a = x2;
        b = x4;
        plot(x2,y2,'b-s')
    end
    
%     plot([a,b],[0,0],'-d');

    % Atualiza alpha
    L = b - a;
    alpha = (L_in-L)/L;
    int = num_it; 
    num_it = num_it+1;
    
end

% Mínimo encontrado
c = a+(b-a)/2; % ponto médio
x_min = c;
y_min = f(c);

end