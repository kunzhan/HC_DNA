function [r_dia] = corr_diagonal(A)
[m,n] = size(A);
C=[];
for i=1:m
    for j=1:n
        if i+1<=m && j+1<=n
            C=[C A(i,j) A(i+1,j+1)];
        end
        if i+1<=m && j-1>=1
            C=[C A(i,j) A(i+1,j-1)];
        end        
    end
end
a=length(C);
P=[];
Q=[];

for i=1:a
    B(i)=double(C(i));
end
for i=1:a
    if mod(i,2)==1
        P=[P B(i)];
    end
    if mod(i,2)==0
        Q=[Q B(i)];
    end
end
t=sym(0); 
m1=mean(P(1:a/2));
m2=mean(Q(1:a/2));


k1=double(t);
for i=1:a/2
    k1=k1+(P(i)-m1)*(Q(i)-m2);
end

k2=double(t);
for i=1:a/2
    k2=k2+(P(i)-m1)^2;
end

k3=double(t);
for i=1:a/2
    k3=k3+(Q(i)-m2)^2;
end 
r_dia=k1/sqrt(k2*k3);