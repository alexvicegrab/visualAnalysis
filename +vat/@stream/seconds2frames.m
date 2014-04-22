% SECONDS2FRAMES Derive obj framesPerChunk given a video and a # sec per Chunk
% obj = obj.seconds2frames(secondsPerChunk)
function obj = seconds2frames(obj)

obj.framesPerChunk = round(obj.secondsPerChunk * obj.VideoObject.FrameRate);

end