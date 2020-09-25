clear all
format long 
a=16;
syms f1(x) f2(x) fd(x)
f1(x)=x*(3*a-x*x)/(2*a);
fd(x)=diff(f1,x);
er=10e-7;
x0=1;
x=x0;
i=0;
x_ax = linspace(0,5,100);
itr = 10;
while (i<=itr)
    x = f1(x);
    i=i+1;
end
fprintf('Root by function 1: ')
disp(double(x));
fprintf('Iterations : ')
disp(i)

figure(4);
plot(x_ax,abs(fd(x_ax)),'b');
hold on;
plot(x_ax,zeros(100),'black')
ylim([-1 2])
legend('abs(diff(phi(x)))','f(x)')