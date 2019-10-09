A = [2 1 1 0;
     1 4 0 0;
     1 0 2 0;
     0 0 0 2];
b = [1;
     2;
     0;
     1];
c = 2;
delta = exp(-4);
beta = 1;
gamma = 0.5;
x0 = [1;
      1;
      1;
      1];
x = x0;
f0 = (0.5*transpose(x)*A*x) + transpose(b)*x + c;
f1 = A*x+b;
d = -1*f1;
i = 0;
lambda = beta*(gamma^i);

disp('Wolfe case: ');
i = 0;
xleft = x0+lambda*d;
delta1 = exp(-4);
delta2 = exp(-2);
rleft1 = (0.5*transpose(xleft)*A*xleft) +... 
             transpose(b)*xleft + c;
rleft2 = transpose(A*xleft+b)*d;
rright1 = f0+transpose(delta1*lambda*f1)*d;
rright2 = transpose(delta2*f1)*d;
while rleft1>rright1 || rleft2<rright2
    i=i+1;
    lambda = beta*(gamma^i);
    xleft = x0+lambda*d;
    rleft1 = (0.5*transpose(xleft)*A*xleft) +... 
                 transpose(b)*xleft + c;
    rleft2 = transpose(A*xleft+b)*d;
    rright1 = f0+transpose(delta1*lambda*f1)*d;
    rright2 = transpose(delta2*f1)*d;
end
disp('The result of Wolfe iteration gives the x(1) result as...');
disp(xleft);
disp('With the Lambda value equals to: ');disp(lambda);
disp('and m equals to: ');disp(i);