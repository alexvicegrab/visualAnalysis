% VECTOR2CHUNKS splits a vector into several chunks
% chunks = vector2chunks(sampleNumber, samplesPerChunk)
%   sampleNumber        = length of vector to be chunked
%   samplesPerChunk     = size of each chunk

function chunks = vector2chunks(sampleNumber, samplesPerChunk)

block = 1 : samplesPerChunk : sampleNumber;

chunks = cell(1,length(block));

for c = 1:length(chunks)
   chunks{c} = int32([block(c) (block(c) + samplesPerChunk - 1)]); 
end

% Final chunk is the final sample
chunks{end}(2) = sampleNumber;

end
