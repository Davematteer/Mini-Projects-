% Lab 2

%% Question 1 
A = randi(5,3)
determinantA = det(A)
rankA = rank(A)
inverseA = inv(A)

transposeA = transpose(A)

B = A + transposeA

C = A .* transposeA

D = A ./ transposeA

F = [B(1,:);C(:,1)'; D(2,:).*3]

%% Question 2

x = [-10:1:10]
y = x.^2

plot(x,y)
title("Graph of x^2")
ylabel("Values of y")
xlabel("Values of x")
grid on 

figure
% subplot(2,1,1)
% y1 = sin(x);
% y2 = cos(x);

% plot(x,y1)
% hold on 
% plot(x,y2)

% legend("y = sin(x)","y = cos(x)")

% ylabel("y values")
% xlabel("x values")

% ----------------------------
y1 = sin(x);
y2 = cos(x);

plot(x,y1)
hold on 
plot(x,y2)

legend("y = sin(x)","y = cos(x)")

ylabel("y values")
xlabel("x values")

figure
subplot(2,1,1)
y1 = sin(x);

plot(x,y1)
hold on 
subplot(2,1,2)
y2 = cos(x)
plot(x,y2)

legend("y = sin(x)","y = cos(x)")

ylabel("y values")
xlabel("x values")