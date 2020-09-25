n = 2;
x=1;
count = 0;
while abs(x-sqrt(2)) > 1.0E-6
    x = 0.5*(x + (n / x));
    count = count +1;
end
fprintf('The root was found to be: %f\nThe number of bisections: %d\n',x,count)