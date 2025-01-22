%% Question 1
%1 No error
%2 No closing bracket and incomplete terms 
%3 "]" missing and incompatible dimensions
%4 None 
%5 Element no present or exceeding array bound 
%6 Incompatible sizes 
%7 None 
%8 None 
%9 No element-wise addition present in Matlab
%10 None 
%11 Incompatible dimensions 
%12 None
%13 None

%% Question 2

divby6 = @(n) mod(n,6) == 0;
input = randi([2,45]);
result = divby6(input);

fprintf("Is %d divisible by 6: %d",input,result);

%% Question 3

