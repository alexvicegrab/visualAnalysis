function FFTmat = process(FFTmat, stream)

if stream.verbose
    fprintf('\tFast Fourier Transform\n')
end

for f = 1:size(stream.videoMat, 4);
    % Do fourier transform and shift frequencies
    tmp = fftshift(...
        fft2(...
        rgb2gray(stream.videoMat(:,:,:,f)) ) );
    
    % Set up the matrices...
    magnitude   = abs(tmp);
    phase       = angle(tmp);
    
    % Avoid infinite values
    magnitude(~isfinite(magnitude))   = NaN;
    phase(~isfinite(phase))           = NaN;
    
    FFTmat.magnitude(:,:,f)    = magnitude;
    FFTmat.phase(:,:,f)        = phase;
    
end

%% Average magnitude & phase (if necessary)
if stream.averageDecomposed
    FFTmat = mean(FFTmat);
end

%% Save to disk?
vat.save(stream, 'videoFFT', FFTmat);

end

