function [x] = pwlcm(x0)
p = 0.25678900;
% p = 0.25678900 + 0.0000000000000001;
if (x0 > 0) && (x0 < p)
    x = x0 / p;
elseif (x0 >= p) && (x0 < 0.5)
    x = (x0 - p) / (0.5 - p);
elseif (x0 >= 0.5) && (x0 < 1)
    x = pwlcm(1 - x0);
end