format long
syms f(x) fd(x) y
f(x)= x - 9^(-x);
fd(x)=diff(f,x);
x=0.5;
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

xr=linspace(0,1,11)
yr=double(f(xr))
%lagrange in terpolaation
sum=0;
for i=1:length(xr)
    p=1;
    for j=1:length(xr)
        if j~=i
            c = poly(xr(j))/(xr(i)-xr(j));
            p = conv(p,c);
        end
    end
    term = p*yr(i);
    sum= sum + term;
end
disp(sum);
disp(roots(sum))
x_r=linspace(-1,1,50);
y_r = polyval(sum,x_r);
figure(1)
plot(x_r,y_r)
legend('newton','r')
grid on
%newton interpolation
n = length(xr);
D = zeros(n,n);
D(:,1) = yr';
for j=2:n
  for k=j:n
      D(k,j) = (D(k,j-1)-D(k-1,j-1))/(xr(k)-xr(k-j+1));
  end
end
C = D(n,n);
for k=(n-1):-1:1
  C = conv(C,poly(xr(k)));
  m = length(C);
  C(m) = C(m) + D(k,k);
end
cc = -1;
y_r = ones(length(x_r));
y_r = y_r*cc;
for i=1:length(x_r)
    for j=1:length(C)
        temp = 1;
        for k=1:j-1
            temp = temp * (x_r(i) - xr(k));
        end
        y_r(j) = y_r(j) + C(j)*temp;
    end
end
figure(2)
plot(x_r,y_r)
grid on
