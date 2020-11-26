%INITIALIZATION
format long
clearvars;
clc;
close all;

X2_1 = csvread('C:\Users\geekSA67\code\CS374_Labs\Project\X2_1000.csv');
Y2_1 = csvread('C:\Users\geekSA67\code\CS374_Labs\Project\Y2_1000.csv');
X2_2 = csvread('C:\Users\geekSA67\code\CS374_Labs\Project\X100pred.csv');
Y2_2 = csvread('C:\Users\geekSA67\code\CS374_Labs\Project\Y100pred.csv');

err = zeros([length(X2_1),1]);

for i = 1:length(X2_1)
    err(i) = sqrt( (X2_1(i)-X2_2(i))^2 + (Y2_1(i)-Y2_2(i))^2 );
end

plot(err);
grid on;
