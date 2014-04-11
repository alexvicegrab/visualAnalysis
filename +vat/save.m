function save(obj, folderName, varargin)
% Save method that gets input names and assigns variables to input names

%% Save to disk?
if obj.saveToDisk
    
    variableNames = cell(size(varargin));
    for v = 1:length(varargin)
        variableNames{v} = inputname(v + 2);
        eval([variableNames{v} ' = varargin{v};'])
        % Clear data in varargin
        varargin{v} = [];
    end
    
    if ~exist(obj.analysisDir, 'dir'), mkdir(fullfile(obj.analysisDir, folderName)); end
    
    savePath = fullfile(obj.analysisDir, folderName, sprintf('chunk_%04d.mat', obj.chunkCurrent));
    if ~exist(savePath, 'file')
        save(savePath, variableNames{:})
    end
end