% Define circuit parameters
R1 = 4; R2 = 5; R3 = 8; R4 = 9; R5 = 1; R6 = 4; 
R7 = 3; R8 = 6; R9 = 2; R10 = 4; R11 = 4; 
R12 = 5; R13 = 5; R14 = 4; R15 = 2; R16 = 10; R17 = 1;

V1 = 50; % Voltage source V1
V2 = 50; % Voltage source V2 (same magnitude as V(n1))
I_R9 = 1; % Current source I(R9)

% Mesh current variables: I1, I2, I3, I4
% Use supermesh to bypass the current source (I_R9)

% Coefficient matrix
A = [ ...
    (R1+R2+R3),    -R3,          0,       0;    % Mesh 1
    -R3,           (R3+R6+R7),  -R7,       0;   % Mesh 2
     0,            -R7,         (R7+R10+R11+R13), -R13; % Mesh 3
     0,             0,          -R13,     (R13+R12+R14+R15) % Mesh 4
];

% Voltage source vector
B = [ ...
    V1;             % Voltage in Mesh 1
    0;              % Supermesh with current source
    V2;             % Voltage in Mesh 3
    0               % Voltage in Mesh 4
];

% Solve for mesh currents
I = A \ B;

% Display results
fprintf('Mesh Currents (A):\n');
fprintf('I1 = %.2f A\n', I(1));
fprintf('I2 = %.2f A\n', I(2));
fprintf('I3 = %.2f A\n', I(3));
fprintf('I4 = %.2f A\n', I(4));
