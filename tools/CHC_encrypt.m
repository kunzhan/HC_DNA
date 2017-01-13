function D = CHC_encrypt(P,K,C0)
[m,n] = size(P);
mn = m*n;
C = zeros(m,n);
C(1)=bitxor((mod(P(1)+K(2),256)),(mod(K(1)+C0,256)));
for i=2:mn
    C(i)=bitxor((mod(P(i)+K(i+1),256)),(mod(K(i)+C(i-1),256)));   
end

D=zeros(m,n);
D(1)=bitxor((mod(C(1)+K(2),256)),(mod(K(1)+C(mn),256)));
for i=2:mn
    D(i)=bitxor((mod(C(i)+K(i+1),256)),(mod(K(i)+D(i-1),256)));
end