function Eigen = pca_SIMONJENNI(Data, k)
% Input
%     Data: the data matrix, each column represents a data point.
%     k: number of principle components to use.
%
% Output
%     Eigen: a matrix with k columns, where each column is an 
%                eigenvector of the covariance matrix of Data.


X=Data;
[U,S,V] = svd(X);   % [U,S,V] = svd(X) returns matrices U,S,V such that: X=U*S*V'
Eigen = V(:,1:k)';   % The top k columns of V are the top k principal eigenvectors of X'*X.
                    % The empirical covariance matrix of X is 1/m*(X'*X)