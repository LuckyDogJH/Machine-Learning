function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples
n = size(theta, 1);
% You need to return the following variables correctly 
J_1 = 0;
J_2 = 0;
sum = 0;
H = X * theta;
grad = zeros(size(theta));


for i = 1:m
    J_1 = J_1 + (H(i) - y(i))^2;
end

for j = 2:n
    J_2 = J_2 + (theta(j))^2;
end

J = J_1/(2*m) + (J_2*lambda)/(2*m);

for i = 1:m
    sum = sum + (H(i) - y(i)) * X(i);
end
grad(1) = sum/m;


for j = 2:n
    sum = 0;
    for i = 1:m
        sum = sum + (H(i) - y(i)) * X(i,j);
    end
    grad(j) = sum/m + (lambda * theta(j))/m;
end
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
% =========================================================================

grad = grad(:);

end
