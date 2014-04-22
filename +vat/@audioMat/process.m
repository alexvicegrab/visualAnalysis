function obj = process(obj, stream)

% Split audio into left and right stream
obj.rawL    = stream.audioMat(:,1);
obj.rawR    = stream.audioMat(:,2);

if ~isempty(obj.filter)
    obj.rawL = filter(obj.filter, obj.rawL);
    obj.rawR = filter(obj.filter, obj.rawR);
end

% For each frame, detect object
obj.fftL    = fft(obj.rawL, obj.NFFT) ...
    ./ double(stream.samplesPerChunk);
obj.fftR    = fft(obj.rawR, obj.NFFT) ...
    ./ double(stream.samplesPerChunk);

end
