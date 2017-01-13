function [cipher_and_encoded_image_] = operate_key_image_and_encoded_plain_image_inverse_edition(encoded_key_image, encoded_plain_image,N,M)

% N = 256; M = 256;
cipher_and_encoded_image_ = zeros(N, 4 * M);
x = md5_checksum;
u = 3.99999999;
x = u * x * (1 - x);

for i = 1:N
    x = u * x * (1 - x);
    OPERATION = floor(3 * x) + 1;%% Choose an operation from opts 1~3
                                 %% BE CAREFUL that DO NOT use floor(4*x) here !
switch OPERATION
    case 1
        %% XOR Operation
        cipher_and_encoded_image_(i, :) = operate1(encoded_key_image(i, :), encoded_plain_image(i, :));
    case 2
        %% Addition Operation
        cipher_and_encoded_image_(i, :) = operate2(encoded_key_image(i, :), encoded_plain_image(i, :));
    case 3
        %% Substraction Operation
        cipher_and_encoded_image_(i, :) = operate3_inverse_edition(encoded_key_image(i, :), encoded_plain_image(i, :));
end;
end;