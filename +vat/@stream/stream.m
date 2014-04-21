classdef stream
    % STREAM Constructs the vat (Visual Analysis Toolbox) data object
    %
    %   Takes in a set of properties, user changeable ones include:
    % dataFN                Location of image folder or video(s) to decompose
    % analysisDir           Location of saved analysis
    % framesPerChunk        Frames per chunk in a video [default: 1]
    % saveToDisk            Do we save output to disk?
    % averageDecomposed     Average frames in a video
    % parallelAnalysis      Parallelise analysis using matlab parfor
    % verbose               Verbose output or not?
    
    properties
        dataFN
        analysisDir
        framesPerChunk      = 1;
        saveToDisk          = true;
        averageDecomposed   = true;
        parallelAnalysis    = false;
        verbose             = false;
    end
    
    properties (SetAccess='private')
        chunks = {};                % Store an array of video chunks
        VideoObject                 % VideoReader object
        videoMat                    % Current video Matrix to be processed
        chunkCurrent = 0;           % Current chunk
    end
    
    methods
        %% Constructor method
        function obj = stream(varargin)
            % Construct our object
            fieldNames = fieldnames(obj);
            
            % Parse options
            for f=1:2:length(varargin)
                if ismember(varargin{f}, fieldNames)
                    obj.(varargin{f}) = varargin{f+1};
                else
                    error('Unrecognized fieldname %s',varargin{f});
                end
            end
        end % stream
    end % methods
end % classdef

