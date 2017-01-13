image = imread('cameraman.tif');
[N,M] = size(image);
encoded_image = encode_plain_image_by_row(image);
decoded_image = decode_encoded_cipher_image_by_row(encoded_image,N,M);
image = uint8(decoded_image);
imshow(image);
% pause;