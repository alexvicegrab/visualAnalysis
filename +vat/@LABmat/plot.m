function obj = plot(obj, frame)
% PLOT Display graph of LAB plots
% obj = plot(obj, frame)
%   frame   = which frame of the LABmat object do we wish to display?

if isempty(obj.figHandle)
    obj.figHandle = figure;
else
    figure(obj.figHandle);
end

colormap('gray')

subplot(1,3,1)
imagesc( obj.L(:,:,frame) )
axis equal off
title('Luminance')

subplot(1,3,2)
imagesc( obj.A(:,:,frame) )
axis equal off
title('Red-Green channel (A)')

subplot(1,3,3)
imagesc( obj.B(:,:,frame) )
axis equal off
title('Yellow-Blue channel (B)')

end