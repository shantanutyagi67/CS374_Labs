clear all
format long 
syms f1(x) f2(x)
f1(x)=sqrt((4 - 6*exp(-1*x))/2);
f2(x)=-1*(log((4-2*x*x)/6));
er=10e-7;
x0=0.7;
x=x0;
i=0;
while abs(f1(x)-x)>er
    x = f1(x);
    i=i+1;
end
fprintf('Root by function 1: ')
disp(double(x));
fprintf('Iterations : ')
disp(i)
x=x0;
while abs(f2(x)-x)>er
    x = f2(x);
    if (4-2*x*x)<0
        fprintf('Error: Diverging ')
        break;
    end
    i=i+1;
end
fprintf('Root by function 2: ')
disp(double(x));
fprintf('Iterations : ')
disp(i)