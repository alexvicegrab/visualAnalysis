classdef constructor
    %CONSTRUCTOR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        dataFN % Location of image folder or video(s) to decompose
        framesPerVol = 1;
        averageDecomposed = true;
        parallelAnalysis = false;        
    end
    
    methods
        
        function obj = constructor(varargin)
            fieldNames = fieldnames(obj);
            
            % Parse options
            for f=1:2:length(varargin)
                if ismember(varargin{f}, fieldNames)
                    obj.(varargin{f}) = varargin{f+1};
                else
                    error('Unrecognized fieldname %s',varargin{f});
                end
            end
            
            % Check types (and force user to specify these values)
            validateattributes(obj.dataFN, ...
                {'char'}, {'nonempty'}, 'dataFN')
            validateattributes(obj.framesPerVol, ...
                {'numeric'}, {'nonempty'}, 'framesPerVol')
            validateattributes(obj.averageDecomposed, ...
                {'logical'}, {'nonempty'}, 'averageDecomposed')
            validateattributes(obj.parallelAnalysis, ...
                {'logical'}, {'nonempty'}, 'parallelAnalysis')
        end        
    end    
end

