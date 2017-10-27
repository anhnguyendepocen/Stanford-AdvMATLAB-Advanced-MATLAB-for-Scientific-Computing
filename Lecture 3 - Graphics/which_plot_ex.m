figure;
axes(); hold on;

figure;
axes(); hold on;

x = linspace(0,2*pi,1000);
for k = 1:10
    plot(x,sin(k*x));
end