%% Exercise 1
% a
aVec = [3.14 15 9 26];

%b
bVectemp = [2.71 8 28 182];

bVec = bVectemp';

%c
cVec = 5:0.2:-5;

%disp(cVec);

%d
dVec = logspace(0,1,100);
%disp(dVec)

%1
xVec = 1/(sqrt(2*pi*(2.5^2)))*exp(1).^((-cVec.^2)/2.5^2);


%2
yVec = sqrt((aVec').^2+bVec);

%3
zVec = log10(1./dVec);

