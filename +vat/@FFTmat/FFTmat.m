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
        function obj = FFTmat(width, height, time)
            
            % Set up empty matrices...
            obj.magnitude = nan(width, height, time);
            obj.phase = nan(width, height, time);
            
        end % FFTmat
        
    end
    
end

