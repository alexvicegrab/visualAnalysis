% VISUAL2FFT Do Fast Fourier Transform of raw data
% FFTmat = obj.visual2FFT;
function FFTmat = visual2FFT(obj)

if obj.verbose
    fprintf('\tFast Fourier Transform\n')
end

% Create FFTmat object
FFTmat = vat.FFTmat(size(obj.videoMat, 1), size(obj.videoMat, 2), size(obj.videoMat, 4));

for d = 1:size(obj.videoMat, 4);
    
    % Do fourier transform
    FFTmat = FFTmat.process(obj, d);
    
end

%% Average magnitude & phase (if necessary)
if obj.averageDecomposed    
    FFTmat = mean(FFTmat);
end

%% Save to disk?
vat.save(obj, 'videoFFT', FFTmat);

end
