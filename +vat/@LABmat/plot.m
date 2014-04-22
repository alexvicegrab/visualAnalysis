function obj = plot(obj, frame)
% PLOT Display graph of LAB plots
% obj = plot(obj, frame)
%   frame   = which frame of the LABmat object do we wish to display?

obj = plot@vat.method(obj);

colormap('gray')

subplot(1,3,1)
imagesc( obj.L(:,:,frame) )
axis equal tight off
title('Luminance')

subplot(1,3,2)
imagesc( obj.A(:,:,frame) )
axis equal tight off
title('Red-Green channel (A)')

subplot(1,3,3)
imagesc( obj.B(:,:,frame) )
axis equal tight off
title('Yellow-Blue channel (B)')

end
