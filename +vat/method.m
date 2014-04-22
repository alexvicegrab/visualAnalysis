classdef method < handle
    %METHOD Abstract class 
    %
    % Necessary properties and methods in any methods class
    
    properties (SetAccess='protected')
        figHandle   % Figure handle for plotting
    end
    
    methods
       function obj = plot(obj)
            if isempty(obj.figHandle)
                obj.figHandle = figure;
            else
                figure(obj.figHandle);
            end
        end 
    end    
    
    methods (Abstract = true)
        % Methods that should be implemented by the sub-classes        
        process(obj)
        
        %{
        mean(obj)
        
        aggregate(obj)
        
        similarity(obj)
        %}
        
    end
    
end

