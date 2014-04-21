function obj = mean(obj)

% Average the Luminance, Red-Green and Yellow-Blue channels
obj.L = vat.average(obj.L, 3);
obj.A = vat.average(obj.A, 3);
obj.B = vat.average(obj.B, 3);

end

