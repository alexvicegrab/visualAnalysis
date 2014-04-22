% READVIDEO Read the video Object
% obj = obj.readVideo;
function obj = readVideo(obj)

obj.videoMat = read(obj.VideoObject, ...
    [obj.chunksVideo{obj.chunkCurrent}(1) ... % Start frame
    obj.chunksVideo{obj.chunkCurrent}(end)]); % End frame

obj.width = size(obj.videoMat, 1);
obj.height = size(obj.videoMat, 2);
obj.frames = size(obj.videoMat, 4);

end
