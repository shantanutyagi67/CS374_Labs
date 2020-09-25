syms g(x,xprev)
g(x,xprev)= (xprev*(tan(x)-x) - x*(tan(xprev)-xprev))/(tan(x)-x-tan(xprev)+xprev);
x=7.7;
xnew = 0;
xprev = 7.69;
it=0;
prev = -10;
tol = 10e-7;
for i=1:5
    it=it+1;
    xnew=double(g(x,xprev));
    xprev = double(x);
    x = double(xnew);
    if abs(double(x)-prev)<tol
        break
    end
    prev = x;
end
disp(double(x))
fprintf('itr: %d\n',it)