function P = inverse_hyper_chaotic_DNA(Q,k,d0)
[m,n] = size(Q); mn = m*n;
%% inverse Step 7
b3 = [];
for i=1:mn
    x = dec2base(Q(i),2,8);    
    b3 = [b3 x];
end
%% inverse Step 6
bk = k2b(k,mn);
b2 = bitxor(uint8(b3),uint8(bk));
%% inverse Step 5
DEC4 = b2dec(num2str(b2'),mn);
d4 = DNA_encode_rule01(DEC4,mn);
%% inverse Step 4
w = func_step(k,mn);
d3 = DNA_complement(d4,w,mn);
%% inverse Step 3
dk = DNA_encode_rule03(k,mn);
d2 = dk;
for i = 1:4*mn
    d2(i) = DNA_sub(dk(i),d3(i));
end
%% inverse Step 2
d1 = d2;
d2 = [d0 d2];
for i = 4*mn:-1:1
    d1(i) = DNA_sub(d2(i),d2(i+1));
end
b1 = [];
for i = 1:4*mn
    if d1(i)=='A';    
        K = '00';
    elseif d1(i)=='C';
        K = '01';  
    elseif d1(i)=='G';
        K = '10';
    elseif d1(i)=='T';     
        K = '11';
    end
    b1 = [b1 K];
end
%% inverse Step 1
[~,kx] = sort(k);
b0 = b1;
for j = 1:8*mn
    b0(kx(j)) = b1(j);
end
P0 = reshape(b0,8,mn)';
P = [];
for i = 1:mn
    P = [P bin2dec(P0(i,:))];
end
P = reshape(P,m,n);