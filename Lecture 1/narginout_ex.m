function  [o1,o2,o3] = narginout_ex(i1,i2,i3)
fprintf('Number inputs = %i; \t',nargin);
fprintf('Number outputs = %i;\n',nargout);
o1 = i1; o2=i2; o3=i3;
end