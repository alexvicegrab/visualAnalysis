function average = average(mat, dim)
%AVERAGE Mean value (ignores NaN values)

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



