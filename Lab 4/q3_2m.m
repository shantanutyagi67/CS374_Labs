syms g(x,xprev)
g(x,xprev)= (xprev*(x^5+x^3+3) - x*(xprev^5+xprev^3+3))/(xprev*(x^5+x^3+3)-(xprev^5+xprev^3+3));
x=1.01;
xnew = 0;
xprev = -1.01;
it=0;
prev = -10;
tol = 10e-7;
for i=1:20
    it=it+1;
    xnew=double(g(x,xprev));
    xprev = double(x);
    x = double(xnew);
    %if abs(double(x)-prev)<tol
    %    break
    %end
    prev = x;
end
disp(double(x))
fprintf('itr: %d\n',it)