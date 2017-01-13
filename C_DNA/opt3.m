function [c] = opt3(a, b)

c = '';

if a == 'A' && b == 'A'
    c = 'C';
elseif a == 'A' && b == 'T'
    c = 'A';
elseif a == 'T' && b == 'A'
    c = 'G';
elseif a == 'A' && b == 'C'
    c = 'G';
elseif a == 'C' && b == 'A'
    c = 'A';
elseif a == 'A' && b == 'G' || a == 'G' && b == 'A'
    c = 'T';
elseif a == 'T' && b == 'C' || a == 'C' && b == 'T'
    c = 'T';
elseif a == 'T' && b == 'G' 
    c = 'A';
elseif a == 'G' && b == 'T'
    c = 'G';
elseif a == 'C' && b == 'G'
    c = 'G';
elseif a == 'G' && b == 'C'
    c = 'A';
elseif a == 'T' && b == 'T'
    c = 'C';
elseif a == 'C' && b == 'C'
    c = 'C';
elseif a == 'G' && b == 'G'
    c = 'C';
end;