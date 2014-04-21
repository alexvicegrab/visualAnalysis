% SAVE Gets input names and assigns variables to input names
% obj = obj.save(folderName, varargin)
%   folderName  = name of subjfolder into which to save results
%   varargin    = variables to save
function save(obj, folderName, varargin)

%% Save to disk?
if obj.saveToDisk
    
    variableNames = cell(size(varargin));
    for v = 1:length(varargin)
        variableNames{v} = inputname(v + 2);
        eval([variableNames{v} ' = varargin{v};'])
        % Clear data in varargin
        varargin{v} = [];
    end
    
    if ~exist(fullfile(obj.analysisDir, folderName), 'dir'), mkdir(fullfile(obj.analysisDir, folderName)); end
    
    savePath = fullfile(obj.analysisDir, folderName, sprintf('chunk_%04d.mat', obj.chunkCurrent));
    if ~exist(savePath, 'file')
        save(savePath, variableNames{:})
    end
end