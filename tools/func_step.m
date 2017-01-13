function w = func_step(K,mn)
k = K(1,1:4*mn)./255;
w = [];
for i=1:4*mn    
    if k(i)>=0 &&  k(i)<=0.5
        K0=0;
    end
    if k(i)>0.5 &&  k(i)<=1
        K0=1;
    end
    w=[w K0];    
end