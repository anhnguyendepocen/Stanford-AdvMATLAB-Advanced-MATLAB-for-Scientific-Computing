% Lecture 1, Variable number if inputs and outputs

function res = Lecture1_find_mean(type, varargin)

num_args = length(varargin);

if type=='A'
    res = mean([varargin{:}]);
elseif type=='G'
    res = prod([varargin{:}])^(1/num_args);
end    