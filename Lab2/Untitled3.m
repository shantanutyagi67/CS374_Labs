clear vars
close all
syms f(x) fd(x) y
f(x)=x-0.9*sin(x);
fd(x)=diff(f,x);
x=1;
for i=1:100
    x=double(x-f(x)/fd(x));
end
disp(double(x))