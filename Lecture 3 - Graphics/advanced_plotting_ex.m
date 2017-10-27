%%
% Line plot examples: plotyy, errorbar

% plotyy
x = 0:0.1:10;
y1 = 200*exp(-0.05*x).*sin(x);
y2 = 0.8*exp(-0.5*x).*sin(10*x);
figure;
plotyy(x,y1,x,y2,'plot','stem');

% errorbar
x = linspace(0,pi,10);
y = sin(x);
l = std(y)*ones(size(x)).*randn(size(x));
u = std(y)*ones(size(x)).*randn(size(x));

figure
hE = errorbar(x,y,l,u);
set(hE                            , ...
  'LineStyle',        'none'      , ...
  'LineWidth'       , 1           , ...
  'Color'           , [.3 .3 .3]  , ...
  'Marker'          , 'o'         , ...
  'MarkerSize'      , 6           , ...
  'MarkerEdgeColor' , [.2 .2 .2]  , ...
  'MarkerFaceColor' , [.7 .7 .7]  );

%%
% Discrete data example
figure
load seamount
s = linspace(1,30,length(x));
c = linspace(1,10,length(x));
scatter(x,y,s,c)
%zoom(2)

%%
% Bar and Hist

X = randn(1000,1);
Y = round(rand(5,3)*10);

figure;
ax(1) = subplot(2,1,1);
hist(X); title('hist');
ax(2) = subplot(2,2,3);
bar(1:5,Y,'stacked'); title('bar');
ax(3) = subplot(2,2,4);
barh(1:5,Y,'stacked'); title('barh');

% Pie
figure;
pie3([12,1,2],[0,1,0],{'Work','Fun (CME292)','Sleep'});
title('Life of a Graduate Student');

%%
% Contour plot examples
x = linspace(-2*pi,2*pi);
y = linspace(0,4*pi);
[X,Y] = meshgrid(x,y);
Z = sin(X)+cos(Y);
v = logspace(-5,log10(max(Z(:))),10);
v = [-fliplr(v),0,v];

figure('pos',[241,246,1041,538]);
subplot(2,3,1); contour(X,Y,Z,20); title('contour (20)');
subplot(2,3,2); contourf(X,Y,Z,20); title('contourf (20)');
subplot(2,3,3); contour3(X,Y,Z,20); title('contour3 (20)');

subplot(2,3,4); contour(X,Y,Z,v); title('contour (v)');
subplot(2,3,5); contourf(X,Y,Z,v); title('contourf (v)');
subplot(2,3,6); contour3(X,Y,Z,v); title('contour3 (v)');

%%
% Surface and mesh plot examples
x = linspace(-2*pi,2*pi,40);
y = linspace(0,4*pi,40);
[X,Y] = meshgrid(x,y);
Z = sin(X)+cos(Y);

figure('pos',[21,22,1402,762]);
subplot(2,3,1); surf(X,Y,Z); title('surf'); axis equal;
subplot(2,3,2); surfc(X,Y,Z); title('surfc'); axis equal;
subplot(2,3,3); waterfall(X,Y,Z); title('waterfall'); axis equal;

subplot(2,3,4); mesh(X,Y,Z); title('mesh'); axis equal;
subplot(2,3,5); meshc(X,Y,Z); title('meshc'); axis equal;
% subplot(2,3,6); surfnorm(X,Y,Z); title('surfnorm');

figure('pos',[12,22,1402,762]);
surfnorm(X,Y,Z); title('surfnorm'); axis equal;

%%
% Vector fields examples

% quiver2
[X,Y] = meshgrid(-2:.2:2);
Z = X.*exp(-X.^2 - Y.^2);
[DX,DY] = gradient(Z,.2,.2);

figure;
contour(X,Y,Z);
hold on
quiver(X,Y,DX,DY);

% streamline
[x,y] = meshgrid(0:0.1:1,0:0.1:1);
u = x;
v = -y;

figure;
quiver(x,y,u,v);

startx = 0.1:0.1:1;
starty = ones(size(startx));
streamline(x,y,u,v,startx,starty);

% streamslice


%%
% Volume visualization - scalar data - examples
[x,y,z,f] = flow(10);

% contourslice
figure;
contourslice(x,y,z,f,1:9,[-1.0,1.0],0.0);
set(gca,'cameraposition',[-29.6363 -35.2805 31.9907]);

% slice
figure;
slice(x,y,z,f,[1,9],[-1.0,1.0],0.0);
set(gca,'cameraposition',[-29.6363 -35.2805 31.9907]);

% isocap, isocolors, isonormals, isosurface
figure;
isosurface(x,y,z,f,0.0,sqrt(x.^2+y.^2+z.^2));
set(gca,'cameraposition',[-29.6363 -35.2805 31.9907]);

%%
% Volume visualization - vector data - examples
load wind;

% streamslice
load wind
figure
streamslice(x,y,z,u,v,w,[],[],[5])
axis tight

% streamparticles

% streamtube


%%
% Polygons
% patch
xdata = [2     2     0     2     5;
         2     8     2     4     5;
         8     8     2     4     8];
ydata = [4     4     4     2     0;
         8     4     6     2     2;
         4     0     4     0     0];
cdata = [15     0     4     6    10;
         1     2     5     7     9;
         2     3     10     8     3];
p = patch(xdata,ydata,cdata,'Marker','o',...
          'MarkerFaceColor','flat',...
          'FaceColor','interp');
%%
[x,y,z] = meshgrid(-2:.2:2, -2:.25:2, -2:.16:2);
v = x .* exp(-x.^2 - y.^2 - z.^2);
slice(x,y,z,v,[-1.2 .8 2],2,[-2 -.2])

[x1,y1]=meshgrid(-2:.2:2, -2:.25:2);
z1 = 0.5*(x1-y1).^2;
figure;
slice(x,y,z,v,x1,y1,z1);