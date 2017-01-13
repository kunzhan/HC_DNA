function [image_entropy] = information_entropy(PATH)
image = imread(PATH);
image = double(image);
image_entropy = entropy(image, 256);