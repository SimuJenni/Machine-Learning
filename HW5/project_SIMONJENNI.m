function Projected = project_SIMONJENNI(Data, Basis)
% Input 
%     Data: the data matrix, each column represents a data point.
%     Basis: the PCA basis.
%
% Output
%     Projected: the projected data.
%

Projected = Data*Basis';    % projecting is equal to multiplying with the 
                            % matrix of eigenvectors