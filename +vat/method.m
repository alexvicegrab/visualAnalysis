classdef method < handle
    %METHOD Abstract class 
    %
    % Necessary properties and methods in any methods class
    
    properties (SetAccess='protected')
        figHandle   % Figure handle for plotting
    end
    
    methods (Static)
        %% Constructor method
        function mean(~)
            error('The mean method has not been implemented yet')
        end
        
        function plot(~)
            error('The plot method has not been implemented yet')
        end
        
        function process(~)
            error('The process method has not been implemented yet')
        end
        
        function aggregate(~)
            error('The aggregate method has not been implemented yet')
        end
        
        function similarity(~)
            error('The similarity method has not been implemented yet')
        end
        
    end
    
end

