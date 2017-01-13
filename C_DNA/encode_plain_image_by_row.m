function [encoded_image] = encode_plain_image_by_row(plain_image)
[N,M] = size(plain_image);

% N = 256; M = 256;
encoded_image = zeros(N, M*4);
x = md5_checksum; %% ---------------------------->
u = 3.99999999;
x = u * x * (1 - x);
for i = 1:N
    RULE = floor(7*x) + 1;%% floor(8*x) + 1
    encoded_image(i, :) = encode_by_row(RULE, plain_image(i, :));
    x = u * x * (1 - x);
end;
