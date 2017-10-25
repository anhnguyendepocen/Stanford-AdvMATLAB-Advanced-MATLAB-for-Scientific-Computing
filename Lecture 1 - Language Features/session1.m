%%
%% Numeric arrays
 % Creation
 M = reshape(linspace(11,18,8),[2,2,2])
 
 %% Linear indexing
 M(1)
 M(8)
 M(5:8)
 M([1,3,4,8])
 
 %% Indexing with arrays
 M([1,3,4,8])
 A =  [1,5,2;8,3,2;7,4,6];
 M(A)
 
 %% Component-wise indexing with arrays
 M([1,2],[2,1],[2,1])
 A1 = [2,2;2,1]; v = [2,1];
 M(A1,v,1)
 isequal(M(A1,v,1),M(vec(A1),v,1))
 
 %% Logical indexing
 P = rand(5000);
 tic; for i = 1:10, P(P<0.5); end; toc
 tic; for i = 1:10, P(find(P<0.5)); end; toc
 
 R = rand(5);
 R(R < 0.15)'
 isequal(R(R < 0.15),R(find(R<0.15)))
 
 %% Reshaping arrays
 N = rand(100,1);
 size(reshape(N,[50,2]))
 size(reshape(N,[25,2,2]))
 
 % Repeating arrays
 size(repmat(N,[4,1]))
 size(repmat(N,[4,3]))
 size(repmat(N,[4,3,2]))
 
 % Flipping arrays
 A = [1,2;3,4];
 fliplr(A)
 flipud(A)
 
 % Squeeze singleton dimensions
 A = [1,2;3,4];
 A(:,:,2) = [5,6;7,8];
 size(A(1,:,:))
 size(squeeze(A(1,:,:)))
 
 % Singleton dimension expansion
 A = rand(2); b = rand(2,1);
 bsxfun(@minus,A,b)

 
%%
%%% Cell & Cell Array

 % Creation
 c = {14, [1,2;5,10], 'hello world!'};
 cellplot(c)

 % Container vs. contents
 cell_container = c(2);
 disp(cell_container)
 disp(class(cell_container));
 
 cell_contents  = c{2};
 disp(cell_contents);
 disp(class(cell_contents));
 
 for i = c
     class(i)
 end
 
 for i = c
     class(i{1})
 end

 % Add/Delete data
 A = {};
 A{1,1} = '() vs {}'; A{2,2} = 'is important'
 A{1,1} = [] %Doesn't delete cell entries
 A(1,:) = [] % Deletes cell entries
 
 % Combine cell arrays
 A = {'cell combin','works just like'};
 B = {'numeric array combin','yes!'};
 [A,B]
 [A;B]
 
 % Comma-separated list
 pstr={'bo-','linewidth',2,'markerfacecolor','r'};
 plot(1:10,pstr{:}) % Pass comma-sep list to func
 
 A={[1,2;5,4],[0,3,6;1,2,6]};
 [A{:}]
 
 %%
%%% Structures & Structure Arrays
 
 % Creation
 classes=struct('name',{'CME192','CME292'},... 
     'units',{1,1},'grade',{'P','P'});
 classes(2)

 % Nested structures
 s = struct();
 s(2).name(4).first='Danielle';
 s(2).name(4).last ='Maddix';

 % Dynamic fields
 s = struct();
 for i=1:3
     s.(['P',num2str(i)]) = i;
 end
%%
%%% Functions
 % Function handles
 a = exp(1);
 f = @(x) a*x.^2;
 trap_rule(f,-1,1,1000) % (2/3)*exp(1) = 1.8122
 
 % Anonymous functions
 f1 = @(x,y) [sin(pi*x), cos(pi*y), tan(pi*x*y)];
 f1(0.5,0.25)
 quad(@(x) exp(1)*x.^2,-1,1)
 
 % Local functions
 loc_func_ex()
 ['I can''t call the ',loc_func()]
 
 % Variable IO
 narginout_ex(1,2,3);
 [a,b]=narginout_ex(1,2,3);
 [b,vo1,vo2] = vararg_ex(2,'varargin','varargout','example','!')
 
%%
%%% Tools
% Profiler
profile on
plot(magic(35))
profile viewer
p = profile('info');
profile off

%%
%%% Performance

%Column-wise ordering
mat = ones(1000,1000); n = 1e6;

%Time for access row-wise
tic(); 
for i = 1:n
    vec = mat(1,:);
end
toc()

tic();
for i = 1:n
    vec = mat(:,1);
end
toc()

%vectorization
tic();
t = 0:0.001:10;
y = zeros(length(t),1);
for i = 1:length(t)
    y(i) = sin(t(i));
end
toc()

tic();
y = sin(t);
toc()

tic()
n = 100;
M = magic(n);
v = M(:,1);
for i = 1:n
    M(:,i) = M(:,i) - v;
end
toc()

tic()
n = 100;
M = magic(n);
v = M(:,1);
M = bsxfun(@minus,M,v);
toc()


 % Delayed copy
 A = rand(10000);
 tic; b=delayed_copy_ex1(A); toc
 tic; b=delayed_copy_ex2(A); toc
 
 format debug
 A = rand(2);
 disp(A)
 delayed_copy_ex3(A);
 format short