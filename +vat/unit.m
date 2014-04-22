% UNIT Basic unit-test for Visual Analysis Toolbox
% vat.unit(videoFileName)
%   videoFileName   = Filename of video to analyse
function vatObj = unit(videoFileName)

close all

tic

%% Create object and read video
vatObj = vat.stream;
%vatObj.saveToDisk = false;

[Vpth, Vfn] = fileparts(videoFileName);

vatObj.dataFN = videoFileName;
vatObj.analysisDir = fullfile(Vpth, Vfn);
vatObj = vatObj.setSecondsPerChunk(1.8);
% Set current chunk [Not fully elegant, might break parfor?]
vatObj = vatObj.setChunk(49);

% Get data
vatObj = vatObj.openVideo;
vatObj = vatObj.openAudio;

vatObj = vatObj.readVideo;
vatObj = vatObj.readAudio;

% Average images
RGBmean = uint8(mean(vatObj.videoMat, 4));
BWmean = rgb2gray(RGBmean);

%% Do audio analysis
audioMat = vat.audioMat(vatObj);
audioMat = audioMat.process(vatObj);

plot(audioMat);

toc

%% Do FFT analysis
FFTmat = vat.FFTmat(vatObj);
FFTmat = FFTmat.process(vatObj);

plot(FFTmat, 1);

toc

%% Do LAB analysis
LABmat = vat.LABmat(vatObj);
LABmat = LABmat.process(vatObj);

plot(LABmat, 1);

toc

%% Do Optic Flow analysis
OFmat = vat.OFmat(vatObj);
OFmat = OFmat.process(vatObj);

plot(OFmat, 1);

toc

%% Do object detection
CODmat = vat.CODmat;
CODmat = CODmat.process(vatObj);

% Movie...
for d = 1:size(vatObj.videoMat, 4)
    plot(CODmat, vatObj, d);
end

toc
