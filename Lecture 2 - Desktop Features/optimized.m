% Script for solving linear advection equation
%% Setup problem
dlim = [0,1];
T = [0,1];

animate = false;

a = 2;
nx    = 1000;
nstep = ceil(nx*a);
dx = (dlim(2)-dlim(1))/(nx-1);
dt = (T(2)-T(1))/(nstep-1);

%% Define grid
x = linspace(dlim(1), dlim(2), nx);

%% Create difference matrix
D1 = (1/dx)*(diag(-1*ones(nx-1,1),-1) + ...
               diag(ones(nx,1),0));
D1(1,end) = -1/dx;
D1 = sparse(D1);

%% Time step
U = zeros(length(x), nstep);
U(:,1) = cos(2*pi*x);
for i = 1:nstep
    U(:,i+1) = U(:,i) - a*dt*D2*U(:,i);
      
    if animate
        plot(x(U(:,i+1) < 0),U(U(:,i+1) < 0,i+1),'r.'); set(gca,'nextplot','add');
        plot(x(U(:,i+1) > 0),U(U(:,i+1) > 0,i+1),'k.'); set(gca,'nextplot','replacechildren'); drawnow;
    end
end