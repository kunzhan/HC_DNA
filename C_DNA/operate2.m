%% define operate2 as Addition
function cipher_and_encoded_image_row_temp = operate2(encoded_key_image_row, encoded_plain_image_row)

length_ = length(encoded_key_image_row);
cipher_and_encoded_image_row_temp = zeros(size(encoded_key_image_row));
for i = 1:length_
    a = char(encoded_key_image_row(i));
    b = char(encoded_plain_image_row(i));
    cipher_and_encoded_image_row_temp(i) = opt2(a, b);
end;