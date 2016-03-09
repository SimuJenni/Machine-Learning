clear all;
close all;
clc;

%% load data
%load('data1.mat');
load('data2.mat');
 
K = max(labels); % number of clusters

%% display data
figure;
scatter(X(1,:),X(2,:),'b');
axis equal;
title('data');

colors = {'b', 'r', 'g'};
figure;
for j = 1:K
    scatter( X(1,labels == j), X(2,labels == j), colors{j} );
    hold on;
end
axis equal;
title('data with ground truth cluster labelling');

%% cluster with k-means
perm = randperm(size(X,2));
Cinit = X(:,perm(1:K));

fprintf('k-means ... ');
tic;
[C, A] = Kmeans_SIMONJENNI(X, Cinit);
toc;

costKmeans=costFunct_SIMONJENNI(X,A,C);

C2=zeros(size(C));
for j=1:size(C,2)
    indic2=(labels==j);
    C2(:,j)=1/sum(indic2)*(indic2*X');
end

costGroundTruth=costFunct_SIMONJENNI(X,labels,C2);

% means2=zeros(size(X));
% for i=1:size(C2,2)
% means2=means2+C2(:,i)*(labels==i);
% end
% 
% Diff2=X-means2;
% Cost2=0;
% for j=1:size(X,2)
%     Cost2=Cost2+norm(Diff2(:,j))^2;
% end



%% display clustering
figure;
for j = 1:K
    scatter( X(1,A == j), X(2,A == j), colors{j} );
    hold on;
    scatter( C(1,j), C(2,j), 100, colors{j}, 'fill' );
%    scatter( Cinit(1,j), Cinit(2,j), 'fill');
end
axis equal;
title('clustered data');
