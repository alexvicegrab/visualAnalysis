classdef CODmat < vat.method & dynamicprops
    %CODMAT Handles data processed through Cascade Object Detector
    %
    %   Properties are dynamic and depend on which detectors are requested
    
    
    properties
        featuresCascadeObjectDetector = ... % Features that can be detected by CascadeObjectDetector
            {'FrontalFaceCART', [0 0 0]; ...
            'FrontalFaceLBP', [0 0 0]; ...
            'UpperBody', [255 255 255]; ...
            'EyePairBig', [255 0 0]; ...
            'EyePairSmall', [255 0 0]; ...
            'LeftEye', [255 0 0]; ...
            'RightEye', [255 0 0]; ...
            'LeftEyeCART', [255 0 0]; ...
            'RightEyeCART', [255 0 0]; ...
            'ProfileFace', [0 0 0]; ...
            'Mouth', [0 255 0]; ...
            'Nose', [0 0 255]; ...
            };
    end
    
    properties (SetAccess='private')
        % Here most data properties are not defined from the start, but dynamic
        usedDetectors = {};
        
        videoPlayer % Handle for videoPlayer object, to ease plotting
    end
    
    methods
        %% Constructor method
        function obj = CODmat(varargin)
            obj.description = 'Cascade Object Detector';
            
            if isempty(varargin);
                varargin = obj.featuresCascadeObjectDetector(:, 1);
            else
                if any(~ismember(varargin, obj.featuresCascadeObjectDetector(:, 1)))
                    error(['Some of the Cascade Object Detectors you specified are not valid.\n' ...
                        'Refer to the CODmat class definition to see what detectors can be used'])
                end
            end
            
            % Set up properties dynamically...
            for v = 1:length(varargin)
                if ismember(varargin(v), obj.featuresCascadeObjectDetector(:, 1))
                    obj.addprop(varargin{v});
                    
                    % Create structure to hold data
                    obj.(varargin{v}) = struct;
                    
                    obj.(varargin{v}).detector = vision.CascadeObjectDetector(varargin{v});
                    
                    obj.(varargin{v}).color = ...
                        obj.featuresCascadeObjectDetector{ ...
                        ismember(obj.featuresCascadeObjectDetector(:, 1), varargin(v)), 2};
                    
                    obj.(varargin{v}).box = {};
                    
                    % Keep track of used properties
                    obj.usedDetectors{end + 1} = varargin{v};
                end
            end
            
        end % CODmat
    end % methods
end % classdef
