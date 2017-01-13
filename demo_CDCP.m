clear;
addpath('tools');
addpath('images')
% P = imread('lena.jpg');
% P = imread('cameraman.jpg');
% P = imread('circuit.jpg');
% P = imread('peppers.tiff');
% P = imread('barbara.tif');
P = imread('aerial.png');

[m,n]=size(P);      mn = m*n;           C0 = 52;
K = CDCP_chaos(mn);


Q = CDCP_encrypt(P,K,C0);
% p = CDCP_decrypt(K,C0,Q);
%% 
H = entropy(uint8(Q));
%%
% cP_d = corr_diagonal(P);
% cP_h = corr_horizontal(P);
% cP_v = corr_vertical(P);
%%
cQ_d = corr_diagonal(Q);
cQ_h = corr_horizontal(Q);
cQ_v = corr_vertical(Q);
