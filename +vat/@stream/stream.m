classdef stream
    % STREAM Constructs the vat (Visual Analysis Toolbox) data object
    %
    %   Takes in a set of properties, user changeable ones include:
    % dataFN                Location of image folder or video(s) to decompose
    % analysisDir           Location of saved analysis
    % framesPerChunk        Frames per chunk in video [default: 1]
    % samplesPerChunk       Samples per chunk in audio 
    % saveToDisk            Do we save output to disk?
    % averageDecomposed     Average frames in a video
    % parallelAnalysis      Parallelise analysis using matlab parfor
    % verbose               Verbose output or not?
    %
    % secondsPerChunk       Seconds per chunk in video-audio
    %                       [only settable though setSecondsPerChunk]
    
    properties
        dataFN
        analysisDir
        framesPerChunk      = 1;
        samplesPerChunk     
        saveToDisk          = true;
        averageDecomposed   = true;
        parallelAnalysis    = false;
        verbose             = false;
    end
    
    properties (SetAccess='private')
        secondsPerChunk
                
        chunksVideo = {};           % Store an array of video chunks
        chunksAudio = {};           % Store an array of audio chunks
        AudioInfo                   % AudioInfo structure
        VideoObject                 % VideoReader object
        videoMat                    % Current video matrix to be processed
        audioMat                    % Current audio vector to be processed
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

