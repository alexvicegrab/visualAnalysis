function LABmat = visual2LAB(obj)
% Transform raw RGB data into LAB colourspace
if obj.verbose
    fprintf('\tLAB (Luminance, A [Red Green], B [Yellow Blue]) colourspace\n')
end

colorTransform = makecform('srgb2lab');

LABmat = struct;
LABmat.L    = nan(size(obj.videoMat, 1), size(obj.videoMat, 2), size(obj.videoMat, 4));
LABmat.A    = nan(size(obj.videoMat, 1), size(obj.videoMat, 2), size(obj.videoMat, 4));
LABmat.B    = nan(size(obj.videoMat, 1), size(obj.videoMat, 2), size(obj.videoMat, 4));

%% UNDER CONSTRUCTION

for d = 1:size(obj.videoMat, 4);
    % Do fourier transform and shift frequencies
    tmp = applycform(obj.videoMat(:,:,:,d), colorTransform);
    
    % Set fields in structure
    LABmat.L(:,:,d) = tmp(:,:,1);
    LABmat.A(:,:,d) = tmp(:,:,2);
    LABmat.B(:,:,d) = tmp(:,:,3);    
end

%% Average magnitude & phase (if necessary)
if obj.averageDecomposed    
    LABmat.L = vat.average(LABmat.L, 3);
    LABmat.A = vat.average(LABmat.A, 3);
    LABmat.B = vat.average(LABmat.B, 3);
end

%% Save to disk?
vat.save(obj, 'videoLAB', LABmat);
