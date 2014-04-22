classdef LABmat < vat.method
    %LABMAT Handles data converted into the LAB colourspace
    %
    %   Properties:
    % L = Luminance
    % A = Red-Green channel
    % B = Yellow-Blue channel
    
    properties (SetAccess='private')
        L
        A
        B
    end
    
    properties (Hidden)
        colorTransform  % colorTransform into LAB colorspace
    end
    
    methods
        %% Constructor method
        function obj = LABmat(stream)
            obj.description = 'LAB (Luminance, A [Red Green], B [Yellow Blue]) colourspace';
            
            % Set up the matrices...
            obj.L = nan(stream.width, stream.height, stream.frames);
            obj.A = nan(stream.width, stream.height, stream.frames);
            obj.B = nan(stream.width, stream.height, stream.frames);
            
            % Make colour transform
            obj.colorTransform = makecform('srgb2lab');
            
        end % LABmat
        
    end
    
end

