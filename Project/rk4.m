function [x1,y1] = rk4(x0,y0,f,n)
    h=0.1;%step size
    y1=zeros(1,n);
    i=1;
    y1(i)=y0;
    x1(i)=x0;
    i=i+1;
    k1=h*f(x0,y0); 
    k2=h*f(x0 + h/2 ,y0+k1/2);
    k3=h*f(x0 + h/2 ,y0+k2/2);
    k4=h*f(x0 + h ,y0+k3);
    y1(i)=y0+(k1+2*k2 + 2*k3 + k4)/6;
    x1(i)=x0+h;
    
    while i<=n
        x0=x1(i);
        y0=y1(i);
        i=i+1;
        k1=h*f(x0,y0); 
        k2=h*f(x0 + h/2 ,y0+k1/2);
        k3=h*f(x0 + h/2 ,y0+k2/2);
        k4=h*f(x0 + h ,y0+k3);
        y1(i)=y0+(k1+2*k2 + 2*k3 + k4)/6;
        x1(i)=x0+h;          
    end
end