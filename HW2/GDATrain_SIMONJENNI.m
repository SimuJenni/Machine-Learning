function [phi, mu0, mu1, Sigma] = GDATrain_SIMONJENNI( DataTrain, LabelsTrain )

% Learns the parameters of a multivariate normal distribution

dim = size(DataTrain,2);                
M = size(DataTrain,1);                  % amount of training data
Y = LabelsTrain > 0;                    % Converting Labels to {0,1}. Gives a vector with entries 1{y(i)=1}
Yzero = ~Y;                             % Gives a vector with entries 1{y(i)=0}
X = DataTrain';

phi = 1/M*sum(Y,2);                     % computing phi
mu0 = (Yzero*DataTrain)'/sum(Yzero,2);  % computing mu0
mu1 = (Y*DataTrain)'/sum(Y,2);          % computing mu1
DifXmu = X-(mu1*Y+mu0*Yzero);           % Gives matrix with rows x(i)-mu(y(i))
Sigma = 1/M*(DifXmu*DifXmu');           % computing Sigma


end

