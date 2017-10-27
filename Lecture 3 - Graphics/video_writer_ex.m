writerObj = VideoWriter('my_movie.avi'); %Video obj
set(writerObj,'FrameRate',10);
open(writerObj);

% Prepare the movie
figure; set(gca,'NextPlot','replaceChildren');
th = linspace(0,2*pi,100);

for j = th
    plot(sin(th),cos(th),'k-'); hold on;
    plot(sin(j),cos(j),'ro');
    writeVideo( writerObj, getframe(gcf) );
end
close(writerObj);