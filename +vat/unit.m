function vatObj = unit(videoFileName)
% Basic unit-test for Visual Analysis Toolbox

tic
%% Create object and read video
vatObj = vat.constructor;
%vatObj.saveToDisk = false;

[Vpth, Vfn] = fileparts(videoFileName);

vatObj.dataFN = videoFileName;
vatObj.analysisDir = fullfile(Vpth, Vfn);

vatObj = vatObj.openVideo;
vatObj = vatObj.seconds2frames(1.8);

% Set current chunk [Not fully elegant, might break parfor?]
vatObj.chunkCurrent = 1;

vatObj = vatObj.readVideo;

% Graph
figure(2)

subplot(2,3,1)
imagesc(uint8(mean(vatObj.videoMat, 4)));
axis equal off

%% Do FFT analysis
FFTmat = vat.visual2FFT(vatObj);

% Graph
subplot(2,3,2)
imagesc(FFTmat.magnitude)
axis equal off

subplot(2,3,3)
imagesc(FFTmat.phase)
axis equal off

% TODO: convert FFTmat.magnitude & .phase back into an image...

toc