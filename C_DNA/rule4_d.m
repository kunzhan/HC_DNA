function [cipher_image_row] = rule4_d(cipher_and_encoded_image_row)

M = 256;
cipher_image_row = zeros(1, M);
string_ = '';
string__ = '';
length__ = length(cipher_and_encoded_image_row);
for i = 1:length__
    if char(cipher_and_encoded_image_row(i)) == 'A'
        string_ = [string_, '11'];
    elseif char(cipher_and_encoded_image_row(i)) == 'T'
        string_ = [string_, '00'];
    elseif char(cipher_and_encoded_image_row(i)) == 'C'
        string_ = [string_, '01'];
    else
        string_ = [string_, '10'];
    end;
end;

j = 1;
for i = 1:8:(2 * length__ - 7)
    string__ = string_(i:i+7);
    cipher_image_row(j) = bin2dec(string__);
    j = j + 1;
end;