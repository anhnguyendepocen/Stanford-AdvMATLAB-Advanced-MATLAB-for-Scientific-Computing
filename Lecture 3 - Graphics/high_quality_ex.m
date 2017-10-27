% High-Quality Plots
addpath(genpath('../fixPSlinestyle/'));
addpath(genpath('matlabfrag/'));

x = linspace(0,2*pi,100);

plot(x,cos(x),'b-','linewidth',2); hold on;
plot(x,sin(x),'k-.','linewidth',2);
plot(x,cos(2*x),'r:','linewidth',2);
legend('cos(x)','sin(x)','cos(2x)');
xlabel('x'); ylabel('Trigonometric function'); title('Some trig functions');

% WYSIWYG
set(gcf,'PaperPositionMode','auto');

% fixPSlinestyle
set(gcf,'PaperPositionMode','auto');
print(gcf,'-depsc2','weird_dashdot');
fixPSlinestyle('weird_dashdot.eps','better_dashdot.eps');

% matlabfrag
matlabfrag('mlfrag_ex');

% matlab2tikz
cleanfigure;
matlab2tikz('ml2tikz_ex.tikz');