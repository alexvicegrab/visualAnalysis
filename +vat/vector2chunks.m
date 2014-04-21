% VECTOR2CHUNKS splits a vector into several chunks
% chunks = vector2chunks(vector, chunkSize)
%   vector        = vector of numbers to be chunked
%   chunkSize     = size of each chunk

function chunks = vector2chunks(vector, chunkSize)

vectorInd = 1:length(vector);

chunkNum = ceil(vectorInd/chunkSize);

chunks = cell(1, chunkNum(end));

for a = 1:chunkNum(end)
   chunks{a} = vector(chunkNum == a);
end        
        