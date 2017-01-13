clear
addpath('tools');
addpath('images');
addpath('C_DNA');


P = imread('lena.jpg');
% P = imread('cameraman.jpg');
% P = imread('circuit.jpg');
% P = imread('peppers.tiff');
% P = imread('barbara.tif');
% P = imread('aerial.png');

Q = Encryption(P);
H = entropy(Q);
%%
% cP_d = corr_diagonal(P);
% cP_h = corr_horizontal(P);
% cP_v = corr_vertical(P);
%%

cQ_d = corr_diagonal(Q);
cQ_h = corr_horizontal(Q);
cQ_v = corr_vertical(Q);

P1 = P;
P1(1,1) = P(1,1) + 1;
Q1 = Encryption(P1);
npcr = NPCR(uint8(Q1),uint8(Q));
uaci = UACI(uint8(Q1),uint8(Q));