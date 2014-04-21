% VISUAL2OPTICFLOW Transform raw RGB data into LAB colourspace
% OFmat = obj.visual2motion;
function OFmat = visual2opticFlow(obj)

if isempty(obj.detectorOpticFlow)
    obj.detectorOpticFlow = vision.OpticalFlow( ...
        'ReferenceFrameSource','Input port');
end

if obj.verbose
    fprintf('\tDetecting Optic Flow in chunk\n')
end

OFmat = nan(size(obj.videoMat, 1), size(obj.videoMat, 2), size(obj.videoMat, 4));

% For each frame, detect object
for d = 1:size(obj.videoMat, 4);
    if d == 1
        % Get extraFrame in case that the current chunk is not the first...
        if obj.chunkCurrent > 1
            extraFrame = read(obj.VideoObject, ...
                [obj.chunks{obj.chunkCurrent}(1) - 1 ... % Start frame
                obj.chunks{obj.chunkCurrent}(1) - 1]); % End frame
            
            OFmat(:,:,d) = step(obj.detectorOpticFlow, ...
                double(rgb2gray(extraFrame)), ...
                double(rgb2gray(obj.videoMat(:,:,:,d))));
        else
            % Do nothing if the current chunk is the first...
        end
    else
        OFmat(:,:,d) = step(obj.detectorOpticFlow, ...
            double(rgb2gray(obj.videoMat(:,:,:,d-1))), ...
            double(rgb2gray(obj.videoMat(:,:,:,d))));
    end
end

%% Save to disk?
vat.save(obj, 'videoOpticFlow', OFmat);
