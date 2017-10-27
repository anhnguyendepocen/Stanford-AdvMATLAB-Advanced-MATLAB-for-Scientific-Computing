%contour_soln.m

s = linspace(0,2*pi,100);
[X,Y]=meshgrid(s,s);
F = sin(X.*Y);

v = [-1,-0.75,-0.5,-0.25,0,0.25,0.5,0.75,1];

figure; colormap(autumn);
[~,hc]=contourf(X,Y,F,v); colorbar; hold on;

[Fx,Fy]=gradient(F);
qh=quiver(X(1:4:end,1:4:end),Y(1:4:end,1:4:end),...
         Fx(1:4:end,1:4:end),Fy(1:4:end,1:4:end));
sh=streamline(X,Y,Fx,Fy,2,2);
set(sh,'linewidth',2,'color','k');