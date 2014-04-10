function chunks = vector2chunks(v, num)
%% chunks = vector2chunks(v, num)
% v = vector of numbers to be chunked
% num = size of each chunk

w = 1:length(v);

x = ceil(w/num);

chunks = cell(1, x(end));

for a = 1:x(end)
   chunks{a} = v(x == a);
end        
        