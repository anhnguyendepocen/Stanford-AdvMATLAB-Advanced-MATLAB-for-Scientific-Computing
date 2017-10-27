figure;
x = linspace(0,2*pi,1000);
plot(x,sin(2*x),'k-','linew',2); hold on;
plot(x,cos(2*x),'r--','linew',2);
plot(x,cos(4*x),'b:','linew',2);

leg=legend('My fantastic sine curve','My fantastic cosine curve',...
           'My even more fantastic cosine curve');
set(leg,'interpreter','latex');

%createfigure(x,[sin(2*x);cos(2*x);cos(4*x)])