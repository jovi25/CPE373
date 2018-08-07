function [min, fmin, it, a, b] = main (CritParada,funt,f,a,b,tol,n,metval )

% Escolhas do usuário

% prompt = {'\fontsize{12}Limite inferior do domínio de plot:','\fontsize{12}Limite superior do domínio de plot:'};
% title = 'Domínio do Plot';
% dim = [1 70];
% definput = {'-5','5'};
% opts.Interpreter = 'tex';
% answerlimplot = inputdlg(prompt,title,dim,definput,opts);
% x = linspace(str2double(answerlimplot(1,1)),str2double(answerlimplot(2,1)));
%
% prompt = {'\fontsize{12}Insira a função a ser otimizada'};
% title = 'Function';
% definput = {'@(x)x.^2'};
% answerfun = inputdlg(prompt,title,dim,definput,opts);
% afun = char(answerfun);
% fun = str2func(afun);
% f = fun(x);
%
% % f = Ackley(x);
%
% prompt = {'\fontsize{12}Limite inferior do intervalo de busca:','\fontsize{12}Limite superior do intervalo de busca:'};
% title = 'Busca';
% definput = {'-2','2'};
% answerrange = inputdlg(prompt,title,dim,definput,opts);
% intervalo(:,:) = (str2double(answerrange(:,:)));
% a = intervalo(1,1); b = intervalo(2,1);
%
% opts.Interpreter = 'tex';
% opts.Default = 'Fibonacci';
% quest = '\fontsize{12}Qual é o método de otimização a ser utilizado?';
% dlogmet = questdlg(quest,'Métodos de Otimização',...
%     'Fibonacci','Razão Áurea','Brent',opts);
%
% switch dlogmet
%     case 'Fibonacci'
%         metodo = 1;
%     case 'Razão Áurea'
%         metodo = 2;
%     case 'Brent'
%         metodo = 3;
% end
%
% prompt = {'\fontsize{12}Entrar a ordem do erro a ser aceito, 10 elevado a:'};
% title = 'Grandeza do Erro';
% definput = {'-6'};
% answererror = inputdlg(prompt,title,dim,definput,opts);
% tol = 10^(str2double(answererror));


%% Opção 1 selecionada
if(metval == 1)
    
    %     plot([a,b],[0,0],'-o');
    %     sigma = 0; %tolerancia - calcula índice de Fibonacci final pela fórmula de Binet
    %     n = 10; %número de reduções - calcula índice de Fibonacci final pelo número de iterações
    [min,fmin,it,a1,b1] = fibonacci(CritParada, funt, a, b, tol, n);
    
    plot([a1,b1],[-1,-1],'black-+');
    %      xaxis([a b]);
    hold on
    plot(min,fmin,'r-p');
    
    
    xmin = min;
    ymin = fmin;
    it
    
end

%% Opção 2 selecionada
if(metval == 2)
    
    %     plot([a,b],[0,0],'-o');
    [min,fmin,a1,b1,it] = divisaoAurea( funt, a, b, tol , n, CritParada);
    
    plot(min,fmin,'r-p');
    plot([a1,b1],[funt(a1),funt(b1)],'black-+');
    %     xaxis([a b]);
    
end


%% Opção 3 selecionada
if(metval == 3)
    finish=0;
    interval=sort([a b]);
    a=interval(1);
    b=interval(2);
    e=0;   %previous increment
    d=0;    %current increment
    x=a+(3-sqrt(5))/2*(b-a);%x - point with the least value of fun(.)
    w=x;   %w - point with the next lowest value of fun(.)
    v=x;   %v - previous value of w
    fv=funt(v);
    fw=fv;
    fx=fv;
    MaxInt=n;
    i=0;
    while not(finish)
        i=i+1;
        [a,b,e,d,w,v,x,method] = brent(funt,a,b,e,w,v,x,tol);  %method 1- quadratico 2-golden ratio
        min=x;
        fmin=funt(x);
        interval=[a b];
        %         if (max(x-a,b-x)<=2*tol || i>=MaxInt)
        %             finish=1;
        %         end
        if (strcmp(CritParada,'Iterações')==1)
            if (i>=MaxInt)
                finish=1;
            end
        else
            if (max(x-a,b-x)<=2*tol)
                finish=1;
            end
        end
        
        plot(min,fmin,'b-s');
        
    end
    it = i;
    plot(min,fmin,'r-p');
    plot([a,b],[-1 -1],'black-+');
    
end