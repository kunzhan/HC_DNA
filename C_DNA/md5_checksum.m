function [checksum] = md5_checksum() %% Hex_value is a 128 digital hex.

% if hex_value == ''
%     hex_value = '6b679b3c77826d30a79e612114a8c18d'; %% LENA
% hex_value = 'a9667a0d89dfe423f8fe528a9d04c925'; %% *bird.bmp
% hex_value = '3e9179f117000e17169e78612c04a8c2'; %% *boat.bmp
% hex_value = '9bfbb4fe40220fc8f0550fa3cb7844a4'; %% *brain.bmp
% hex_value = '16d071c746b7d73a50366ce14f23d816'; %% *finger.bmp
% hex_value = '3b509a4bb50654c11525b0b3557a9dc1'; %% *house.bmp
% hex_value = '6b679b3c77826d30a79e612114a8c18d'; %% *lena.bmp
% hex_value = 'e1260426f8ad583d2d293d12d61cbe60'; %% *moon.bmp
 hex_value = 'b99c39b258db27de160f4eec330cda97'; %% *peppers.bmp
% hex_value = 'ac2652f8d21f22e584fff9d00ed9e070'; %% *plane.bmp


% hex_value = '91a3957bda8aabad819756f062000f57'; %% *black.bmp
% hex_value = '7332703c8718bf378a6bfbb37d70f262'; %% *white.bmp

% hex_value = '6987a501f7eba02fd0660906f3609a2c'; %%*bird_changed.bmp
% hex_value = '4044bc53ff3c5913302d35041c73514d'; %%*boat_changed.bmp
% hex_value = 'a8618543b11c6ca37b59341447f2af7f'; %%*finger_changed.bmp
% hex_value = 'dbf9a01916a00711b4787253fd270caa'; %%*house_changed.bmp
% hex_value = '2142bd30bfd200bb745d6f8c4b4102ba'; %%*lena_changed.bmp
% hex_value = '59e221d92c87e68d6e3b38bfa97188a5'; %%*moon_changed.bmp
% hex_value = '8d0d51cbbad8c1e50b0de2a20bd393f7'; %%*plane_changed.bmp
% hex_value = 'c2b4e1cd699b4dfd51593ad2dd482edc'; %%*peppers_changed.bmp
% else
%     hex_value;
% end;
%% generate a 128 binary bits
hex_value_dec = hex2dec(hex_value);
hex_value_bin = dec2bin(hex_value_dec, 128);

%% use the first 32 bits of 128 bits to obtain a initial value
d1 = bin2dec(hex_value_bin(1:8));
% hex_value_bin(1:8)
d2 = bin2dec(hex_value_bin(9:16));
d3 = bin2dec(hex_value_bin(17:24));
d4 = bin2dec(hex_value_bin(25:32));
% hex_value_bin(25:32)

%% Attention to the precision of the initial value of x, when decrypt the cipher image.
checksum = mod( (bitxor( bitxor( bitxor(d1, d2), d3), d4)), 256) / 255;
