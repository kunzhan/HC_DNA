% function figure_05
clear
addpath('tools');
load data_in_mem
for i = 1:6
    [X_1,X_2] = corr_hor_image(data{2,i},3000);
    [Y_1,Y_2] = corr_hor_image(data{4,i},3000);
    if i <4
        subplot(4,3,i);
        set(gcf,'color',[1 1 1]);
        plot(X_1,X_2,'.');
        axis([0 255 0 255]);axis square
        subplot(4,3,i+3);
        set(gcf,'color',[1 1 1]);
        plot(Y_1,Y_2,'.');
        axis([0 255 0 255]);axis square
    else
        subplot(4,3,i+3);
        set(gcf,'color',[1 1 1]);
        plot(X_1,X_2,'.');
        axis([0 255 0 255]);axis square
        subplot(4,3,i+6);
        set(gcf,'color',[1 1 1]);
        plot(Y_1,Y_2,'.');
        axis([0 255 0 255]);axis square
    end
end