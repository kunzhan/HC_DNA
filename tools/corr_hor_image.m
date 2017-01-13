function [P1,P2] = corr_hor_image(P,N0)
[m,n] = size(P);
mn = m*n;
index = randperm(mn);

index_a = index(1:N0);

P1 = P(index_a);

for i=1:N0
    if index_a(i) < mn
        index_b(i)=index_a(i)+1;
    end
    if index_a(i) == mn
        index_b(i)=index_a(i);
    end
end
P2 = P(index_b);
