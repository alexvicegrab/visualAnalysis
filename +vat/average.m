% AVERAGE Mean value (ignores NaN values)
% average = average(mat, dim)
%   mat   = matrix to average
%   dim   = dimension along which to average [default = 1]
function average = average(mat, dim)

if nargin < 2
    dim = 1;
end

notNan = ~isnan(mat);

% Set NaNs to 0
mat(~notNan) = 0;

% Count up non-NaNs
nanNumber = sum(notNan, dim);

% Avoid infinite values
nanNumber(nanNumber==0) = NaN; 

% Sum up non-NaNs, and divide by the number of non-NaNs.
average = sum(mat, dim) ./ nanNumber;



