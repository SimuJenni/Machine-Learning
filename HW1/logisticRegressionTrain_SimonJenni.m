function [ thet ] = logisticRegressionTrain_SimonJenni( DataTrain, LabelsTrain, maxIterations )
% logisticRegressionTrain train a logistic regression classifier
% [ theta ] = logisticRegressionTrain( DataTrain, LabelsTrain, MaxIterations )
% Using the training data in DataTrain and LabelsTrain trains a logistic
% regression classifier theta. 
% 
% Implement a Newton-Raphson algorithm.

X = DataTrain';

M = size(X,2);                              % Amount of trainig data
dim = size(X,1);                            % size of theta
theta = zeros(dim,maxIterations);           % Initialize theta
Y = LabelsTrain > 0;                        % Converting Labels to {0,1}

for j=2:maxIterations+1
    g = sigmoid(X, theta(:,j-1));           % Computing a vector with entries h(xi)
    err = Y - g;                            
    grad = (1/M) * sum(err*X',1);           % Computing the gradiant  
    Z = g'.*(ones(M,1)-g');
    N = size(Z,1);
    H = -(1/M) * (X*spdiags(Z(:),0,N,N)*X');% Computing the Hessian
    
    theta(:,j) = theta(:,j-1) - H\grad';    % update theta
end
thet = theta(:,maxIterations+1);


% Implementing the sigmoid function
function [z] = sigmoid(x, t)
m = size(x,2);
z = zeros(1, m);
for i=1:m
    z(1, i) = 1/(1+exp(-(t'*x(:,i))));
end
end

end

