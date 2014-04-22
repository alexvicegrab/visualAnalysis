classdef OFmat < vat.method
    %OFMAT Handles data converted into Optic Flow
    %
    %   Properties (derived from Real and Imaginary FFT components of a matrix "X"):
    % opticFlow = pixel-wise Optic Flow relative to previous frame
    
    properties (SetAccess='private')
        opticFlow
    end
    
    properties (Hidden)
      detectorOpticFlow             % Optical flow object
    end
    
    methods
        %% Constructor method
        function obj = OFmat(stream)
            
            % Set up detector
            obj.detectorOpticFlow = vision.OpticalFlow( ...
        'ReferenceFrameSource','Input port');
            
            % Set up empty matrices...
            obj.opticFlow = nan(stream.width, stream.height, stream.frames);
            
        end % OFmat
        
    end
    
end

