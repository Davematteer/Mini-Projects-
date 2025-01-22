

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



%% Exercise 2

%a
aMatemp = 1:100;
aMat = reshape(aMatemp,[10,10]);

%b
bMat = [13 -1 5;-22 10 -87];


% 1
cSum = sum(aMat);


% 2
eMean = mean(bMat);

%3
bMat(1,1:3) = [1 1 1];

%4
aSub = aMat(2:9,2:9);
