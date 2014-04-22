% OPENVIDEO Open audio using AudioInfo
% obj = obj.openAudio;
function obj = openAudio(obj)

obj = validate(obj);

obj.AudioInfo = audioinfo(obj.dataFN);

% Call audio2chunks by default
obj = obj.audio2chunks;

end
