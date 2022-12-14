function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J_1 = 0;
J_2 = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

%%%% Calculate H_theta %%%%
X = [ones(m,1), X];
a_1 = X * Theta1';
g_a_1 = sigmoid(a_1);
g_a_1 = [ones(m,1), g_a_1];
a_2 = g_a_1 * Theta2';
H_theta = sigmoid(a_2);

%%%% Calculate J part 1 %%%%
for i = 1:m
   Y = zeros(num_labels, 1);
   Y(y(i)) = 1;
   for k = 1:num_labels
      J_1 = J_1 + ((-Y(k)) * log(H_theta(i,k)) - (1 - Y(k)) * log(1 - (H_theta(i,k))));
   end
end
J_1 = J_1/m;

%%%% Calculate J part 2 %%%%
for i = 1:size(Theta1, 1)
   for k = 2 : size(Theta1, 2)
       J_2 = J_2 + Theta1(i,k) * Theta1(i,k);
   end
end

for i = 1:size(Theta2, 1)
    for k = 2:size(Theta2, 2)
        J_2 = J_2 + Theta2(i,k) * Theta2(i,k);
    end
end
J_2 = (J_2 * lambda)/(2 * m);

J = J_1 + J_2;



%%%% Calculate backpropagation %%%%
diff_3 = zeros(size(H_theta, 1), size(H_theta, 2));
for i = 1:m
    Y = zeros(num_labels, 1);
    Y(y(i)) = 1;
    for k = 1:num_labels
        diff_3(i,k) = H_theta(i,k) - Y(k);
    end
end
A_1 = [ones(m,1), a_1];
diff_2 = (diff_3 * Theta2).*(sigmoidGradient(A_1));
diff_2 = diff_2(:,2:end);

%%%% Calculate grad %%%%

grad_1 = (diff_2' * X);
grad_2 = (diff_3' * g_a_1);

Theta1_grad = grad_1/m;
Theta2_grad = grad_2/m;

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%
% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
