% function figure_4
clear
load data_in_mem
k = 0;
figure(1),
for i = 1:6
    k = 4*(i-1) + 1;
    subplot(6,4,k),imshow(data{4,i})
    subplot(6,4,k+1),imhist(data{4,i})
    subplot(6,4,k+2),imshow(data{1,i},[])
	subplot(6,4,k+3),imhist(uint8(data{1,i}))
end