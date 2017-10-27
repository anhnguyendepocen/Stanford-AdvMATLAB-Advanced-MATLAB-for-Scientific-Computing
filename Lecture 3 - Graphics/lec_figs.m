% lecture figures

% Contour
figure; contour(peaks,20); 
figure; contourf(peaks,20); 
figure; contour3(peaks,20); 

% Surf
figure; surf(peaks); 
figure; surfc(peaks); 
figure; waterfall(peaks); 
figure; mesh(peaks); 
figure; meshc(peaks); 

% Quiver, Contour, Streamline
figure;
[x,y] = meshgrid(-2:.2:2,-1:.15:1);
z = x .* exp(-x.^2 - y.^2); [px,py] = gradient(z,.2,.15);
contour(x,y,z), hold on
quiver(x,y,px,py);
streamline(x,y,px,py,[-0.5,-0.5,-0.5,-1,-1,-1],[-0.5,0,0.5,-0.5,0,0.5]), hold off, axis image

% Scalar volume
[x y z v] = flow;
figure;
h=contourslice(x,y,z,v,[1:9],[],[0], linspace(-8,2,10));
set(gca,'view',[149.5 44]); 

figure;
slice(x,y,z,v,[2,8],[-2],[0]); 
set(gca,'view',[149.5 44]); 

figure;
for i = -5:0
    isosurface(x,y,z,v,i);
end
set(gca,'view',[149.5 44]); 

% Vector volume
% coneplot
figure;
load wind
vel = sqrt(u.*u + v.*v + w.*w);
p = patch(isosurface(x,y,z,vel, 40));
isonormals(x,y,z,vel, p)
set(p, 'FaceColor', 'red', 'EdgeColor', 'none');

[f verts] = reducepatch(isosurface(x,y,z,vel, 30), .2);
h=coneplot(x,y,z,u,v,w,verts(:,1),verts(:,2),verts(:,3),2);
set(h, 'FaceColor', 'blue', 'EdgeColor', 'none');
[cx cy cz] = meshgrid(linspace(71,134,10),linspace(18,59,10),3:4:15);
h2=coneplot(x,y,z,u,v,w,cx,cy,cz,v,2); %color by North/South velocity
set(h2, 'EdgeColor', 'none');

axis tight; box on
camproj p; camva(24); campos([185 2 102])
camlight left; lighting phong

% streamtube
figure;
load wind
[sx sy sz] = meshgrid(80, 20:10:50, 0:5:15);
h=streamtube(x,y,z,u,v,w,sx,sy,sz);
axis tight
shading interp;
view(3);
camlight; lighting gouraud

% streamslice
figure;
z = peaks;
surf(z); hold on
shading interp;
[c ch] = contour3(z,20); set(ch, 'edgecolor', 'b')
[u v] = gradient(z);
h = streamslice(-u,-v);  % downhill
set(h, 'color', 'k')
for i=1:length(h);
    zi = interp2(z,get(h(i), 'xdata'), get(h(i),'ydata'));
    set(h(i),'zdata', zi);
end
view(30,50); axis tight
