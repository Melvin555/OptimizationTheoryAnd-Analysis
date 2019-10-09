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

disp('Goldstein case: ');
i = 0;
xleft = x0+lambda*d;
rleft = (0.5*transpose(xleft)*A*xleft) +... 
             transpose(b)*xleft + c;
rright1 = f0+transpose(delta*lambda*f1)*d;
rright2 = f0+transpose((1-delta)*lambda*f1)*d;
while rleft>rright1 || rleft<=rright2
    i=i+1;
    lambda = beta*(gamma^i);
    xleft = x0+lambda*d;
    rleft = (0.5*transpose(xleft)*A*xleft) +... 
                 transpose(b)*xleft + c;
    rright1 = f0+transpose(delta*lambda*f1)*d;
    rright2 = f0+transpose((1-delta)*lambda*f1)*d;
end
disp('The result of Goldstein iteration gives the x(1) result as...');
disp(xleft);
disp('With the Lambda value equals to: ');disp(lambda);
disp('and m equals to: ');disp(i);