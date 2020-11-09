x = [0,8];
y = [8,0];
n2 = polyfit(x,y,1);
x_r = linspace(0,8,100);
y_r = polyval(n2,x_r);
plot(x_r,y_r,'r')
%legend('degree 1')
hold on;
grid on
x = [0,1,8];
y = [8,12,0];
n2 = polyfit(x,y,2);
x_r = linspace(0,8,100);
y_r = polyval(n2,x_r);
plot(x_r,y_r,'b')
%legend('degree 2')
hold on;

x = [0,1,3,8];
y = [8,12,2,0];
n2 = polyfit(x,y,3);
x_r = linspace(0,8,100);
y_r = polyval(n2,x_r);
plot(x_r,y_r,'black')
%legend('degree 3')
hold on;

x = [0,1,3,4,8];
y = [8,12,2,6,0];
n2 = polyfit(x,y,4);
x_r = linspace(0,8,100);
y_r = polyval(n2,x_r);
plot(x_r,y_r,'g')
legend('degree 1','degree 2','degree 3','degree 4')
hold on;