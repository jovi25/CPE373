function [a,b,e,d,w,v,x,fv,fw,fx] = brent(fun,a,b,e,d,w,v,x,tol,fv,fw,fx)

%% Initial computations
t2=2*tol;
golden=(3-sqrt(5))/2;
m=0.5*(a+b); %midpoint of the interval
p=0;
q=0;
r=0;


if(abs(e)>tol)         % checking size of the increment ("gradient")     
    r=(x-w)*(fx-fv);
    q=(x-v)*(fx-fw);
    p=(x-v)*q-(x-w)*r;
    q=2*(q-r);
    if q>0
        p=-p;
    else
        q=-q;
    end
    r=e;
    e=d;
end
if(abs(p)<abs(0.5*q*r) && p<q*(a-x) && p<q*(b-x)) %%Parabola step
    d=p/q;
    u=x+d;
    if((u-a)<t2 || (b-u)<t2)
        d=tol-2*tol*(x>=m);
    end
else          %%Golden section step
    e=(b*(x<m)+a*(x>=m))-x;
    d=golden*e;
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
    fx=fu;
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


