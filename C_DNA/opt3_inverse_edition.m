%% This is the key point of the whole algorithm

function [c] = opt3_inverse_edition(a, b)

c = '';

if a == 'A' && b == 'C'
    c = 'A';
elseif a == 'A' && b == 'A'
    c = 'T';
elseif a == 'A' && b == 'G'
    c = 'C';
elseif a == 'A' && b == 'T'
    c = 'G';
elseif a == 'T' && b == 'G'
    c = 'A';
elseif a == 'T' && b == 'C'
    c = 'T';
elseif a == 'T' && b == 'T'
    c = 'C';
elseif a == 'T' && b == 'A' 
    c = 'G';
elseif a == 'C' && b == 'A'
    c = 'A';
elseif a == 'C' && b == 'T'
    c = 'T';
elseif a == 'C' && b == 'C'
    c = 'C';
elseif a == 'C' && b == 'G'
    c = 'G';
elseif a == 'G' && b == 'T'
    c = 'A';
elseif a == 'G' && b == 'G'
    c = 'T';
elseif a == 'G' && b == 'A'
    c = 'C';
elseif a == 'G' && b == 'C'
    c = 'G';
end;