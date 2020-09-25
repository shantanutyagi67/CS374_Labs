syms f(x,y) fd(y) y
f(x,y)=y-0.9*sin(y)-x;
x_axis=linspace(0,pi,30);
y_axis=linspace(0,0,30);
fd(y)=diff(f,y);
n=5;
for i=2:30
    temp=y_axis(i-1);
    for j=1:n
        temp=temp-f(x_axis(i),temp)/fd(temp);
    end
    y_axis(i)=double(temp);
end
disp(y_axis)