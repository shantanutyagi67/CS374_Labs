syms f(x) fd(x) y
f(x)=exp(-1*x*x)-cos(x)-1;
fd(x)=diff(f,x);
x=1;
for i=1:100
    x=double(x-f(x)/fd(x));
end
disp(double(x))