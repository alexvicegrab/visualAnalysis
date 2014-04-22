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
vatObj = vatObj.setChunk(2);

% Get data
vatObj = vatObj.openVideo;
vatObj = vatObj.openAudio;

vatObj = vatObj.readVideo;
vatObj = vatObj.readAudio;

% Average images
RGBmean = uint8(mean(vatObj.videoMat, 4));
BWmean = rgb2gray(RGBmean);

%% Do audio analysis
audioMat = vat.audio2FFT(vatObj);

plot(audioMat);

toc

%% Do FFT analysis
FFTmat = vat.visual2FFT(vatObj);

plot(FFTmat, 1);

toc

%% Do LAB analysis
LABmat = vat.visual2LAB(vatObj);

plot(LABmat, 1);

toc

%% Do Optic Flow analysis
OFmat = vat.visual2OF(vatObj);

plot(OFmat, 1);

toc

%% Do object detection

CODmat = vat.visual2COD(vatObj);

% Movie...
for d = 1:size(vatObj.videoMat, 4)
    plot(CODmat, vatObj, d);
end

toc
