%%
clear all;
close all;
format long;
%The amount of Radioactive decaytaking place as a function of time for Uranium U-238 
%is found from this expression of x=x_0 * exp(-lambda*t)
%As we know the rate of decay = d(x)/dt = -1*lambda*t
%So upon integrating the above function we get the required expression of x(t).
%Here we have taken t=x and x=y giving y(x) as the function x(t).
%lambda of U-238= 0.154 * 10^-9

dx = 0.001;
l=0.154*10^-9;       %lambda in (1/year)
%fun = @(x) -l*x;    %lambda*x
fun=@(x) sqrt(x).*exp(-x);
figure (1);
fplot(fun)
title('Function Plot')
grid on;
    
%%
% vary limit and check error
err_rect=[];
err_midpt=[];
err_simp=[];
err_trap=[];
err_gauss2pt=[];
final_plot=[];
final_plot_rect=[];
final_plot_midpt=[];
final_plot_simp=[];
final_plot_trap=[];
final_plot_gauss2pt=[];

for i=0.5:0.5:10
    x = linspace(0,i,100+(i-0.5)*200);
    y=fun(x);
    q = integral(fun,0,i);
    [m,szx]=size(x);
    final_plot(end+1)= integral(fun,0,i);
    final_plot_trap(end+1) = trapezoidal(x(1),x(end),szx,fun);
    final_plot_midpt(end+1) = midpt(x,y,szx);
    final_plot_rect(end+1) = (sum(y) - y(end))*(x(2)-x(1));
    final_plot_simp(end+1) =  simpson(x(1),x(end),szx,fun);
    final_plot_gauss2pt(end+1) =  gauss2Point(x(1),x(end),szx,fun);
    err_midpt(end+1)=abs(final_plot_midpt(end)-q);
    err_rect(end+1)=abs(final_plot_rect(end)-q);
    err_simp(end+1)=abs(final_plot_simp(end)-q);
    err_trap(end+1)=abs(final_plot_trap(end)-q);
    err_gauss2pt(end+1)=abs(final_plot_gauss2pt(end)-q);
end
x_axis=0.5:0.5:10;

figure(2);
plot(x_axis,err_midpt,'r-*')
grid on;
hold on;
plot(x_axis,err_gauss2pt,'k-*')
grid on;
hold on;
plot(x_axis,err_rect,'m-')
grid on;
hold on;
plot(x_axis,err_trap,'g-')
grid on;
hold on;
plot(x_axis,err_simp,'b-o')
hold on
legend({'Mid-point Method','Gauss-2-point Method','Rectangular Method','Trapezoidal Method','Simpson Method'},'Location','northeast')
xlabel('Upper limit')
ylabel('Absolute Error')
title('Error Plot');
x_axis=0.5:0.5:10;
figure(4);

plot(x_axis,final_plot_midpt,'m-')
grid on;
hold on;
plot(x_axis,final_plot_gauss2pt,'k')
grid on;
hold on;
plot(x_axis,final_plot_rect,'y*-')
grid on;
hold on;
plot(x_axis,final_plot_trap,'go-')
grid on;
hold on;
plot(x_axis,final_plot_simp,'b-')
grid on;
hold on;
plot(x_axis,final_plot,'r.')
xlabel('Upper limit')
ylabel('Absolute Error')
title('Net Integral plots')
legend({'Mid-point Method','Gauss-2-Point Method','Rectangular Method','Trapezoidal Method','Simpson Method','Actual Plot'},'Location','southeast')


