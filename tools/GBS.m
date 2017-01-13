function [dec1,b1] = GBS(k,P,mn)
[~,kx] = sort(k);
%%
b0 = [];
for i = 1:mn
    x = dec2base(P(i),2,8);
    b0 = [b0 x];
end
b1 = b0;
% bk = k2b(k,mn);
% B1 = [];
% for j = 1:mn
%     b1(8*j-2) = num2str(bitxor(uint8(bk(j)),uint8(b1(8*j-2))));
% end
% b2 = b1;
for j = 1:mn*8
    b1(j) = b0(kx(j));
end

dec1 = b2dec(b1,mn);