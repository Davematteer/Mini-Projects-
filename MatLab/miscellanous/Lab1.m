% Lab1 

%% Question 1
% from 0 to 30 
rand * 30;

% from 10 to 100
10+ (rand * 90);

% from 1 to 20
randi([1,20]);

% from 30 to 80
randi([30,80]);


%% Question 2

radius = 10;
area = pi * (radius^2);
area

%% Question 3

x = 6;
y = 3;

if x > 5 || y < 10
    true
elseif x > 5 && y < 10
    false
else
    false
end
