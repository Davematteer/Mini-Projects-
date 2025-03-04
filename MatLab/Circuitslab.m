% Coefficient matrix A
A = [
    17, -8, 0, 0, 0, 0, 0, 0, 0, 0;
    -8, 17, 0, -5, -4, 0, 0, 0, 0, 0;
    0, 0, 10, 0, 0, 0, 0, 0, 0, 0;
    0, -5, 0, 16, 0, 0, 0, 0, 0, 0;
    0, -4, 0, 0, 19, -3, 0, 0, 0, 0;
    0, 0, 0, 0, -3, 18, -6, -5, 0, 0;
    0, 0, 0, 0, 0, -5, 11, 0, 0, 0;
    0, 0, 0, 0, 0, -6, 0, 16, -4, 0;
    0, 0, 0, 0, 0, 0, -4, -9, 0, -5;
    0, 0, 0, 0, 0, 0, 0, 0, -5, 10
];

% Constant vector B
B = [
    0;
    0;
    -50;
    0;
    0;
    0;
    0;see
    -56.3343;
    0;
    -56.3393
];

% Solve the system of equations
X = A \ B;

% Display the solution
disp('The solution is:');
disp(X);
