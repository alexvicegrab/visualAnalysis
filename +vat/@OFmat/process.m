function OFmat = process(OFmat, stream)

if stream.verbose
    fprintf('\tDetecting Optic Flow in chunk\n')
end

% For each frame detect object
for f = 1:size(stream.videoMat, 4);
    if f == 1
        % Get extraFrame in case that the current chunk is not the first...
        if stream.chunkCurrent > 1
            extraFrame = read(stream.VideoObject, ...
                [stream.chunksVideo{stream.chunkCurrent}(1) - 1 ... % Start f
                stream.chunksVideo{stream.chunkCurrent}(1) - 1]); % End f
            
            OFmat.opticFlow(:,:,f) = step(OFmat.detectorOpticFlow, ...
                double(rgb2gray(extraFrame)), ...
                double(rgb2gray(stream.videoMat(:,:,:,f))));
        else
            % Do nothing if the current chunk is the first...
        end
    else
        OFmat.opticFlow(:,:,f) = step(OFmat.detectorOpticFlow, ...
            double(rgb2gray(stream.videoMat(:,:,:,f-1))), ...
            double(rgb2gray(stream.videoMat(:,:,:,f))));
    end
end

%% Average magnitude & phase (if necessary)
if stream.averageDecomposed  
    OFmat = mean(OFmat);
end

%% Save to disk?
vat.save(stream, 'videoOpticFlow', OFmat);

end

