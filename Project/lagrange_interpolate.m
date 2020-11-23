%%
clear all;
syms x_new(a) y_new(a) temp(a) a 
x1 = csvread('X1.csv');
theta1 = csvread('A1.csv');
y1 = csvread('Y1.csv');
x1=transpose(x1);
theta1=transpose(theta1);
y1=transpose(y1);
%%
% use 200 data points
x_data=x1(1:50);
theta_data=theta1(1:50);
y_data=y1(1:50);
x_new(a)=0;
y_new(a)=0;
sum=0;
sum1=0;
%x1 interpolation
for i=1:length(theta_data)
    p=1;
    for j=1:length(theta_data)
        if j~=i
            c = poly((theta_data(j)))/(theta_data(i)-theta_data(j));
            p = conv(p,c);
        end
    end
    term = p*x_data(i);
    term1=p*y_data(i);
    sum= sum + term;
    sum1=sum1+term1;
end
disp(sum);
for i=1:length(sum)
    x_new(a)=x_new(a)+a^(length(sum)-i)*vpa(sum(i));
    x_new(a);
end
%y1 interpolation

for i=1:length(sum)
    y_new(a)=y_new(a)+a^(length(sum1)-i)*vpa(sum1(i));
    y_new(a);
end


interval=[-0.5 0.5];
fplot(x_new(a),interval) 
grid on;
hold on;
%legend({'Lagrange Polynomial'},'Location','northeastoutside')
fplot(y_new(a),interval)
legend('X1','Y1')

x_array=[];
y_array=[];
for i=1:length(x1)
    x_array(end+1)=double(x_new(theta1(i)));
    y_array(end+1)=double(y_new(theta1(i)));
end
figure
plot(theta1,x_array)
hold on;
plot(theta1,x1)
grid on;
title('X1 value')
legend('Interpolated Values','Actual Values')

figure
plot(theta1,y_array)
hold on;
plot(theta1,y1)
grid on;
title('Y1 value')
legend('Interpolated Values','Actual Values')

x_new(a)
y_new(a)
%%
% use 500 data points
x_data=x1(1:500);
theta_data=theta1(1:500);
y_data=y1(1:500);
x_new(a)=0;
y_new(a)=0;
sum=0;
sum1=0;
%x1 interpolation
for i=1:length(theta_data)
    p=1;
    for j=1:length(theta_data)
        if j~=i
            c = poly((theta_data(j)))/(theta_data(i)-theta_data(j));
            p = conv(p,c);
        end
    end
    term = p*x_data(i);
    term1=p*y_data(i);
    sum= sum + term;
    sum1=sum1+term1;
end
disp(sum);
for i=1:length(sum)
    x_new(a)=x_new(a)+a^(length(sum)-i)*vpa(sum(i));
    x_new(a);
end
%y1 interpolation

for i=1:length(sum)
    y_new(a)=y_new(a)+a^(length(sum1)-i)*vpa(sum1(i));
    y_new(a);
end


interval=[-1 1];
fplot(x_new(a),interval) 
grid on;
hold on;
%legend({'Lagrange Polynomial'},'Location','northeastoutside')
fplot(y_new(a),interval)
legend('X1','Y1')

x_array=[];
y_array=[];
for i=1:length(x1)
    x_array(end+1)=double(x_new(theta1(i)));
    y_array(end+1)=double(y_new(theta1(i)));
end
figure
plot(theta1,x_array)
hold on;
plot(theta1,x1)
grid on;
title('X1 value')
legend('Interpolated Values','Actual Values')

figure
plot(theta1,y_array)
hold on;
plot(theta1,y1)
grid on;
title('Y1 value')
legend('Interpolated Values','Actual Values')

%%
% use 800 data points
x_data=x1(1:800);
theta_data=theta1(1:800);
y_data=y1(1:800);
x_new(a)=0;
y_new(a)=0;
sum=0;
sum1=0;
%x1 interpolation
for i=1:length(theta_data)
    p=1;
    for j=1:length(theta_data)
        if j~=i
            c = poly((theta_data(j)))/(theta_data(i)-theta_data(j));
            p = conv(p,c);
        end
    end
    term = p*x_data(i);
    term1=p*y_data(i);
    sum= sum + term;
    sum1=sum1+term1;
end
disp(sum);
for i=1:length(sum)
    x_new(a)=x_new(a)+a^(length(sum)-i)*vpa(sum(i));
    x_new(a);
end
%y1 interpolation

for i=1:length(sum)
    y_new(a)=y_new(a)+a^(length(sum1)-i)*vpa(sum1(i));
    y_new(a);
end


interval=[-1 1];
fplot(x_new(a),interval) 
grid on;
hold on;
%legend({'Lagrange Polynomial'},'Location','northeastoutside')
fplot(y_new(a),interval)
legend('X1','Y1')

x_array=[];
y_array=[];
for i=1:length(x1)
    x_array(end+1)=double(x_new(theta1(i)));
    y_array(end+1)=double(y_new(theta1(i)));
end
figure
plot(theta1,x_array)
hold on;
plot(theta1,x1)
grid on;
title('X1 value')
legend('Interpolated Values','Actual Values')

figure
plot(theta1,y_array)
hold on;
plot(theta1,y1)
grid on;
title('Y1 value')
legend('Interpolated Values','Actual Values')
