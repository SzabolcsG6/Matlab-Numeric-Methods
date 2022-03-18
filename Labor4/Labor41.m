f=@ (x)(x^2-2);
a =0.0;
b =20.0;
dx =0.01;
gyokszam =0;
while 1
[ x1 ,x2 ]= gyokkereses (f ,a ,b , dx ); 
    if isnan ( x1 )
        break ;
    else
        a= x2 ;
        x= felezo (f , x1 ,x2 ,1000,1);
            if ~ isnan (x)
                gyokszam = gyokszam +1;
                gyok1 ( gyokszam )= x;
            end
    end
end
gyok1


f=@ (x)(x^3-10*(x^2)+5);
a=0.6;
b=0.8;
dx=0.01;
gyokszam=0;
while 1
[ x1 ,x2 ]=gyokkereses (f ,a ,b , dx );
    if isnan ( x1 )
        break ;
    else
        a=x2 ;
        x=felezo (f , x1 ,x2 ,1000,1);
            if ~ isnan (x) 
                gyokszam=gyokszam+1;
                gyok2(gyokszam)=x;
            end
    end
end
gyok2

f=@ (x)(sin(10*x)-cos(3*x));
a=3;
b=6;
dx=0.01;
gyokszam=0;
while 1
[x1,x2]= gyokkereses (f,a,b,dx);
    if isnan (x1)
        break ;
    else
        a=x2 ;
        x=felezo (f,x1,x2,1000,1);
            if ~ isnan (x) 
                gyokszam=gyokszam +1;
                gyok3 (gyokszam)=x;
            end
    end
end
gyok3

f=@ (x)(-2.75*x^3+18*x^2-21*x-12);
a=0.0;
b=1000.0;
dx=0.01;
gyokszam=0;
while 1
[x1 ,x2]=gyokkereses (f,a,b,dx); 
    if gyokszam==2
        break;
    end
    if isnan (x1)
        break ;

    else
        a=x2;
        x=felezo(f,x1,x2,1000,1);
            if ~ isnan (x)
                gyokszam=gyokszam +1;
                gyok4(gyokszam)= x;
            end
    end
end
gyok4

%%
function [x1,x2]=gyokkereses(f,a,b,dx)
x1=a; 
f1=feval(f,x1);
x2=a+dx;
f2=feval(f,x2); 
    while f1 * f2 > 0.0 
        if x1 >= b
            x1=NaN;
            x2=NaN;
            return
        end
      x1=x2;
      x2=x1+dx;
    f1=feval(f,x1);
    f2=feval(f,x2); 
    end
end
function [m] = felezo(f,a,b,kMax, eps)
    k = 1;
    while k <= kMax
        m = (a+b)/2;
        if(f(m) == 0 || 1/2*(b-a) < eps)
            m;
        end
        k = k + 1;
        if(f(m) * f(a) > 0)
            a = m;
            b = b;
        else
            a = a;
            b = m;
        end
    end
end