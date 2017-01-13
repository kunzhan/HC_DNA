function H = entropy_chaos(I)
C = tabulate(I(:));
P = C(:,3)./100;
H = 0;
for i=1:256
    if P(i)~=0
        H = H - P(i)*log2(P(i));
    end
end