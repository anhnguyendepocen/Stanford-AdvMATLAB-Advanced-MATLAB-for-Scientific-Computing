% Graphics handles and objects
%%
% Callback creation
set(0,'DefaultFigureCreateFcn','disp(''Hello world!!'')');

% Generate objects and get handles
fig = figure();
ax(1) = subplot(1,2,1); % axes generated in current figure
ax(2) = subplot(1,2,2,'Parent',fig); % axes generated in fig

x = linspace(0,2,20);
o1 = plot(x,exp(x)); % plot in current axes
[~,o2] = contour(ax(1),peaks); % plot in specified axis
set(ax(2),'nextplot','add'); %equivalent to hold on
o3 = plot(ax(2),x,exp(2*x));

%%
%Get additional handles
type_o3=get(o3,'type');
allChildFig = allchild(fig);
anc_o1=ancestor(o1,'axes');
anc_o2=ancestor(o2,'figure');

%%
%Make them pretty
%
% Tasks: - Resize figure 
%        - Use log scale on y-axis for ax(2)
%        - Reverse direction of x-axis (descending) for ax(2)
%        - Remove ticks and labels from ax(1)
%        - Change colormap on ax(1) to bone
%        - For object o2, remove lines between contour levels
%        - For object o1, make line thick and dashed
%        - For object o3, use o markers with faces of color [0.8,0.8,0.8]
%          and black edges

% Solution:
% ---------
set(fig,'Position',[440   205   833   573]);
set(ax(2),'yscale','log');
set(ax(2),'yminorgrid','on','ygrid','on','xgrid','on');
set(ax(2),'xdir','reverse');
set(ax(1),'xtick',[],'ytick',[]);
%colormap(ax(1), bone)
set(o2,'linestyle','--');
set(o1,'linewidth',2,'linestyle','-.');
set(o3,'marker','o','markerfacecolor',[0.8,0.8,0.8],'markeredgecolor','k');

%%
%Add labels/legends
%
% Tasks: - Add xlabel ('first x') to ax(1) with size 16 font  ('FontSize')
%        - Add ylabel ('second y') to ax(2) in the color blue ('Color')
%        - Add title to ('Contour plot') to ax(1) in font Time  ('FontName')
%        - Add legend to ax(1) labeling the lines ($e^{2x}$ and $e^x$);
%          they should appear in this order in the legend. Use latex
%          interpreters ('Interpreter'). Hint, use set()!!


% Solution:
% ---------
xlbl = xlabel(ax(1),'first x','fontsize',16); 
ylbl = ylabel(ax(2),'second y','color','b');
ti(1) = title(ax(1),'Contour plot','fontname','times');

leg = legend([o3,o1],'$exp(2x)$','$exp(x)$');
set(leg,'interpreter','latex');

%%
% Callback
set(o2,'ButtonDownFcn',@morelines);
set(o2,'DeleteFcn','disp(''Goodbye cruel world!!'')');
set(o1,'ButtonDownFcn',@cyclecolor);