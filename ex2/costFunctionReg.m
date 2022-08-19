function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
 
J_1 = 0;
J_2 = 0;
grad = zeros(size(theta));
a = size(theta);

%
h = sigmoid( X * theta);
for i = 1 : m
   part = ( (-y(i) * log(h(i))) - ( (1 - y(i)) * log(1 - h(i)) ) ) ;
   J_1 = J_1 + part;
end

for j = 2:a
   part_2 = theta(j) * theta(j);
   J_2 = J_2 + part_2;
end

J = (J_1 / m) + (lambda/(2*m))*(J_2);

sum_1 = 0;
for i = 1:m
   sum_1 = sum_1 + (h(i) - y(i)) * X(i,1) ;
end
grad(1) = sum_1 / m;
for j = 2:a
   sum_2 = 0;
   for i = 1:m
       sum_2 = sum_2 + (h(i) - y(i)) * X(i,j) ;
   end
   sum_2 = sum_2/m + (lambda/m) * theta(j);
   grad(j) = sum_2;
   
end
% =============================================================
end