% VIDEO2CHUNKS Split video into chunks
% obj = obj.video2chunks;
function obj = video2chunks(obj)

obj.chunks = vat.vector2chunks(...
    1:obj.VideoObject.NumberOfFrames, ...
    obj.framesPerChunk);

end
