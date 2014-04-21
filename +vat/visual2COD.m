% VISUAL2COD Detect objects in raw data using "Cascade Object Detector"
% CODmat = obj.visual2COD;
function CODmat = visual2COD(obj)

if obj.verbose
    fprintf('\tCascade Object Detector\n')
end

CODmat = vat.CODmat;

% For each frame, detect objects
for d = 1:size(obj.videoMat, 4);
    CODmat.process(obj, d);
end

%% Save to disk?
vat.save(obj, 'videoCOD', CODmat);

end