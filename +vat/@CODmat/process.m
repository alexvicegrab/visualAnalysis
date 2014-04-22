function CODmat = process(CODmat, stream)

if stream.verbose
    fprintf('\tCascade Object Detector\n')
end

% For each frame, detect objects
for f = 1:size(stream.videoMat, 4);
    % For each feature...
    for d = 1:length(CODmat.usedDetectors)
        
        CODmat.(CODmat.usedDetectors{d}).box{f} = ...
            step( ...
            CODmat.(CODmat.usedDetectors{d}).detector, ...
            stream.videoMat(:,:,:, f));
        
    end
end

%% Save to disk?
vat.save(stream, 'videoCOD', CODmat);

end
