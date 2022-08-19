function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
Ad = find(y == 1);
Re = find(y == 0);
plot(X(Ad, 1), X(Ad, 2), 'K+', 'Markersize', 7)
plot(X(Re, 1), X(Re, 2), 'ko', 'markerfacecolor', 'r', 'Markersize', 7)








% =========================================================================



hold off;

end
