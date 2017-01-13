function cipher_image = Encryption(P)
%% encrypt plain image by rows

% [P, cmap] = imread('cameraman.tif');
% image(P); colormap(cmap); axis image off
% pause;

% %% TEST
% 
% global temp_check;
% 
% %%

flag = 1;
while flag > 0
% PATH = 'pic/plane.bmp';
cipher_image = test(P);
% cipher_image = uint8(cipher_image);
% imhist(cipher_image);
% pause;
% H = entropy(cipher_image, 256)
% imwrite(cipher_image, 'pic/plane_c_2.bmp', 'bmp');

% %% test
% cipher_image = uint8(cipher_image);
% imwrite(cipher_image, 'pic/peppers_temp_c.bmp', 'bmp');
% %% test

%% rotate cipher image by 90 degrees to do the encryption process by columns.
cipher_image = imrotate(cipher_image, 90);

%% encrypt image by columns
% cipher_image = uint8(cipher_image);
% imwrite(cipher_image, 'pic/plane_temp.bmp', 'bmp');

% PATH = 'pic/plane_temp.bmp';
cipher_image = test(cipher_image);
cipher_image = uint8(cipher_image);
%imhist(cipher_image_final);
% pause;
%H = entropy(cipher_image_final, 256)
% imwrite(cipher_image, 'pic/peppers_c_1.bmp', 'bmp');
flag = flag - 1;
P = cipher_image;
end;
% p = imread('pic/plane_c2_1.bmp');
% p = uint8(p);
% imhist(p);
