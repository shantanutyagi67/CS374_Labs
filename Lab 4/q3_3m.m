syms g(x,xprev) g1(x) g2(xprev)
g(x,xprev)= (xprev*(x^3 - sinh(x) + 4*x^2 + 6*x + 9) - x*(xprev^3 - sinh(xprev) + 4*xprev^2 + 6*xprev + 9))/((x^3 - sinh(x) + 4*x^2 + 6*x + 9)-(xprev^3 - sinh(xprev) + 4*xprev^2 + 6*xprev + 9));
g1(x) = x^3 - sinh(x) + 4*x^2 + 6*x + 9;
g2(xprev) = xprev^3 - sinh(xprev) + 4*xprev^2 + 6*xprev + 9;
x=7.1;
xnew = 0;
xprev = 7.0;
it=0;
prev = -10;
tol = 10e-3;
for i=1:10
    it=it+1;
    xnew=double(g(x,xprev));
    xprev = double(x);
    x = double(xnew);
    if double(g1(x))*double(g2(xprev)) > 0
       fprintf('condition break')
       break
    end
    if abs(double(x)-prev)<tol
        break
    end
    prev = x;
    
end
disp(double(x))
fprintf('itr: %d\n',it)