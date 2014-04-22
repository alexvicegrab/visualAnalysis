classdef audioMat < vat.method
    %AUDIOMAT Handles data processed for audio
    %
    %   Properties:
    % NFFT          = Number for FFT components
    % filterName    = filter of "fdesign.audioweighting" type to apply
    
    properties
        filterName = 'ITUR4684'     % Default filter adapted to human hearing
    end
    
    properties (SetAccess='private')
        NFFT
        sampleRate
        frequencyRange
        filter
        
        rawL
        rawR
        
        fftL
        fftR
    end
    
    methods
        %% Constructor method
        function obj = audioMat(stream, filterName)
            obj.description = 'Fast Fourier Transform (audio)';
            
            if nargin > 1
                obj.filter = filterName;
            end
            obj.NFFT = double(2^nextpow2(stream.samplesPerChunk));
            obj.sampleRate = stream.AudioInfo.SampleRate;
            obj.frequencyRange = obj.sampleRate / 2 * linspace(0, 1, obj.NFFT/2+1);
            
            if ~isempty(obj.filterName)
                % Default filter
                filtDes = fdesign.audioweighting('WT', obj.filterName, obj.sampleRate);
                obj.filter = design(filtDes);
            end
            
        end % audioMat
    end % methods
end % classdef
