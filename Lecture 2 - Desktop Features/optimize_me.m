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
x = [];
for i=1:nx
    if i == 1
        x(i) = dlim(1);
    else
        x(i)=x(end)+dx;
    end
end
x=x';

%% Create difference matrix
D1 = (1/dx)*(diag(-1*ones(nx-1,1),-1) + ...
               diag(ones(nx,1),0));
D1(1,end) = -1/dx;

%% Time step
U = cos(2*pi*x);
for i = 1:nstep
    U(:,i+1) = optimize_me_too(D1,nx,a,dt)*U(:,i);
    
    neg_ind = find(U(:,i+1) < 0);
    pos_ind = find(U(:,i+1) > 0);
    
    xneg     = x(neg_ind);
    xpos     = x(pos_ind);
    negative = U(neg_ind,i+1);
    positive = U(pos_ind,i+1);
    
    if animate
        plot(xneg,negative,'r.'); set(gca,'nextplot','add');
        plot(xpos,positive,'k.'); set(gca,'nextplot','replacechildren'); drawnow;
    end
end