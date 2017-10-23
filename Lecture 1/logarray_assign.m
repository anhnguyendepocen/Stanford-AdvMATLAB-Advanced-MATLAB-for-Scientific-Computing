% logical array assignment
x = linspace(0,2*pi,1000);
y = sin(2*x);

plot(x,y,'k-','linew',2); hold on;

plot(x(x<=pi/2),y(x<=pi/2),'r-','linew',2);
plot(x(y<0.5 & y>-0.5),y(y<0.5 & y>-0.5),'b:','linew',2);