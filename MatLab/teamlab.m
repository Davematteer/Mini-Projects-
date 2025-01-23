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
input = randi([2,45])
result = divby6(input)

fprintf("Is %d divisible by 6: %d",input,result)

%% Question 3

r = [5.499 5.498 5.5 5.5 5.52 5.51 5.5 5.48]
h = [11.1 11.12 11.09 11.11 11.11 11.07 11.08 11.11]

% applying logical indexing
logicalindex = (r > 0) & (h > 0)

% filtering radius and height > 0
filteredR = r(logicalindex)
filteredH = h(logicalindex)

% finding volume 
Volume = (1/3) * pi * filteredR.^2 .*filteredH
avgVolume = mean(Volume)

number_of_trials = length(Volume)

fprintf('Number of valid trials: %d\n', number_of_trials)
fprintf('Average volume: %.2f cubic meters\n', avgVolume)

% Plot volume vs radius
subplot(1, 2, 1);
plot(filteredR, Volume, 'o-', 'DisplayName', 'Volume vs Radius');
xlabel('Radius (m)');
ylabel('Volume (cubic meters)');
title('Volume vs Radius');
legend;

% Plot volume vs height
subplot(1, 2, 2);
plot(filteredH, Volume, 'o-', 'DisplayName', 'Volume vs Height');
xlabel('Height (m)');
ylabel('Volume (cubic meters)');
title('Volume vs Height');
legend;




