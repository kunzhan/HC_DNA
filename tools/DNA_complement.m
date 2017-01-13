function d = DNA_complement(d,w,mn)
for i = 1:mn*4
    if w(i)==1       
        if d(i)=='A'
            d(i)='T';
        elseif d(i)=='T'
            d(i)='A';
        elseif d(i)=='C'
            d(i)='G';
        elseif d(i)=='G'
            d(i)='C';
        end        
    end
end