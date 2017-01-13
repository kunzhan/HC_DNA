function [black, white] = generate_all_black_and_all_white()
black = zeros(256, 256);
white = zeros(256, 256);

for i = 1:256*256
    black(i) = 0;
end;
black = uint8(black);
imwrite(black, 'pic/black.bmp', 'bmp');

for i = 1:256*256
    white(i) = 255;
end;
white = uint8(white);
imwrite(white, 'pic/white.bmp', 'bmp');