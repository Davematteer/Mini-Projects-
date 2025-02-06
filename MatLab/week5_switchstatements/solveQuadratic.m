function [root] = solveQuadratic(a,b,c)

discriminant = (b^2) - (4*a*c);

f1 = (-b + sqrt(discriminant)/(2*a));

f2 = (-b - sqrt(discriminant)/(2*a));

if discriminant == 0
    root = f1;

elseif discriminant > 0 
    root = [f1,f2];

else 
    root = [f1,f2];

end 


