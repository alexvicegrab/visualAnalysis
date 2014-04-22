function obj = plot(obj, frame)
% PLOT Display graph of FFT plots
% obj = plot(obj, frame)
%   frame   = which frame of the FFTmat object do we wish to display?

obj = plot@vat.method(obj);

colormap('gray')

imagesc( obj.opticFlow(:,:,frame) )
axis equal off
title('Optic Flow')

end

