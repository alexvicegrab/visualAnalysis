% READAUDIO Read the audio Object
% obj = obj.readAudio;
function obj = readAudio(obj)

obj.audioMat = audioread(obj.dataFN, ...
    [obj.chunksAudio{obj.chunkCurrent}(1) ... % Start frame
    obj.chunksAudio{obj.chunkCurrent}(end)]); % End frame

end
