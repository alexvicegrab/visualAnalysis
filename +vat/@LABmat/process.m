function obj = process(obj, stream, frame)

% Do colour transform
    tmp = applycform(stream.videoMat(:,:,:,frame), obj.colorTransform);
    
    % Set fields in structure
    obj.L(:,:,frame) = tmp(:,:,1);
    obj.A(:,:,frame) = tmp(:,:,2);
    obj.B(:,:,frame) = tmp(:,:,3);  

end

