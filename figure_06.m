% function figure_06
clear
load all_of_NPCR_UACI
addpath('images_NPCR_UACI')
P1 = imread('lena_m_239_n_239.bmp');
Q1 = hyper_chaotic_DNA(data{3,1},P1,'A');
mn = numel(P1);
Q = zeros(1,mn);
for i=1:mn
    Q(i)= data{4,1}(i) - Q1(i);
end
subplot(231);bar(Q,'b');

P1 = imread('cameraman_m_90_n_90.bmp');
Q1 = hyper_chaotic_DNA(data{3,2},P1,'A');
mn = numel(P1);
Q = zeros(1,mn);
for i=1:mn
    Q(i)= data{4,2}(i) - Q1(i);
end
subplot(232);bar(Q,'b');

P1 = imread('circuit_m_76_n_76.bmp');
Q1 = hyper_chaotic_DNA(data{3,3},P1,'A');
mn = numel(P1);
Q = zeros(1,mn);
for i=1:mn
    Q(i)= data{4,3}(i) - Q1(i);
end
subplot(233);bar(Q,'b');

P1 = imread('peppers_m_384_n_384.bmp');
Q1 = hyper_chaotic_DNA(data{3,4},P1,'A');
mn = numel(P1);
Q = zeros(1,mn);
for i=1:mn
    Q(i)= data{4,4}(i) - Q1(i);
end
subplot(234);bar(Q,'b');

P1 = imread('barbara_m_498_n_498.bmp');
Q1 = hyper_chaotic_DNA(data{3,5},P1,'A');
mn = numel(P1);
Q = zeros(1,mn);
for i=1:mn
    Q(i)= data{4,5}(i) - Q1(i);
end
subplot(235);bar(Q,'b');

P1 = imread('aerial_m_91_n_91.bmp');
Q1 = hyper_chaotic_DNA(data{3,6},P1,'A');
mn = numel(P1);
Q = zeros(1,mn);
for i=1:mn
    Q(i)= data{4,6}(i) - Q1(i);
end
subplot(236);bar(Q,'b');