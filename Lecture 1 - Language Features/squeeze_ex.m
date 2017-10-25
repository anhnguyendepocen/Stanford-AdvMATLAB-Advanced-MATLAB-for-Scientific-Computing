function [] = squeeze_ex()

% squeeze example
A = rand(5,5,10);
b = rand(5,1);
c = rand(10,1);

A1 = A(:,:,2);
size(A1)
A1*b

A2 = A(2,:,:);
size(A2)
A2*c

A3 = squeeze(A2); %remove singleton first dimension
size(A3)

A3*c

end