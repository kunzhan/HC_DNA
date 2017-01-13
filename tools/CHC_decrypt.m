function P = CHC_decrypt(K,C0,D)
[m,n] = size(D);
mn = m*n;
C=zeros(m,n);
for i=mn:-1:2
    C(i)=mod((bitxor(D(i),mod(K(i)+D(i-1),256)))+256-K(i+1),256);
end
C(1)=mod((bitxor(D(1),mod(K(1)+C(mn),256)))+256-K(2),256);

P=zeros(m,n);
for i=mn:-1:2
    P(i)=mod((bitxor(C(i),mod(K(i)+C(i-1),256)))+256-K(i+1),256);
end
P(1)=mod((bitxor(C(1),mod(K(1)+C0,256)))+256-K(2),256);