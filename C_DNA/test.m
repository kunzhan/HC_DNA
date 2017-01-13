function cipher_image = test(P)
[N,M] = size(P);

% %% TEST
% 
% global temp_check;
% 
% %%

% PATH = 'pic/lena.bmp';
% [P, cmap] = imread(PATH);
% image(P); colormap(cmap); axis image off
% pause;

% encoded_image = zeros(N, M*4);
% encoded_key_image = zeros(N, M*4);
% cipher_and_encoded_image = zeros(N, M*4);



encoded_image = encode_plain_image_by_row(P);

key_image = generate_key_image(md5_checksum,N,M);

encoded_key_image = encode_plain_image_by_row(key_image);

% %% TEST
% 
% temp_check = encoded_image;
% 
% %%

cipher_and_encoded_image = operate_key_image_and_encoded_plain_image_by_row(encoded_key_image, encoded_image);


% cipher_image = zeros(N, M);

cipher_image = decode_encoded_cipher_image_by_row(cipher_and_encoded_image,N,M);
% cipher_image = uint8(cipher_image);
% image(cipher_image); colormap(cmap); axis image off
% pause;