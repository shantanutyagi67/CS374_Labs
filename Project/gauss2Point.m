function val = gauss2Point(a, b, n, f)
    h = (b-a)/n;
    sum = 0;    
    for i = 0:n-1
        ph_i_minus = a + i*h + h*(1-(1/sqrt(3)))/2;
        ph_i_plus = a + i*h + h*(1+(1/sqrt(3)))/2;
        sum = sum + f(ph_i_minus) + f(ph_i_plus);
    end
    val = h*sum/2;
end