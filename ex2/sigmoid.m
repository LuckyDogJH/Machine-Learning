function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));
[a,b] = size(z);
sum = 0;
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).
for i = 1:a
    for j = 1:b
       e = z(i,j);
       g(i,j) = 1 / (1 + exp(-e));
    end
end





% =============================================================

end
