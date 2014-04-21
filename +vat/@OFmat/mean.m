function obj = mean(obj)

% Average the opticFlow
obj.opticFlow = vat.average(obj.opticFlow, 3);

end

