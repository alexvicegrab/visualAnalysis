function obj = plot(obj, frame)
% PLOT Display graph of FFT plots
% obj = plot(obj, frame)
%   frame   = which frame of the FFTmat object do we wish to display?

if isempty(obj.figHandle)
    obj.figHandle = figure;
else
    figure(obj.figHandle);
end

colormap('gray')

imagesc( obj.opticFlow(:,:,frame) )
axis equal off
title('Optic Flow')

end

