% VISUAL2LAB Transform raw RGB data into LAB colourspace
% LABmat = obj.visual2LAB;
function LABmat = visual2LAB(obj)

if obj.verbose
    fprintf('\tLAB (Luminance, A [Red Green], B [Yellow Blue]) colourspace\n')
end

LABmat = vat.LABmat(size(obj.videoMat, 1), size(obj.videoMat, 2), size(obj.videoMat, 4));

%% UNDER CONSTRUCTION

for d = 1:size(obj.videoMat, 4);
    LABmat = LABmat.process(obj, d);
end

%% Average magnitude & phase (if necessary)
if obj.averageDecomposed  
    LABmat = mean(LABmat);
end

%% Save to disk?
vat.save(obj, 'videoLAB', LABmat);

end
