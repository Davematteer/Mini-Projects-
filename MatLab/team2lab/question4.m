clc
clear
close all;

P = @(x,y,Q) x +(y*Q);

Q = 0:1:20;

P_d = P(100,-5,Q);

P_s = P(5,4.5,Q);

equilibrium = P_d == P_s;

eq_price = Q(equilibrium);
eq_quantity = P_d(equilibrium);

fprintf('Equilibrium Price: %.2f\n', eq_price);
fprintf('Equilibrium Quantity: %.2f\n', eq_quantity);


figure;
plot(Q, P_d, 'b', 'LineWidth', 2); hold on;
plot(Q, P_s, 'r', 'LineWidth', 2);
xlabel('Quantity (Q)');
ylabel('Price (P)');
title('Supply and Demand Curve');
legend('Demand Curve', 'Supply Curve');
grid on;
