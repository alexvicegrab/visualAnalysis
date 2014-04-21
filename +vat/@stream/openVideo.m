% OPENVIDEO Open video using VideoReader
% obj = obj.openVideo;
function obj = openVideo(obj)

obj = validate(obj);
obj.VideoObject = VideoReader(obj.dataFN);

% Call video2chunks by default
obj = obj.video2chunks;

end
