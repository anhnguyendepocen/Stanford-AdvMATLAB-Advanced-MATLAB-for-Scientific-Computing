% Lecture 1, numeric arrays, Pascal Triangle
n=100;
A = zeros(n);

% Rowwise Pascal Triangle
tic;
A(1,1) = 1;
for i = 2:n
    for j=1:n
        if j==1
            A(i,j) = 1;
        else
            A(i, j) = A(i-1, j-1) + A(i-1, j);
        end
    end
end
toc

% Columnwise
A = zeros(n);
tic;
A(:,1) = 1;
for i = 2:n
    for j=2:n
        A(j, i) = A(j-1, i-1) + A(j-1, i);
    end
end
toc

% Find difference between sum of odd and even entries
row_n = A(n,:);
diff = sum(mod(row_n,2)==1) - sum(mod(row_n,2)==0)


