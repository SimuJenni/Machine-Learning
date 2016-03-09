function [NormData] = normalizeData_SIMONJENNI(Data)
% Input
%     Data: the data matrix, each column represents a data point.
%
% Output
%     NormData: the normalized data matrix.
%

X=Data;
m= size(X,1);                               % # of faces
mu=1/m*sum(X,1);                            % computing the mean
X=X-repmat(mu, size(X,1),1);                % subtracting the mean from each x(i)
X2=X.^2;                                    % squaring each entry of X
sig2=1/m*sum(X2,1);                         % computes sigma(j)^2
NormData=X./repmat(sig2, size(X,1),1);      % dividing each entry of X by sigma(j)^2   
