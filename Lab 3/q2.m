format long
syms f(x) fd(x) y
f(x)=tan(x)-x;
fd(x)=diff(f,x);
x=7.7;
it=0;
prev = 0;
tol = 10e-7;
for i=1:20
    it=it+1;
    x=double(x-f(x)/fd(x));
    if abs(double(x)-prev)<tol
        break
    end
    prev = x;
end
disp(double(x))
fprintf('itr: %d\n',it)