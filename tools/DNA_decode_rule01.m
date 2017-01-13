function b = DNA_decode_rule01(d,mn)
b = [];
k = [];
for i=1:mn*4   
    if d(i)=='A';
        k = '00';
    elseif d(i)=='C';
        k = '01';  
    elseif d(i)=='G';
        k = '10';
    elseif d(i)=='T';     
        k = '11';
    end
    b = [b k];
end
% P = b2dec(b,mn);