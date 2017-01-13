function correlation_plot(f)
%相关性的分布图
x=mod(floor(rand(1,10000)*10000),255)+1;
y=mod(floor(rand(1,10000)*10000),255)+1;
z=x;
v=y+1;
for i=1:10000
    a(i)=f(y(i)+(x(i)-1)*256);
    b(i)=f(v(i)+(z(i)-1)*256);
end
figure,plot(a,b,'.');
axis([1,250,1,250]);
xlabel('pixel gray value on location (x,y)');
ylabel('pixel gray value on location (x,y+1)');