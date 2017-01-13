function P = CDCP_decrypt(K,C0,D)
[m,n] = size(D);
mn = m*n;
C=zeros(m,n);
for i=mn/2:-1:2
    C(mn/2+i)=bitxor(D(mn/2+i),(mod(D(i)+K(mn/2+i),256)));
    C(i)=bitxor(D(i),(mod(D(mn/2+i-1)+K(i),256)));
end
    C(mn/2+1)=bitxor(D(mn/2+1),(mod(D(1)+K(mn/2+1),256)));
    C(1)=bitxor(D(1),(mod(C(mn)+K(1),256)));

P=zeros(m,n);
for i=mn/2:-1:2
    P(mn/2+i)=bitxor(C(mn/2+i),(mod(C(i)+K(mn/2+i),256)));
    P(i)=bitxor(C(i),(mod(C(mn/2+i-1)+K(i),256)));
end
    P(mn/2+1)=bitxor(C(mn/2+1),(mod(C(1)+K(mn/2+1),256)));
    P(1)=bitxor(C(1),(mod(C0+K(1),256)));