function D = optimize_me_too(D1,nx,a,dt)

D1 = D1*a*dt;
D = eye(nx) - D1;

end