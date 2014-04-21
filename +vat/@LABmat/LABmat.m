classdef LABmat
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
        figHandle       % Figure handle for plotting
    end
    
    properties (Hidden)
        colorTransform  % colorTransform into LAB colorspace
    end
    
    methods
        %% Constructor method
        function obj = LABmat(width, height, time)
            
            % Set up the matrices...
            obj.L = nan(width, height, time);
            obj.A = nan(width, height, time);
            obj.B = nan(width, height, time);
            
            % Make colour transform
            obj.colorTransform = makecform('srgb2lab');
            
        end % LABmat
        
    end
    
end

