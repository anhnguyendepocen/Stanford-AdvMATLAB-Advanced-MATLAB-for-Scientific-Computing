% Profile setup and view

profile on -history;

A = rand(1000);
b = rand(1000,1);

mult1 = trimultiply_1(A,b);
mult2 = trimultiply_2(A,b);

profile viewer;


