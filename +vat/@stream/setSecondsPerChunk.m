% SECONDSPERCHUNK Set a # sec per Chunk
% obj = obj.setSecondsPerChunk(secondsPerChunk)
function obj = setSecondsPerChunk(obj, secondsPerChunk)

obj.secondsPerChunk = secondsPerChunk;

% Must un-set framesPerChunk to avoid conflicts
obj.framesPerChunk = [];

end