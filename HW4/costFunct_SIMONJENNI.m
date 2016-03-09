function [ Cost ] = costFunct_SIMONJENNI( X, A, C )

% implements the cost/distortion-function

means=zeros(size(X));             % vector with the means that
for i=1:size(C,2)                 % belong to each point x(i)
means=means+C(:,i)*(A==i);        % according to the labeling     
end

Diff=X-means;                     % diffference between points and mean
Cost=0;
for j=1:size(X,2)                 % computes the cost-function value
    Cost=Cost+norm(Diff(:,j))^2;
end


end

% I added the following code in hw4.m on line 34 to compute and compare the
% cost values:
% 
% costKmeans=costFunct_SIMONJENNI(X,A,C);
% 
% C2=zeros(size(C));
% for j=1:size(C,2)
%     indic2=(labels==j);
%     C2(:,j)=1/sum(indic2)*(indic2*X');
% end
% 
% costGroundTruth=costFunct_SIMONJENNI(X,labels,C2);