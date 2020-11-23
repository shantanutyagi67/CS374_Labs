%%
format long
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
x_data=x1(1:10);
theta_data=theta1(1:10);
y_data=y1(1:10);
x_new(a)=0;
y_new(a)=0;
temp(a)=1;
ans_x = newton_interpolation(x_data, theta_data);
for i=1:length(ans_x)
    for j=1:i-1
        temp(a)=temp(a)*(a-x_data(j));
    end
    x_new(a)=x_new(a)+vpa(ans_x(i))*temp(a);
    temp(a)=1;
end
temp(a)=1;
ans_y = newton_interpolation(y_data, theta_data);
for i=1:length(ans_y)
    for j=1:i-1
        temp(a)=temp(a)*(a-y_data(j));
    end
    y_new(a)=y_new(a)+vpa(ans_y(i))*temp(a);
    temp(a)=1;
end
interval=[-3 3];
fplot(x_new(a),interval)
hold on;
fplot(y_new(a),interval)
grid on;
legend('X1','Y1')
x_array=[];
y_array=[];
for i=1:length(x1)
    x_array(end+1)=double(x_new(theta1(j)));
    y_array(end+1)=double(y_new(theta1(j)));
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
% use 500 data points
x_data=x1(1:500);
theta_data=theta1(1:500);
y_data=y1(1:500);
x_new(a)=0;
y_new(a)=0;
temp(a)=1;
ans_x = newton_interpolation(x_data, theta_data, 0.2);
for i=1:length(ans_x)
    for j=1:i-1
        temp(a)=temp(a)*(a-x_data(j));
    end
    x_new(a)=x_new(a)+vpa(ans_x(i))*temp(a);
    temp(a)=1;
end
temp(a)=1;
ans_y = newton_interpolation(y_data, theta_data, 0.2);
for i=1:length(ans_y)
    for j=1:i-1
        temp(a)=temp(a)*(a-y_data(j));
    end
    y_new(a)=y_new(a)+vpa(ans_y(i))*temp(a);
    temp(a)=1;
end
interval=[-3 3];
fplot(x_new(a),interval)
hold on;
fplot(y_new(a),interval)
grid on;
legend('X1','Y1')
x_array=[];
y_array=[];
for i=1:length(x1)
    x_array(end+1)=double(x_new(theta1(j)));
    y_array(end+1)=double(y_new(theta1(j)));
end
figure
plot(x_array,theta1)
hold on;
plot(x1,theta1)
grid on;
title('X1 value')
legend('Interpolated Values','Actual Values')

figure
plot(y_array,theta1)
hold on;
plot(y1,theta1)
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
temp(a)=1;
ans_x = newton_interpolation(x_data, theta_data, 0.2);
for i=1:length(ans_x)
    for j=1:i-1
        temp(a)=temp(a)*(a-x_data(j));
    end
    x_new(a)=x_new(a)+vpa(ans_x(i))*temp(a);
    temp(a)=1;
end
temp(a)=1;
ans_y = newton_interpolation(y_data, theta_data, 0.2);
for i=1:length(ans_y)
    for j=1:i-1
        temp(a)=temp(a)*(a-y_data(j));
    end
    y_new(a)=y_new(a)+vpa(ans_y(i))*temp(a);
    temp(a)=1;
end
interval=[-3 3];
fplot(x_new(a),interval)
hold on;
fplot(y_new(a),interval)
grid on;
legend('X1','Y1')
x_array=[];
y_array=[];
for i=1:length(x1)
    x_array(end+1)=double(x_new(theta1(j)));
    y_array(end+1)=double(y_new(theta1(j)));
end
figure
plot(x_array,theta1)
hold on;
plot(x1,theta1)
grid on;
title('X1 value')
legend('Interpolated Values','Actual Values')

figure
plot(y_array,theta1)
hold on;
plot(y1,theta1)
grid on;
title('Y1 value')
legend('Interpolated Values','Actual Values')
