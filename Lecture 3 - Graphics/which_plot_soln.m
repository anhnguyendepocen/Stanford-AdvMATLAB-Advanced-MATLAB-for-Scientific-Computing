fH(1)=figure;
aH(1)=axes(); hold on;

fH(2)=figure;
aH(2)=axes(); hold on;

x = linspace(0,2*pi,1000);
pstr = {'b','r','k','g','m'};
p1 = zeros(5,1);
p2 = zeros(5,1);
for k = 1:10
    if rem(k,2) == 0
        p1(ceil(k/2)) = plot(aH(1),x,sin(k*x),pstr{ceil(k/2)},'linew',2);
    else
        p2(ceil(k/2)) = plot(aH(2),x,sin(k*x),pstr{ceil(k/2)},'linew',2);
    end
end
odd_k = {'k = 1', 'k = 3', 'k = 5', 'k = 7', 'k = 9'};
even_k = {'k = 2', 'k = 4', 'k = 6', 'k = 8', 'k = 10'};
legend(p1, even_k);
l2 = legend(p2, odd_k);
legend(l2,  'Location', 'Best')

%% Post-processing
V = get(fH(1));
set(fH(1), 'Visible', 'off')
get(fH(1), 'Visible')
s = struct('Visible', 'on', 'Color', 'none');
set(fH(1), s)
%can store plot as p3 and edit linewidth after created
get(gcf)
get(gca)
get(p1(1))