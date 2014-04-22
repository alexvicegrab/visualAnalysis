function audioMat = process(audioMat, stream)

audioMat.console(stream);

% Split audio into left and right stream
audioMat.rawL    = stream.audioMat(:,1);
audioMat.rawR    = stream.audioMat(:,2);

if ~isempty(audioMat.filter)
    audioMat.rawL = filter(audioMat.filter, audioMat.rawL);
    audioMat.rawR = filter(audioMat.filter, audioMat.rawR);
end

% For each frame, detect object
audioMat.fftL    = fft(audioMat.rawL, audioMat.NFFT) ...
    ./ double(stream.samplesPerChunk);
audioMat.fftR    = fft(audioMat.rawR, audioMat.NFFT) ...
    ./ double(stream.samplesPerChunk);

%% Average magnitude & phase (if necessary)
%{
if stream.averageDecomposed
    audioMat = mean(audioMat);
end
%}

%% Save to disk?
vat.save(stream, 'audioMat', audioMat);

end
