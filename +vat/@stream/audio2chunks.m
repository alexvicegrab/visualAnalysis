% AUDIO2CHUNKS Split video into chunks
% obj = obj.audio2chunks;
function obj = audio2chunks(obj)

% Derive seconds per chunk from video info, then multiply time by sample rate
obj.samplesPerChunk = ...
    int32(obj.AudioInfo.SampleRate * obj.framesPerChunk / obj.VideoObject.FrameRate);

obj.chunksAudio = vat.vector2chunks(...
    obj.AudioInfo.TotalSamples, ...
    obj.samplesPerChunk);

end
