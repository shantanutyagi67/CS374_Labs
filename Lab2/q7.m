syms f(x,y) fd(y) y
f(x,y)=3*x^7+2*y^5-x^3+y^3-3;
x_axis=0:0.1:10;
y_axis=0:0.1:10;
fd(y)=diff(f,y);
y_axis(1)=1;
%n=input("enter no of iterations: ");
for i=2:101
    temp=y_axis(i-1);
    for j=1:3
        temp=temp-f(x_axis(i),temp)/fd(temp);
    end
    y_axis(i)=vpa(temp);
end
disp (y_axis)