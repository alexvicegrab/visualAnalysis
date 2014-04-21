% SECONDS2FRAMES Derive obj framesPerChunk given a video and a # sec per Chunk
% obj = obj.seconds2frames(secondsPerChunk)
%   secondsPerChunk    = Number of seconds constituting a chunk
function obj = seconds2frames(obj, secondsPerChunk)

obj.framesPerChunk = round(secondsPerChunk * obj.VideoObject.FrameRate);

% Call video2chunks by default to "rechunk"
obj = obj.video2chunks;

end