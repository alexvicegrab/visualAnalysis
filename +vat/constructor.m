classdef constructor
    %constructor Constructs the vat (Visual Analysis Toolbox) object
    %
    %   Takes in a set of properties, two that are critical are:
    
    properties
        dataFN                          % Location of image folder or video(s) to decompose
        analysisDir                     % Location of saved analysis
        framesPerVol = 1;               % Frames per volume in a video
        saveToDisk          = true;     % Do we save output to disk?
        averageDecomposed   = true;     % Average frames in a video
        parallelAnalysis    = false;    % Parallelise analysis using matlab parfor
        verbose             = false;    % Verbose output or not?
        
        chunkCurrent = 0;               % Current chunk
        % [How to make this mostly invisible, but without it needing a setter?]
    end
    
    properties (SetAccess='private')
        chunks = {};                % Store an array of video chunks
        VideoObject                 % VideoReader object
        videoMat                    % Current video Matrix to be processed
    end
    
    methods
        %% Constructor method
        function obj = constructor(varargin)
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
        end % constructor
        
        function obj = validate(obj)
            % Check types (and force user to specify these values)
            validateattributes(obj.dataFN, ...
                {'char'}, {'nonempty'}, 'dataFN')
            validateattributes(obj.analysisDir, ...
                {'char'}, {'nonempty'}, 'analysisDir')
            validateattributes(obj.framesPerVol, ...
                {'numeric'}, {'nonempty'}, 'framesPerVol')
            validateattributes(obj.saveToDisk, ...
                {'logical'}, {'nonempty'}, 'saveToDisk')
            validateattributes(obj.averageDecomposed, ...
                {'logical'}, {'nonempty'}, 'averageDecomposed')
            validateattributes(obj.parallelAnalysis, ...
                {'logical'}, {'nonempty'}, 'parallelAnalysis')
            validateattributes(obj.verbose, ...
                {'logical'}, {'nonempty'}, 'verbose')
            
            % Set up parallel analysis
            if obj.parallelAnalysis
                try matlabpool close; catch; end
                matlabpool open local
                n = matlabpool('size');
                fprintf('We have a matlabpool of %d nodes', n);
            end
        end
        
        %% Video methods
        function obj = seconds2frames(obj, secondsPerVolume)
            % Derive obj framesPerVol given a video and a # sec per volume
            obj.framesPerVol = round(secondsPerVolume * obj.VideoObject.FrameRate);
            
            % Call video2chunks by default
            obj = obj.video2chunks;
        end
        
        function obj = openVideo(obj)
            % Open video using VideoReader
            
            obj = validate(obj);
            obj.VideoObject = VideoReader(obj.dataFN);
            
            % Call video2chunks by default
            obj = obj.video2chunks;
        end
        
        function obj = video2chunks(obj)
            % Split video into chunks
            obj.chunks = vat.vector2chunks(...
                1:obj.VideoObject.NumberOfFrames, ...
                obj.framesPerVol);
        end
        
        function obj = readVideo(obj)
            obj.videoMat = read(obj.VideoObject, ...
                [obj.chunks{obj.chunkCurrent}(1) ... % Start frame
                obj.chunks{obj.chunkCurrent}(end)]); % End frame
        end
        
    end % methods
end % classdef

