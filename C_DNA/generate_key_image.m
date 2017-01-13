%%piecewise linear chaotic map (PWLCM)
%%Generate a M*N size key image by using Chaos map.
function [key_image] = generate_key_image(initial_value_of_x,M,N)
% M = 256;
% N = 256;
key_image = zeros(M, N);
x = pwlcm(initial_value_of_x);

for i = 1:M*N
        key_image(i) = floor(256 * x);
        x = pwlcm(x);
end;
% key_image;