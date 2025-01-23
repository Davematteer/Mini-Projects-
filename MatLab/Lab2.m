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

