% function figure_3
clear
load data_in_mem
figure(1)
for t = 1:3
    k = hyper_chaotic_system(numel(data{4,t})); % note: Change x1(1,1) to 0.12+1e-15;
    subplot(2,3,t),imshow(data{4,t})
    subplot(2,3,t+3),imshow(uint8(inverse_hyper_chaotic_DNA(data{1,t},k,'A')));
end
    
