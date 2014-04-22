% READVIDEO Read the video Object
% obj = obj.readVideo;
function obj = readVideo(obj)

if isempty(which('mmread.m'))
    % If MMread cannot be found, give up and use VideoReader
    obj.videoMat = read(obj.VideoObject, ...
        [obj.chunksVideo{obj.chunkCurrent}(1) ...   % Start frame
        obj.chunksVideo{obj.chunkCurrent}(end)]);   % End frame
else
    % MMread toolbox is typically faster and more robust
    video = mmread(obj.dataFN, ...
        obj.chunksVideo{obj.chunkCurrent}(1) : ...  % Start frame
        obj.chunksVideo{obj.chunkCurrent}(end));    % End frame
    
    obj.videoMat = cat(4, video.frames.cdata);
end

obj.width = size(obj.videoMat, 1);
obj.height = size(obj.videoMat, 2);
obj.frames = size(obj.videoMat, 4);

end
