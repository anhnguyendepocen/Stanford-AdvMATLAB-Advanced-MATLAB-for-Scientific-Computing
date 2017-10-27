option = 2;

switch option
    case 1
        %Option 1
        
        fig = figure();
        ax  = axes();
        
        x = linspace(0,10*pi,100);
        y = sin(x);
        
        o1 = plot(x(1),y(1),'o','markeredgecolor','k','markerfacecolor',[0.8,0.8,0.8],'markersize',10); hold on;
        o2 = plot(x(1),y(1),'k-','linewidth',2);
        o3 = plot(x(1),y(1),'o','markeredgecolor','k','markerfacecolor','b','markersize',10); hold on;
        
        set(ax,'xlim',[min(x),max(x)],'ylim',2*[min(y),max(y)]);
        
        for i = 1:length(x)
            set(o1,'xdata',x(i),'ydata',y(i));
            set(o2,'xdata',x(1:i),'ydata',y(1:i));
            set(o3,'xdata',x(i)-2*pi,'ydata',y(i));
            drawnow;
        end
        
    case 2
        %Option 2
        
        fig = figure();
        ax  = axes();
        
        x = linspace(0,10*pi,100);
        y = sin(x);
        
        for i = 1:length(x)
            plot(x(i),y(i),'o','markeredgecolor','k','markerfacecolor',[0.8,0.8,0.8],'markersize',10); hold on;
            plot(x(1:i),y(1:i),'k-','linewidth',2);
            plot(x(i)-2*pi,y(i),'o','markeredgecolor','k','markerfacecolor','b','markersize',10); hold on;
            set(ax,'nextplot','replacechildren','xlim',[min(x),max(x)],'ylim',2*[min(y),max(y)]);
            
            drawnow;
        end
end