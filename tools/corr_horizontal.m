function [r_hor]=corr_horizontal(A)
[m,n] = size(A);
C=[];
for i=1:m
    for j=1:n
        C=[C A(i,j)];
    end
end

for i=1:m*n
    B(i)=double(C(i));
end

m1=mean(B(1:m*n-1));
m2=mean(B(2:m*n));

t=sym(0);
k1=double(t);
for i=1:m*n-1
    k1=k1+(B(i)-m1)*(B(i+1)-m2);
end

k2=double(t);
for i=1:m*n-1
    k2=k2+(B(i)-m1)^2;
end

k3=double(t);
for i=2:m*n
    k3=k3+(B(i)-m2)^2;
end

r_hor=k1/sqrt(k2*k3);
