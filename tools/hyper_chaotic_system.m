%   The system is from the literature:
%  	 A new hyperchaotic system and its adaptive tracking control.         
%  	 Li Chun-Lai and Yu Si-Min, Acta Physica Sinica, 61(4):22-28, 2012.
function k = hyper_chaotic_system(mn)
x1(1,1) = 0.12; %    +1e-15; 
x2(1,1) = 0.23; 
x3(1,1) = 0.34; 
x4(1,1) = 0.45;	
%% Parameters
alpha   = 35;
beta    = 3;
xi      = 35;
tau     = 5;
lambda1 = 1;
lambda2 = 0.2;
lambda3 = 0.3;
%%   Runge Kutta Rule
% The hyper-chaotic system is pre-iterated N0 times 
% to eliminate the adverse effects
h = 0.001;  N0 = 1000;
for j = 1:(N0+mn)
    k1 = alpha*(x2(1,j)-x1(1,j))+lambda1*x4(1,j);
    k2 = alpha*((x2(1,j)+h/2*k1)-(x1(1,j)+h/2*k1))+lambda1*(x4(1,j)+h/2*k1);
    k3 = alpha*((x2(1,j)+h/2*k2)-(x1(1,j)+h/2*k2))+lambda1*(x4(1,j)+h/2*k2);
    k4 = alpha*((x2(1,j)+h*k3)-(x1(1,j)+h*k3))+lambda1*(x4(1,j)+h*k3);
    x1(1,j+1) = x1(1,j)+h/6*(k1+2*k2+2*k3+k4);
    
    L1 = xi*x1(1,j)-x1(1,j)*x3(1,j)+lambda2*x4(1,j);
    L2 = xi*(x1(1,j)+h/2*L1)-(x1(1,j)+h/2*L1)*(x3(1,j)+h/2*L1)+lambda2*(x4(1,j)+h/2*L1);
    L3 = xi*(x1(1,j)+h/2*L2)-(x1(1,j)+h/2*L2)*(x3(1,j)+h/2*L2)+lambda2*(x4(1,j)+h/2*L2);
    L4 = xi*(x1(1,j)+h*L3)-(x1(1,j)+h*L3)*(x3(1,j)+h*L3)+lambda2*(x4(1,j)+h*L3);
    x2(1,j+1) = x2(1,j)+h/6*(L1+2*L2+2*L3+L4);
    
    m1 = -beta*x3(1,j)+x1(1,j)*x2(1,j)+lambda3*x4(1,j);
    m2 = -beta*(x3(1,j)+h/2*m1)+(x1(1,j)+h/2*m1)*(x2(1,j)+h/2*m1)+lambda3*(x4(1,j)+h/2*m1);
    m3 = -beta*(x3(1,j)+h/2*m2)+(x1(1,j)+h/2*m2)*(x2(1,j)+h/2*m2)+lambda3*(x4(1,j)+h/2*m2);
    m4 = -beta*(x3(1,j)+h*m3)+(x1(1,j)+h*m3)*(x2(1,j)+h*m3)+lambda3*(x4(1,j)+h*m3);
    x3(1,j+1) = x3(1,j)+h/6*(m1+2*m2+2*m3+m4);
    
    n1 = -tau*x1(1,j);
    n2 = -tau*(x1(1,j)+h/2*n1);
    n3 = -tau*(x1(1,j)+h/2*n2);
    n4 = -tau*(x1(1,j)+h*n3);
    x4(1,j+1) = x4(1,j)+h/6*(n1+2*n2+2*n3+n4);  
end
v = 1:N0;
x1(:,v) = [];
x2(:,v) = [];
x3(:,v) = [];
x4(:,v) = [];
clear v
%% Generate sequence k
k = [];
for j = 1:mn    
    sa1 = mod(floor(((abs(x1(1,j))-floor(abs(x1(1,j))))*10^15)/10^8),256);
    sa2 = mod(floor(((abs(x2(1,j))-floor(abs(x2(1,j))))*10^15)/10^8),256);
    sa3 = mod(floor(((abs(x3(1,j))-floor(abs(x3(1,j))))*10^15)/10^8),256);
    sa4 = mod(floor(((abs(x4(1,j))-floor(abs(x4(1,j))))*10^15)/10^8),256);    
    k = [k sa1 sa2 sa3 sa4];    
    sb1 = mod(floor(mod(((abs(x1(1,j))-floor(abs(x1(1,j))))*10^15),10^8)),256);
    sb2 = mod(floor(mod(((abs(x2(1,j))-floor(abs(x2(1,j))))*10^15),10^8)),256);
    sb3 = mod(floor(mod(((abs(x3(1,j))-floor(abs(x3(1,j))))*10^15),10^8)),256);
    sb4 = mod(floor(mod(((abs(x4(1,j))-floor(abs(x4(1,j))))*10^15),10^8)),256);    
    k = [k sb1 sb2 sb3 sb4];  
end
