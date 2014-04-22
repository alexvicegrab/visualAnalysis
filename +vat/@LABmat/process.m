function LABmat = process(LABmat, stream)

if stream.verbose
    fprintf('\tLAB (Luminance, A [Red Green], B [Yellow Blue]) colourspace\n')
end

for f = 1:size(stream.videoMat, 4);
    % Do colour transform
    tmp = applycform(stream.videoMat(:,:,:,f), LABmat.colorTransform);
    
    % Set fields in structure
    LABmat.L(:,:,f) = tmp(:,:,1);
    LABmat.A(:,:,f) = tmp(:,:,2);
    LABmat.B(:,:,f) = tmp(:,:,3);
end

%% Average magnitude & phase (if necessary)
if stream.averageDecomposed  
    LABmat = mean(LABmat);
end

%% Save to disk?
vat.save(stream, 'videoLAB', LABmat);

end

