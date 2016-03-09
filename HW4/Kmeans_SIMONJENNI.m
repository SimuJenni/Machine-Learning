function [C, A] = Kmeans_SIMONJENNI(X, Cinit)

% Implements the k-means algorithm

K=size(Cinit,2);            % number of mean vectors                      
C = Cinit;                          
temp=zeros(1, K);           % will store the distance of a point to each mean
A=zeros(1,size(X,2));               
while 1                                     % to achieve a do-while loop
    oldA=A;
    for i=1:size(X,2)
        for j=1:K
            temp(j)=norm(X(:,i)-C(:,j));    % distance of a point to each mean
        end
        [~,I]=min(temp);                    % selects the nearest mean-index
        A(i)=I;                             % and stores it in the label-vector
    end
    for j=1:K
        indic=(A==j);                       
        C(:,j)=1/sum(indic)*(indic*X');     % computing the mean vectors
    end
    if oldA==A                              % checks if labels have changed
        break;                              % (check for converence) 
    end
end



