y = @(x) x^2 - 2;
a = input('Enter the value of a: ');
b = input('Enter the value of b: ');
if y(a)*y(b) > 0
  fprintf('No roots exist within the given interval\n');
  return
end

if y(a) == 0
  fprintf('a is one of the roots\n')
  return
elseif y(b) == 0
  fprintf('b is one of the roots\n')
  return
end

for i = 1: 100
  m = (a+b)/2; 
  if y(a)*y(m) < 0
    b = m;
  else
    a = m;
  end
  if abs(y(m)) < 1.0E-6
    break
  end
end
fprintf('The root was found to be: %f\nThe number of bisections: %d\n',a,i)