%graphics_handle_lec.m
figH = figure('pos',[141,258,869,523]);
axH = axes();
ax1H = subplot(2,2,3);
sinH = plot(sin(linspace(0,2*pi,100)));
[c contH] = contour(peaks);
%peaks is a function of 2 variables obtained be translating and scaling
fHan = zeros(1, 10);
for i = 1:10, fHan(i) = figure(); end
ax = axes('Parent', fHan(4));
[C, objHan] = contourf(ax,peaks);