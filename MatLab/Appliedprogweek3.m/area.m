function someareabi = area1(x1,x2,x3,y1,y2,y3)
    
    [a,b,c] = distance(x1,x2,x3,y1,y2,y3);

    s = 0.5*(a+b+c); 

    someareabi = sqrt(s*(s-a)*(s-b)*(s-c));

    function [a,b,c] = distance(x1,x2,x3,y1,y2,y3)
        a = sqrt((x1-x2)^2+(y1-y2)^2);
        b = sqrt((x2-x3)^2+(y2-y3)^2);
        c = sqrt((x1-x3)^2+(y1-y3)^2);
    end
    
end 

area1(1,2,3,4,5,6)

