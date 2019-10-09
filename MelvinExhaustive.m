clc;close all;clear all;
h0 = 0.8; h1 = 0.4; h2 = 0.2;
i = 0;
tic
while i<1000
    for m=1:10
        x(m) = randi([0,1],1);
        if x(m)==0
            x(m)=-1;
        end
    end
    for m=1:12
        w(m) = randi([0,1],1);
    end

    H = [h0 0 0 0 0 0 0 0 0 0;
         h1 h0 0 0 0 0 0 0 0 0;
         h2 h1 h0 0 0 0 0 0 0 0;
         0 h2 h1 h0 0 0 0 0 0 0;
         0 0 h2 h1 h0 0 0 0 0 0;
         0 0 0 h2 h1 h0 0 0 0 0;
         0 0 0 0 h2 h1 h0 0 0 0;
         0 0 0 0 0 h2 h1 h0 0 0;
         0 0 0 0 0 0 h2 h1 h0 0;
         0 0 0 0 0 0 0 h2 h1 h0;
         0 0 0 0 0 0 0 0 h2 h1;
         0 0 0 0 0 0 0 0 0 h2];

    y = H*transpose(x)+transpose(w);
    xhat = (y-transpose(w))\H;
    i=i+1;
end
toc
