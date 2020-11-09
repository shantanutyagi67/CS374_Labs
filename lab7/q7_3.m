format long
syms f(x) fd(x) y
f(x)= 1/(1+x*x);
fd(x)=diff(f,x);

xr=linspace(-5,5,15);
yr=double(f(xr));
%lagrange in terpolaation
sum=0;
for i=1:length(xr)
    p=1;
    for j=1:length(xr)
        if j~=i
            c = poly(xr(j))/(xr(i)-xr(j));
            p = conv(p,c);
        end
    end
    term = p*yr(i);
    sum= sum + term;
end
disp(sum);
disp(roots(sum))
x_r=linspace(-5,5,30);
y_r = polyval(sum,x_r);
figure(1)
plot(x_r,y_r)
legend('newton')
grid on
xr=linspace(-5,5,30);
yr=double(f(xr));
x_r=linspace(-5,5,30);
y_r = polyval(sum,x_r);
y_e = yr - y_r;
figure(2)
plot(x_r,y_e)
legend('Error')
grid on