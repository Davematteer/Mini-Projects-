fprintf("Menu\n 1. Cylinder\n 2. Circle\n 3. Rectangle")
choice = input('Please choose one: ');

switch choice
    case 1
        cylinderRadius = input("Enter the area of cylinder: ");
        h = input("Enter height");
        area = pi * (cylinderRadius^2) *h;
        disp(area)
    
    case 2
        r = input("bitch enter the radius");
        disp(pi * (r^2))
        
    case 3
        l = input("Length");
        b = input("Height");
        disp(l*b)
        
    otherwise
        disp("wrong choice")


end
    

