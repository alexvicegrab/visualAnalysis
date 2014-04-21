% READVIDEO Read the video Object
% obj = obj.readVideo;
function obj = readVideo(obj)

obj.videoMat = read(obj.VideoObject, ...
    [obj.chunks{obj.chunkCurrent}(1) ... % Start frame
    obj.chunks{obj.chunkCurrent}(end)]); % End frame

end
