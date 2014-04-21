% VISUAL2FFT Do Fast Fourier Transform of raw data
% FFTmat = obj.visual2FFT;
function FFTmat = visual2FFT(obj)

if obj.verbose
    fprintf('\tFast Fourier Transform\n')
end

FFTmat = struct;
FFTmat.magnitude = nan(size(obj.videoMat, 1), size(obj.videoMat, 2), size(obj.videoMat, 4));
FFTmat.phase     = nan(size(obj.videoMat, 1), size(obj.videoMat, 2), size(obj.videoMat, 4));

for d = 1:size(obj.videoMat, 4);
    % Do fourier transform and shift frequencies
    tmp = fftshift(...
        fft2(...
        mean(obj.videoMat(:,:,:,d), 3) ) );
    
    % Magnitude
    FFTmat.magnitude(:,:,d) = abs(tmp);
    % Phase
    FFTmat.phase(:,:,d)     = angle(tmp);
end

% Avoid infinite values
FFTmat.magnitude(~isfinite(FFTmat.magnitude))   = NaN;
FFTmat.phase(~isfinite(FFTmat.phase))           = NaN;

%% Average magnitude & phase (if necessary)
if obj.averageDecomposed    
    FFTmat.magnitude = vat.average(FFTmat.magnitude, 3);
    FFTmat.phase     = circ_mean(FFTmat.phase, [], 3);
end

%% Save to disk?
vat.save(obj, 'videoFFT', FFTmat);
