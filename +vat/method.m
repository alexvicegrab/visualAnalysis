classdef method < handle
    %METHOD Abstract class 
    %
    % Necessary properties and methods in any methods class
    
    properties (SetAccess='protected')
        figHandle   % Figure handle for plotting
    end
    
    methods (Abstract = true)
        % Methods that should be implemented by the sub-classes
        
        process(obj)
        
        plot(obj)
        
        %{
        mean(obj)
        
        aggregate(obj)
        
        similarity(obj)
        %}
        
    end
    
end

