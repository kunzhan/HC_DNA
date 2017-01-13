function dec1 = b2dec(b1,mn)
b2 = reshape(b1,8,mn)';
dec1 = [];
for i=1:mn
    x = b2(i,:);
    y = bin2dec(x);
    dec1 = [dec1 y];
end