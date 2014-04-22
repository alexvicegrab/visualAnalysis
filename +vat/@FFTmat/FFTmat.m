classdef FFTmat < vat.method
    %FFTMAT Handles data converted into Fast Fourier Transform
    %
    %   Properties (derived from Real and Imaginary FFT components of a matrix "X"):
    % magnitude = sqrt(real(X).^2 + imag(X).^2)
    % angle     = atan2(imag(X), real(X))
    
    properties (SetAccess='private')
        magnitude
        phase
    end
    
    methods
        %% Constructor method
        function obj = FFTmat(stream)
            obj.description = 'Fast Fourier Transform';
            
            % Set up empty matrices...
            obj.magnitude = nan(stream.width, stream.height, stream.frames);
            obj.phase = nan(stream.width, stream.height, stream.frames);
            
        end % FFTmat
        
    end
    
end

