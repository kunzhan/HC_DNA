function [D]=CDCP_encrypt(P,K,C0)
[m,n]= size(P);
mn = m*n;
C = zeros(m,n);
C(1) = bitxor(P(1),(mod(C0+K(1),256)));
C(mn/2+1)=bitxor(P(mn/2+1),(mod(C(1)+K(mn/2+1),256)));
for i = 2:(mn/2)
    C(i)=bitxor(P(i),(mod(C(mn/2+i-1)+K(i),256)));
    C(mn/2+i)=bitxor(P(mn/2+i),(mod(C(i)+K(mn/2+i),256)));
end

D=zeros(m,n);
D(1)=bitxor(C(1),(mod(C(mn)+K(1),256)));
D(mn/2+1)=bitxor(C(mn/2+1),(mod(D(1)+K(mn/2+1),256)));
for i=2:(mn/2)
    D(i)=bitxor(C(i),(mod(D(mn/2+i-1)+K(i),256)));
    D(mn/2+i)=bitxor(C(mn/2+i),(mod(D(i)+K(mn/2+i),256)));
end