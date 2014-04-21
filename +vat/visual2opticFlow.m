% VISUAL2OPTICFLOW Transform raw RGB data into LAB colourspace
% OFmat = obj.visual2motion;
function OFmat = visual2opticFlow(obj)

if obj.verbose
    fprintf('\tDetecting Optic Flow in chunk\n')
end

OFmat = vat.OFmat(size(obj.videoMat, 1), size(obj.videoMat, 2), size(obj.videoMat, 4));

% For each frame, detect object
for d = 1:size(obj.videoMat, 4);
    OFmat = OFmat.process(obj, d);
end

%% Average magnitude & phase (if necessary)
if obj.averageDecomposed  
    OFmat = mean(OFmat);
end

%% Save to disk?
vat.save(obj, 'videoOpticFlow', OFmat);
