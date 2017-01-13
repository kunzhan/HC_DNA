function [r_ver]=corr_vertical(A,m,n)
[m,n] = size(A);
C=[];
for j=1:n
    for i=1:m
        C=[C A(i,j)];
    end
end
% 将m*n矩阵转换为一维向量,逐列元素进行，逐个添加到一维向量C当中
% 图像垂直方向上的像素相连在一起

for i=1:m*n
    B(i)=double(C(i));
end
% 将每个像素值转换为实数值

m1=mean(B(1:m*n-1));
m2=mean(B(2:m*n));
% 求平均值

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

r_ver=k1/sqrt(k2*k3);