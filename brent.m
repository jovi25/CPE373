function [a,b,e,d,w,v,x,method] = brent(fun,a,b,e,w,v,x,tol)
t2=2*tol;

%% Initial computations
golden=(sqrt(5)-1)/2;
m=0.5*(a+b); %midpoint of the interval
fa=fun(a);
fx=fun(x);
fm=fun(m);
fb=fun(b);
fv=fun(v);
fw=fun(w);

A = [x^2 x 1
    w^2 w 1
    v^2 v 1];
C = [fx;fw;fv];

% A = [a^2 a 1
%     m^2 m 1
%     b^2 b 1];
% C = [fa;fm;fb];
%Soluciona matriz dos coeficientes

par = inv(A)*C;
if (all(isfinite(par)))
    alpha = par(1,1);
    beta = par(2,1);
    
    %Calcula ponto de minimização da parábola aproximada
    u = -beta/(2*alpha);
else
    alpha=-1;
end
 
if ( alpha<=0 || (u > b) || (u < a)) % golden ratio
    method=2;
    e=(b*(x<m)+a*(x>=m))-x;
    d=golden*e;
    
else% Ponto u aproveitavel  IQ
    method=1;
    
    if((u-a)<t2 || (b-u)<t2)
        d=tol-2*tol*(x>=m);
    else
        d=u-x;
    end
    
end
%% f must not be evaluated too close to x
if (abs(d)>=tol)
    u=x+d;
elseif d>0
    u=tol;
else
    u=-tol;
end
fu=fun(u);

if fu<=fx
    if u<x
        b=x;
    else
        a=x;
    end
    v=w;
    fv=fw;
    w=x;
    fw=fx;
    x=u;
else
    if u<x
        a=u;
    else
        b=u;
    end
    if (fu<=fw || w==x)
        v=w;
        fv=fw;
        w=u;
        fw=fu;
    elseif (fu<=fv || v==x || v==w)
        v=u;
        fv=fu;
    end
end


