clear all;
close all;
format long;
syms fun(x,y) t(x)
fun(x,y)= -x/y;
n=100;
%t(x)= (x^2)/4 + 1;
[xn,yn]=rk4(0,-1,fun,n);
plot(x3,y3,'k*-')
grid on
hold on
[xn,yn]=rk2(0,-1,fun,n);
plot(xn,yn,'r.-')
grid on
hold on
[xn,yn]=euler_2(0,-1,fun,n);
plot(xn,yn,'bo-')
grid on
hold on
%plot(xn,t(xn),'m');


% lowlim = 0;
% uplim = 4;
% r =4;
% ni = input('Enter the number of increments');
% inc = (uplim-lowlim)/ni;
% A = 0;
% for k = 1:(ni+1)
%     x(k) = lowlim + (k-1)*inc;
%     y(k) = sqrt(16-(x(k)^2));
%      
%     
%     if k > 1
%         A = A + .5*(y(k) + y(k-1))*inc;
%     end
% end
% % Print the area to the screen
% Area = A*4
% fprintf('\nThe area is %.5f\n\n',Area)
% pie = (Area)/(r^2);
% fprintf('\nPie is equal to %.5f\n\n',pie)