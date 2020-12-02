%%
format long;
clearvars;
clc;
close all;
% The integral of sin(x) on [0,pi] is 2
% Let us compare TRAPZ and SIMPS
% start, end, steps
n=20;
axis = linspace(1,n,n);
x = linspace(0,1000,1000);
er_abs = ones(1,n);
er_rel = ones(1,n);
approx = ones(1,n);
for i = 1:n % find n+1 values from 0 to n
    y = exp(1).^(-x).*x.^(i-1);
    approx(i) =  trapz(x,y); % returns gaamma(n) = (n-1)!;
    er_abs(i) = gamma(i) - approx(i); 
    er_rel(i) = er_abs(i) / gamma(i);
end
figure(1);
plot(er_abs,'b');
hold on;
plot(er_rel,'r');
legend('Absolute Error','Relative Error');
title('20 values: integrated from 0-1000, 1000 steps');
grid on;
figure(2);
plot(approx,'r');
hold on;
plot(gamma(axis),'b');
legend('Approximation','Actual function');
title('Gamma Function: Trapezoid');
grid on;