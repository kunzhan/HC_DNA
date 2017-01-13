function [c] = opt1(a, b)

c = '';

if a == 'A' && b == 'A'
    c = 'A';
elseif a == 'A' && b == 'T' || a == 'T' && b == 'A'
    c = 'T';
elseif a == 'A' && b == 'C' || a == 'C' && b == 'A'
    c = 'C';
elseif a == 'A' && b == 'G' || a == 'G' && b == 'A'
    c = 'G';
elseif a == 'T' && b == 'C' || a == 'C' && b == 'T'
    c = 'G';
elseif a == 'T' && b == 'G' || a == 'G' && b == 'T'
    c = 'C';
elseif a == 'C' && b == 'G' || a == 'G' && b == 'C'
    c = 'T';
elseif a == 'T' && b == 'T'
    c = 'A';
elseif a == 'C' && b == 'C'
    c = 'A';
elseif a == 'G' && b == 'G'
    c = 'A';
end;