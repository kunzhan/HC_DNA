function Q = hyper_chaotic_DNA(k,P,d0)
[m,n] = size(P);
mn = m*n;
%% Step 1: obtain b1
dec1 = GBS(k,P,mn);
P_gbs = reshape(dec1,m,n);
%__________________________________________________________
%% Step 2: 
d1 = DNA_encode_rule01(P_gbs,mn);
d2 = d1;
d2(1) = DNA_add(d0,d1(1));
for i = 2:4*mn
    d2(i) = DNA_add(d2(i-1),d1(i));
end
%% Step 3
dk = DNA_encode_rule03(k,mn);
d3 = dk;
for i = 1:4*mn
    d3(i) = DNA_add(dk(i),d2(i));
end
%% Step 4
w = func_step(k,mn);
d4 = DNA_complement(d3,w,mn);
%% Step 5: decode
b2 = DNA_decode_rule01(d4,mn);
%% Step 6
bk = k2b(k,mn);
b3 = bitxor(uint8(b2),uint8(bk));
% t = num2str(b3);
% t(t==32) = [];
% b3 = bitxor(uint8(t),uint8(bk));
% 
% B2 = b2dec(b2,mn);
% Q = P*0;
% % K = mod(52+k(1),256);
% % Q(1) = bitxor(B2(1),K);
% for i = 2:mn/2
%     K = mod(Q(mn/2+i-1)+k(i),256);
%     C = bitxor(B2(i),K);
%     K = mod(C + k(mn/2+i),256);
%     Q(mn/2+i) = bitxor(B2(mn/2+i),K);
% end
% B2 = Q;
% % K = mod(52+k(1),256);
% % Q(1) = bitxor(B2(1),K);
% for i = 2:mn/2
%     K = mod(Q(mn/2+i-1)+k(i),256);
%     C = bitxor(B2(i),K);
%     K = mod(C + k(mn/2+i),256);
%     Q(i) = bitxor(B2(mn/2+i),K);
% end

%% Step 7
B = reshape(b3,8,mn);
B = B';
Q = [];
for i=1:mn
    x = B(i,:);
    y = bin2dec(num2str(x));
    Q = [Q y];
end
Q = reshape(Q,m,n);