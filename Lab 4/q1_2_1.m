clear all
format long 
syms f1(x) f2(x) fd(x)
f1(x)=(x*x*x +1)/5;
f(x)=x*x*x - 5*x +1;
fd(x)=diff(f1,x);
er=10e-7;
x0=0.7;
x=x0;
i=0;
x_ax = linspace(-1,1,100);
while abs(f1(x)-x)>er
    x = f1(x);
    i=i+1;
end
fprintf('Root by function 1: ')
disp(double(x));
fprintf('Iterations : ')
disp(i)

figure(1);
plot(x_ax,abs(fd(x_ax)),'b');
hold on;
plot(x_ax,f(x_ax),'r');
hold on;
plot(x_ax,zeros(100),'black')
legend('abs(diff(phi(x)))','f(x)')
