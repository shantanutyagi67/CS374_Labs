%% SIMPSON
format long;
clearvars;
clc;
close all;
% The integral of sin(x) on [0,pi] is 2
% Let us compare TRAPZ and SIMPS
% start, end, steps
n=10;
%axis = linspace(1,n,n);
a = 0;
b = 100;
steps = 1000;
x = linspace(a,b,steps);
er_abs = ones(1,n);
er_rel = ones(1,n);
approx = ones(1,n);
for i = 1:n % find n+1 values from 0 to n
    y = exp(1).^(-x).*x.^(i-1);
    approx(i) =  SIMP(x,y); % returns gaamma(n) = (n-1)!;
    er_abs(i) = gamma(i) - approx(i); 
    er_rel(i) = er_abs(i) / gamma(i);
end
figure(1);
%plot(er_abs,'b');
hold on;
plot(er_rel,'r-o');
%legend('Relative Error: Simpson');
%title('20 values: integrated from 0-100, 100 steps');
grid on;
figure(2);
plot(approx,'r-o');
xlabel('X Value');
ylabel('Gamma(X) Value');
hold on;
%plot(gamma(axis),'b');
%legend('Approximation','Actual function');
%title('Gamma Function: Simpsons');
grid on;

% TRAPEZOID
%n=10;
%axis = linspace(1,n,n);
%a = 0;
%b = 100;
%steps = 100;
%x = linspace(a,b,steps);
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
%plot(er_abs,'b');
hold on;
plot(er_rel,'b-*');
%legend('Relative Error: Trapezoid');
%title('20 values: integrated from 0-100, 100 steps');
grid on;
figure(2);
plot(approx,'b-*');
xlabel('X Value');
ylabel('Gamma(X) Value');
hold on;
%plot(gamma(axis),'b');
%legend('Approximation','Actual function');
%title('Gamma Function: Trapezoid');
grid on;

% RECTANGULAR
%n=10;
%axis = linspace(1,n,n);
%a = 0;
%b = 100;
%steps = 100;
%x = linspace(a,b,steps);
dx = (b-a)/(steps+1);
er_abs = ones(1,n);
er_rel = ones(1,n);
approx = ones(1,n);
for i = 1:n % find n+1 values from 0 to n
    y = exp(1).^(-x).*x.^(i-1);
    approx(i) =  sum(y*dx); % returns gaamma(n) = (n-1)!;
    er_abs(i) = gamma(i) - approx(i); 
    er_rel(i) = er_abs(i) / gamma(i);
end
figure(1);
%plot(er_abs,'b');
hold on;
plot(er_rel,'g-');
%legend('Relative Error: Simpson','Relative Error: Trapezoid','Relative Error: Rectangular');
%title('20 values: integrated from 0-100, 100 steps');
grid on;
figure(2);
plot(approx,'g-');
hold on;
%plot(gamma(axis),'b');
xlabel('X Value');
ylabel('Gamma(X) Value');
%legend('Approximation','Actual function');
%title('Gamma Function: Rectangular');
grid on;

%Mid Point
dx = (b-a)/(steps+1);
er_abs = ones(1,n);
er_rel = ones(1,n);
approx = ones(1,n);
for i = 1:n % find n+1 values from 0 to n
    y = exp(1).^(-x).*x.^(i-1);
    approx(i) =  midpt(x,y,steps); % returns gaamma(n) = (n-1)!;
    er_abs(i) = gamma(i) - approx(i); 
    er_rel(i) = er_abs(i) / gamma(i);
end
figure(1);
%plot(er_abs,'b');
hold on;
plot(er_rel,'m--');
%legend('Relative Error: Simpson','Relative Error: Trapezoid','Relative Error: Rectangular');
%title('20 values: integrated from 0-100, 100 steps');
grid on;
figure(2);
plot(approx,'k--');
hold on;
%plot(gamma(axis),'b');
xlabel('X Value');
ylabel('Gamma(X) Value');
%legend('Approximation','Actual function');
%title('Gamma Function: Rectangular');
grid on;

% GAUSS 2 POINT
%n=10;
axis = linspace(1,n,n);
%a = 0;
%b = 100;
%steps = 100;
%x = linspace(a,b,steps);
dx = (b-a)/(steps+1);
er_abs = ones(1,n);
er_rel = ones(1,n);
approx = ones(1,n);
for i = 1:n % find n+1 values from 0 to n
    y =  @(x) exp(1).^(-x).*x.^(i-1);
    approx(i) =  gauss2Point(a,b,steps,y); % returns gaamma(n) = (n-1)!;
    er_abs(i) = gamma(i) - approx(i); 
    er_rel(i) = er_abs(i) / gamma(i);
end
figure(1);
%plot(er_abs,'b');
hold on;
plot(er_rel,'k-.');
legend('Relative Error: Simpson','Relative Error: Trapezoid','Relative Error: Rectangular','Relative Error: Mid Point','Relative Error: Gauss 2 Point');
xlabel('Input Value');
ylabel('Relative Error Value');
title('10 values: integrated from 0-100, 1000 steps');
grid on;
figure(2);
plot(approx,'y-.');
hold on;
plot(gamma(axis),'m--');
legend('Simpsons','Trapezoid','Rectangular','Mid Point','Gauss 2 Point','Actual');
title('Numerically Integrated Values');
xlabel('X Value');
ylabel('Gamma(X) Value');
grid on;