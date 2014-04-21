function obj = process(obj, stream, frame)

% Do fourier transform and shift frequencies
tmp = fftshift(...
    fft2(...
    rgb2gray(stream.videoMat(:,:,:,frame)) ) );

% Set up the matrices...
magnitude   = abs(tmp);
phase       = angle(tmp);

% Avoid infinite values
magnitude(~isfinite(magnitude))   = NaN;
phase(~isfinite(phase))           = NaN;

obj.magnitude(:,:,frame)    = magnitude;
obj.phase(:,:,frame)        = phase;

end

