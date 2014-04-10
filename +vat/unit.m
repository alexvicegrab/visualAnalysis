function vatObj = unit(videoFileName)
% Basic unit-test for Visual Analysis Toolbox

vatObj = vat.constructor;

[Vpth, Vfn] = fileparts(videoFileName);

vatObj.dataFN = videoFileName;
vatObj.analysisDir = fullfile(Vpth, Vfn);

vatObj = vatObj.openVideo;
vatObj = vatObj.seconds2frames(1.8);

videoMat = vatObj.readVideo(1);

figure(2)
imagesc(videoMat(:,:,:,16));
axis equal off