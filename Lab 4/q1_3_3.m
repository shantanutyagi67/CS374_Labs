clear all
format long 
a = -3;
b = 2;
syms f1(x) f2(x) fd(x)
f1(x)=-(x*x +b)/a;
f(x)=x*x +a*x + b;
fd(x)=diff(f1,x);
er=10e-7;
x0=0;
x=x0;
i=0;
itr = 10;
x_ax = linspace(0,2.5,100);
while (i<=itr)
    x = f1(x);
    i=i+1;
end
fprintf('Root by function 1: ')
disp(double(x));
fprintf('Iterations : ')
disp(i)

figure(3);
plot(x_ax,abs(fd(x_ax)),'b');
hold on;
plot(x_ax,f(x_ax),'r');
hold on;
plot(x_ax,zeros(100),'black')
ylim([-1 2])
legend('abs(diff(phi(x)))','f(x)')
