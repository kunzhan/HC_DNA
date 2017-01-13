function [encoded_row_pixels] = rule5(plain_row_pixels)

encoded_row_pixels = '';
M_length = length(plain_row_pixels);
for i = 1:M_length
%     binary_value = dec2bin(plain_row_pixels(i));
    binary_value = dec2bin(plain_row_pixels(i), 8);
%     binary_value
    %1, 2
    if binary_value(1) == '0' && binary_value(2) == '0'
        encoded_row_pixels = [encoded_row_pixels, 'C'];
    elseif binary_value(1) == '0' && binary_value(2) == '1'
        encoded_row_pixels = [encoded_row_pixels, 'T'];
    elseif binary_value(1) == '1' && binary_value(2) == '0'
        encoded_row_pixels = [encoded_row_pixels, 'A'];
    else
        encoded_row_pixels = [encoded_row_pixels, 'G'];
    end;
    %3, 4
    if binary_value(3) == '0' && binary_value(4) == '0'
        encoded_row_pixels = [encoded_row_pixels, 'C'];
    elseif binary_value(3) == '0' && binary_value(4) == '1'
        encoded_row_pixels = [encoded_row_pixels, 'T'];
    elseif binary_value(3) == '1' && binary_value(4) == '0'
        encoded_row_pixels = [encoded_row_pixels, 'A'];
    else
        encoded_row_pixels = [encoded_row_pixels, 'G'];
    end;
    %5, 6
    if binary_value(5) == '0' && binary_value(6) == '0'
        encoded_row_pixels = [encoded_row_pixels, 'C'];
    elseif binary_value(5) == '0' && binary_value(6) == '1'
        encoded_row_pixels = [encoded_row_pixels, 'T'];
    elseif binary_value(5) == '1' && binary_value(6) == '0'
        encoded_row_pixels = [encoded_row_pixels, 'A'];
    else
        encoded_row_pixels = [encoded_row_pixels, 'G'];
    end;
    %7, 8
    if binary_value(7) == '0' && binary_value(8) == '0'
        encoded_row_pixels = [encoded_row_pixels, 'C'];
    elseif binary_value(7) == '0' && binary_value(8) == '1'
        encoded_row_pixels = [encoded_row_pixels, 'T'];
    elseif binary_value(7) == '1' && binary_value(8) == '0'
        encoded_row_pixels = [encoded_row_pixels, 'A'];
    else
        encoded_row_pixels = [encoded_row_pixels, 'G'];
    end;
end;