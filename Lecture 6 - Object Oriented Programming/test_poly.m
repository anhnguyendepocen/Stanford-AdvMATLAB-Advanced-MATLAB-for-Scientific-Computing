%%
poly(1) = polynomial([0,1]);
poly(2) = polynomial([0,0,1]);
poly(3) = polynomial([0,0,0,1]);
poly(4) = polynomial(0);

ax=axes('nextplot','add');
for i = 1:length(poly)
    ipoly(i) = integrate(poly(i),0);
    dpoly(i) = differentiate(poly(i));
    ppoly(i) = poly(i)^2;
    uppoly(i)= +poly(i);
    umpoly(i)= -poly(i);
    eval0(i) = evaluate(poly(i),0);
    zpoly(i)= iszero(poly(i));
    for j = 1:length(poly)
        apoly(i,j) = poly(i) + poly(j);
        mpoly(i,j) = poly(i) - poly(j);
        tpoly(i,j) = poly(i)*poly(j);
    end
    plot_it(poly(i),linspace(-1,1,100),{'r--','linewi',2},ax);
end