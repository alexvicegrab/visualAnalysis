function obj = plot(obj)
% PLOT Display graph of audio plots
% obj = plot(obj)

if isempty(obj.figHandle)
    obj.figHandle = figure;
else
    figure(obj.figHandle);
end

subplot(4,1,1)
plot(obj.rawL)
xlim([0 length(obj.rawL)])
H = get(gca, 'Xtick');
set(gca, 'XtickLabel', H / obj.sampleRate)
xlabel('Seconds')
title('Left audio')

subplot(4,1,2)
plot(obj.rawR)
xlim([0 length(obj.rawR)])
H = get(gca, 'Xtick');
set(gca, 'XtickLabel', H / obj.sampleRate)
xlabel('Seconds')
title('Right audio')

subplot(4,1,3)
plot(obj.frequencyRange, abs(obj.fftL(1:obj.NFFT/2 + 1)))
xlim([0 max(obj.frequencyRange)])
xlabel('Frequency (Hz)')
title('Left FFT [abs]')

subplot(4,1,4)
plot(obj.frequencyRange, abs(obj.fftR(1:obj.NFFT/2 + 1)))
xlim([0 max(obj.frequencyRange)])
xlabel('Frequency (Hz)')
title('Right FFT [abs]')

end

