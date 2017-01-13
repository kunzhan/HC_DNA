function flag = isEqual(image1, image2)

M = 256;
N = 256;
flag = 0;
for i = 1:M*N
    if image1(i) ~= image2(i)
        flag = flag + 1;
    else
        flag = flag + 0;
    end;
end;
flag