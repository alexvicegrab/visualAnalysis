% VISUAL2COD Detect objects in raw data using "Cascade Object Detector"
% CODbox = obj.visual2COD;
function CODbox = visual2COD(obj)

if obj.verbose
    fprintf('\tCascade Object Detector\n')
end

CODbox = struct;

% For each feature...
for f = 1:size(obj.featuresCascadeObjectDetector, 1)
    % Initialise detector object
    if ~isfield(obj.detectorCascadeObjectDetector, obj.featuresCascadeObjectDetector{f,1})
        obj.detectorOpticFlow.(obj.featuresCascadeObjectDetector{f,1}) = ...
            vision.CascadeObjectDetector(obj.featuresCascadeObjectDetector{f,1});
    end
    
    % For each frame, detect objects
    for d = 1:size(obj.videoMat, 4);
        CODbox(d).(obj.featuresCascadeObjectDetector{f, 1}) = ...
            step( ...
            obj.detectorOpticFlow.(obj.featuresCascadeObjectDetector{f,1}), ...
            obj.videoMat(:,:,:,d));
    end
end

%% Save to disk?
vat.save(obj, 'videoCOD', CODbox);

end