%     dx1/dt = a*(x2-x1);
%     dx2/dt = b*x1+c*x2-x1*x3+x4;
%     dx3/dt = x2^2-d*x3;
%     dx4/dt = -e*x1;

function K = CDCP_chaos(mn)
x1(1,1) = 2.5;
x2(1,1) = 5.2;
x3(1,1) = 3.0;
x4(1,1) = 7.3;
a = 27.5;
b = 3;
c = 19.3;
d = 2.9;
e = 3;  
N0 = 1000;h = 0.001; 
for i=1:(N0+mn/4)  
    k1=a*(x2(1,i)-x1(1,i));
    k2=a*((x2(1,i)+h/2*k1)-(x1(1,i)+h/2*k1));
    k3=a*((x2(1,i)+h/2*k2)-(x1(1,i)+h/2*k2));
    k4=a*((x2(1,i)+h*k3)-(x1(1,i)+h*k3));    
    x1(1,i+1)=x1(1,i)+h/6*(k1+2*k2+2*k3+k4);
    
    L1=b*x1(1,i)+c*x2(1,i)-x1(1,i)*x3(1,i)+x4(1,i);
    L2=b*(x1(1,i)+h/2*L1)+c*(x2(1,i)+h/2*L1)-(x1(1,i)+h/2*L1)*(x3(1,i)+h/2*L1)+(x4(1,i)+h/2*L1);
    L3=b*(x1(1,i)+h/2*L2)+c*(x2(1,i)+h/2*L2)-(x1(1,i)+h/2*L2)*(x3(1,i)+h/2*L2)+(x4(1,i)+h/2*L2);
    L4=b*(x1(1,i)+h*L3)+c*(x2(1,i)+h*L3)-(x1(1,i)+h*L3)*(x3(1,i)+h*L3)+(x4(1,i)+h*L3);
    x2(1,i+1)=x2(1,i)+h/6*(L1+2*L2+2*L3+L4);
    
    m1=x2(1,i)^2-d*x3(1,i);
    m2=(x2(1,i)+h/2*m1)^2-d*(x3(1,i)+h/2*m1);
    m3=(x2(1,i)+h/2*m2)^2-d*(x3(1,i)+h/2*m2);
    m4=(x2(1,i)+h*m3)^2-d*(x3(1,i)+h*m3);
    x3(1,i+1)=x3(1,i)+h/6*(m1+2*m2+2*m3+m4);
    
    n1=-e*x1(1,i);
    n2=-e*(x1(1,i)+h/2*n1);
    n3=-e*(x1(1,i)+h/2*n2);
    n4=-e*(x1(1,i)+h*n3);
    x4(1,i+1)=x4(1,i)+h/6*(n1+2*n2+2*n3+n4);    
end
max_x1=max(x1);min_x1=min(x1);
max_x2=max(x2);min_x2=min(x2);
max_x3=max(x3);min_x3=min(x3);
max_x4=max(x4);min_x4=min(x4);

v = 1:N0;
x1(:,v) = [];
x2(:,v) = [];
x3(:,v) = [];
x4(:,v) = [];
clear v
K = [];
for i = 1:mn/4
    y1 = (2*x1(i)-(max_x1+min_x1))/(max_x1-min_x1);
    z1 = mod(floor((abs(y1)-floor(abs(y1)))*10^14),256);
    
    y2 = (2*x2(i)-(max_x2+min_x2))/(max_x2-min_x2);
    z2 = mod(floor((abs(y2)-floor(abs(y2)))*10^14),256);
    
    y3 = (2*x3(i)-(max_x3+min_x3))/(max_x3-min_x3);
    z3 = mod(floor((abs(y3)-floor(abs(y3)))*10^14),256);
    
    y4 = (2*x4(i)-(max_x4+min_x4))/(max_x4-min_x4);
    z4 = mod(floor((abs(y4)-floor(abs(y4)))*10^14),256);
    K=[K z1 z2 z3 z4];
end