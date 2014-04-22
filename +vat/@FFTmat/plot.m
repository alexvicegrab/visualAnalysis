function obj = plot(obj, frame)
% PLOT Display graph of FFT plots
% obj = plot(obj, frame)
%   frame   = which frame of the FFTmat object do we wish to display?

obj = plot@vat.method(obj);

colormap('gray')

subplot(1,3,1)
imagesc( log( ...
    obj.magnitude(:,:, frame) ) )
axis equal tight off
title('FFT magnitude (log)')

subplot(1,3,2)
imagesc( obj.phase(:,:, frame) )
axis equal tight off
title('FFT phase')

subplot(1,3,3)
imagesc( ...
    real( ...
    ifft2( ...
    fftshift( obj.magnitude(:,:, frame) ...
    .* (cos(obj.phase(:,:, frame)) ...
    + 1i*sin(obj.phase(:,:, frame))) ) ) ) )
axis equal tight off
title('FFT magnitude and phase transformed back to image')

end

