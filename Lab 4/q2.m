format long
syms f(x) fd(x) y
f(x)= x^3 - 3*x^2 + 4;
fd(x)=diff(f,x);
x=2.1;
it=0;
prev = 0;
tol = 10e-7;
a=3;
for i=1:20
    it=it+1;
    x=double(x-a*f(x)/fd(x));
    if abs(double(x)-prev)<tol
        break
    end
    prev = x;
end
disp(double(x))
fprintf('itr: %d\n',it)