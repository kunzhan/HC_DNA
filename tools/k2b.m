function b = k2b(k,mn)
% K = k(1,5:8:end);
K = k(1,1:mn);
b = [];
for i=1:mn
    t = dec2base(K(i),2,8);
    b=[b t];
end