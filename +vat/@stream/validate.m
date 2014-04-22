% VALIDATE Check vat.stream object property types
% obj = obj.validate;
function obj = validate(obj)

validateattributes(obj.dataFN, ...
    {'char'}, {'nonempty'}, 'dataFN')
validateattributes(obj.analysisDir, ...
    {'char'}, {'nonempty'}, 'analysisDir')
validateattributes(obj.framesPerChunk, ...
    {'numeric'}, {}, 'framesPerChunk')
validateattributes(obj.samplesPerChunk, ...
    {'numeric'}, {}, 'samplesPerChunk')
validateattributes(obj.framesPerChunk, ...
    {'numeric'}, {}, 'secondsPerChunk')
validateattributes(obj.saveToDisk, ...
    {'logical'}, {'nonempty'}, 'saveToDisk')
validateattributes(obj.averageDecomposed, ...
    {'logical'}, {'nonempty'}, 'averageDecomposed')
validateattributes(obj.parallelAnalysis, ...
    {'logical'}, {'nonempty'}, 'parallelAnalysis')
validateattributes(obj.verbose, ...
    {'logical'}, {'nonempty'}, 'verbose')

% Set up parallel analysis
if obj.parallelAnalysis
    try matlabpool close; catch; end
    matlabpool open local
    n = matlabpool('size');
    fprintf('We have a matlabpool of %d nodes', n);
end

end