% VIDEO2CHUNKS Split video into chunks
% obj = obj.video2chunks;
function obj = video2chunks(obj)

if ~isempty(obj.secondsPerChunk)
    obj = obj.seconds2frames;
end

obj.chunksVideo = vat.vector2chunks(...
    obj.VideoObject.NumberOfFrames, ...
    obj.framesPerChunk);

end
