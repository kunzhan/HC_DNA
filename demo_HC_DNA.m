clear;
addpath('tools');
addpath('images')
%%
% X = imread('lena.jpg');
% P = X(1:16,1:16);
% clear X

% P = imread('lena.jpg');
% P = imread('cameraman.jpg');
% P = imread('circuit.jpg');
% P = imread('peppers.tiff');
% P = imread('barbara.tif');
P = imread('aerial.png');
[m,n,s] = size(P); mn = m*n;    d0 = 'A';
%__________________________________________________________
%% hyper_chaotic_system: obtain k
k = hyper_chaotic_system(mn);
%__________________________________________________________
Q = uint8(hyper_chaotic_DNA(k,P,d0));
%% 
H = entropy(Q);
%%
% cP_d = corr_diagonal(P);
% cP_h = corr_horizontal(P);
% cP_v = corr_vertical(P);
%%
cQ_d = corr_diagonal(Q);
cQ_h = corr_horizontal(Q);
cQ_v = corr_vertical(Q);
% %% 
% P1 = P;
% P1(1,1) = P(1,1) + 1;
% % p = inverse_hyper_chaotic_DNA(Q,k,d0);
% Q1 = hyper_chaotic_DNA(k,P1,d0);
% npcr = NPCR(uint8(Q),uint8(Q1));
% uaci = UACI(uint8(Q),uint8(Q1));
