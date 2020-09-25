format long
q= @(x) log(6/(4-2*x^2));
%q= @(x) sqrt((4-6*exp(-x))/2);
n=10;
F(q,0.5,10)
function root = F(q, x0, n)
maxIter = 100;
epsilon = 5*10^-(n+1);
x=x0;
xold=x0;
for i=maxIter
    x=q(x);
    err = abs(x-xold);
    xold = x;
    if(err<epsilon)
        break
    end
end
root=x;
end