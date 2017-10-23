function nested_ex1
x = 5;
nestfun1;
   function nestfun1
     x = x + 1;
   end 
   function nestfun2
     y = 4;
   end 
disp(x)
nestfun2
disp(y+1)
end