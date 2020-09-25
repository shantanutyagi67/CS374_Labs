syms f(x) g(x) y
f(x)=exp(x)-3*x;
g(x)=(f(x + f(x))-f(x))/f(x);
x=0.5;
it=0;
prev = -10;
tol = 10e-5;
for i=1:20
    it=it+1;
    x=double(x-f(x)/g(x));
    if abs(double(x)-prev)<tol
        break
    end
    prev = x;
end
disp(double(x))
fprintf('itr: %d\n',it)