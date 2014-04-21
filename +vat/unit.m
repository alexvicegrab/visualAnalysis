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

vatObj = vatObj.openVideo;
vatObj = vatObj.seconds2frames(1.8);

% Set current chunk [Not fully elegant, might break parfor?]
vatObj = vatObj.setChunk(1);

vatObj = vatObj.readVideo;

%% Do FFT analysis
FFTmat = vat.visual2FFT(vatObj);

% Graph
h = figure;
colormap('gray')

subplot(2,2,1)
imagesc(uint8(mean(mean(vatObj.videoMat, 4),3)));
axis equal off
title('Average image')

subplot(2,2,2)
imagesc(log(FFTmat.magnitude))
axis equal off
title('FFT magnitude (log)')

subplot(2,2,3)
imagesc(FFTmat.phase)
axis equal off
title('FFT phase')

subplot(2,2,4)
imagesc(real(ifft2(fftshift(FFTmat.magnitude.*(cos(FFTmat.phase) + 1i*sin(FFTmat.phase))))))
axis equal off
title('Average FFT magnitude and phase transformed back to image')

%% DO LAB analysis
LABmat = vat.visual2LAB(vatObj);

% Graph
h = figure;
colormap('gray')

subplot(2,2,1)
imagesc(uint8(mean(vatObj.videoMat, 4)));
axis equal off
title('Average image')

subplot(2,2,2)
imagesc(LABmat.L)
axis equal off
title('Luminance')

subplot(2,2,3)
imagesc(LABmat.A)
axis equal off
title('Red-Green channel (A)')

subplot(2,2,4)
imagesc(LABmat.B)
axis equal off
title('Yellow-Blue channel (B)')

toc