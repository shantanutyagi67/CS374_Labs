xi = linspace(0,pi,30);
pred=linspace(0,0,30);
syms f(x) fd(x)
f(x)=x-0.9*sin(x)-xi(j);
fd(x)=diff(f,x);
x=0;
for j = 2:30
    x=pred(j-1);
for i=1:5
    x=double(x-f(x)/fd(x));
end
pred(j) = x;
end
disp(pred);
