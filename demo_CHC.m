clear;
P=imread('lena.jpg');
% P= imread('cameraman.jpg');


[m,n,s]=size(P);
mn = m*n;

K = CHC_chaos(mn);
C0 = 74;
Pd = double(P);
Q = uint8(CHC_encrypt(Pd,K,C0));
% [PP] = CHC_decrypt(K,C0,double(Q));
H = entropy(Q);
%%
% % cP_d = corr_diagonal(P);
% cP_h = corr_horizontal(P);
% cP_v = corr_vertical(P);
%%
cQ_d = corr_diagonal(Q);
cQ_h = corr_horizontal(Q);
cQ_v = corr_vertical(Q);