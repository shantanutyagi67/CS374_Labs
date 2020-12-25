function [l] = midpt(x,y,n)
    l=0;
    u=0;
    
    for i=1:1:n-1
        l=l+(y(i+1)+y(i))/2;
    end
    
    l=l*(x(2)-x(1));
 
 
end