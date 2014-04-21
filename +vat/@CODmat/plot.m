function obj = plot(obj, stream, frame)
% PLOT Display graph of FFT plots
% obj = plot(obj, frame)
%   frame   = which frame of the FFTmat object do we wish to display?

% Initialise videoPlayer object if needed...
if isempty(obj.videoPlayer)
    obj.videoPlayer  = vision.VideoPlayer(...
        'Position', [300 300 size(stream.videoMat, 2)+30 size(stream.videoMat, 1) + 30]);
end

videoOut = stream.videoMat(:,:,:,frame);

% For each frame, detect object
for f = 1:length(obj.usedDetectors)
    
    % Draw the returned bounding box around the detected face.
    videoOut = insertObjectAnnotation(videoOut, ...
        'rectangle', obj.(obj.usedDetectors{f}).box{frame}, ...
        obj.usedDetectors{f}, ...
        'Color', obj.(obj.usedDetectors{f}).color);
    
end

% Display the annotated video frame using the video player object
step(obj.videoPlayer, videoOut);
pause(0.01)

end

