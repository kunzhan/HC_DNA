function [changed_image] = change_one_bit()

p = imread('cameraman.tif');
p = double(p);

hpos = ceil(unifrnd(0, 1, 1) * 256);
vpos = ceil(unifrnd(0, 1, 1) * 256);

if p(hpos, vpos) ~= 255
    p(hpos, vpos) = p(hpos, vpos) + 1;
else
    p(hpos, vpos) = p(hpos, vpos) - 1;
end;

changed_image = p;

changed_image = uint8(changed_image);
imwrite(changed_image, 'cameraman_changed.bmp', 'bmp');