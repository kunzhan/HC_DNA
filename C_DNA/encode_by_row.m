function [encoded_row_pixels] = encode_by_row(RULE, plain_row_pixels)

switch RULE
    case 1
        encoded_row_pixels = rule1(plain_row_pixels);
    case 2
        encoded_row_pixels = rule2(plain_row_pixels);
    case 3
        encoded_row_pixels = rule3(plain_row_pixels);
    case 4
        encoded_row_pixels = rule4(plain_row_pixels);
    case 5
        encoded_row_pixels = rule5(plain_row_pixels);
    case 6
        encoded_row_pixels = rule6(plain_row_pixels);
    case 7
        encoded_row_pixels = rule7(plain_row_pixels);
    case 8
        encoded_row_pixels = rule8(plain_row_pixels);
end;
        