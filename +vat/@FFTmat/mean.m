function obj = mean(obj)

% Average the magnitude
obj.magnitude = vat.average(obj.magnitude, 3);
% Average the phase
obj.phase     = circ_mean(obj.phase, [], 3);

end

