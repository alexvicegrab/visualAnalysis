% READVIDEO Read the video Object
% obj = obj.readVideo;
function obj = readVideo(obj)

obj.videoMat = read(obj.VideoObject, ...
    [obj.chunksVideo{obj.chunkCurrent}(1) ... % Start frame
    obj.chunksVideo{obj.chunkCurrent}(end)]); % End frame

end
