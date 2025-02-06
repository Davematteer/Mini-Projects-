fprintf("Menu\n1. Cylinder\n2. Circle\n3. Rectangle")

choice = input('Please choose one: ');

if choice == 1
    cylinderRadius = input("Enter the area of cylinder: ");
    h = input("Enter height");
    area = pi * (cylinderRadius^2) *h;
    disp(area)

elseif choice == 2
    r = input("bitch enter the radius");
    disp(pi * (r^2))

elseif choice == 3
    l = input("Length");
    b = input("Height");
    disp(l*b)
    
else 
    disp("try again bitch")
end