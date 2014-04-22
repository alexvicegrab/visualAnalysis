% VISUAL2FFT Do Fast Fourier Transform of raw data
% FFTmat = obj.visual2FFT;
function audioMat = audio2FFT(obj)

if obj.verbose
    fprintf('\tFast Fourier Transform [audio]\n')
end

% Create FFTmat object
audioMat = vat.audioMat(obj);

% Do fourier transform
audioMat = audioMat.process(obj);

%% Average magnitude & phase (if necessary)
%{
if obj.averageDecomposed    
    audioMat = mean(audioMat);
end
%}

%% Save to disk?
vat.save(obj, 'audioFFT', audioMat);

end
