function [cipher_image] = decode_encoded_cipher_image_by_row(cipher_and_encoded_image,N,M)
% [N,M]= size(cipher_and_encoded_image);
% M = M/4;
cipher_image = zeros(N, M);
x = md5_checksum;
u = 3.99999999;
x = u * x * (1 - x);
for i = 1:N
    RULE = floor(7*x) + 1;
    x = u * x * (1 - x);
    
    switch RULE
    case 1
        cipher_image(i, :) = rule1_d(cipher_and_encoded_image(i, :));
    case 2
        cipher_image(i, :) = rule2_d(cipher_and_encoded_image(i, :));
    case 3
        cipher_image(i, :) = rule3_d(cipher_and_encoded_image(i, :));
    case 4
        cipher_image(i, :) = rule4_d(cipher_and_encoded_image(i, :));
    case 5
        cipher_image(i, :) = rule5_d(cipher_and_encoded_image(i, :));
    case 6
        cipher_image(i, :) = rule6_d(cipher_and_encoded_image(i, :));
    case 7
        cipher_image(i, :) = rule7_d(cipher_and_encoded_image(i, :));
    case 8
        cipher_image(i, :) = rule8_d(cipher_and_encoded_image(i, :));
    end;
end;