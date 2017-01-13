function d = DNA_encode_rule03(k,mn)
% k = k(1,5:8:end);
k = k(1,1:mn);
d   =  [];
d1  =  [];
d2  =  [];
d3  =  [];
d4  =  [];
for i = 1:mn   
    x = dec2base(k(i),2,8);
    if x(1) == '0' && x(2) == '1';    
        d1 = 'A';
    elseif x(1) == '0' && x(2) == '0';
        d1 = 'C';  
    elseif x(1) == '1' && x(2) == '1';
        d1 = 'G';
    elseif x(1) == '1' && x(2) == '0';     
        d1 = 'T';
    end
    if x(3)== '0' && x(4)== '1';    
        d2 = 'A';
    elseif x(3) == '0' && x(4) == '0';
        d2 = 'C';        
    elseif x(3) == '1' && x(4) == '1';
        d2 = 'G';
    elseif x(3) == '1' && x(4) == '0';     
        d2 = 'T';
    end   
    if x(5)== '0' && x(6)== '1';    
        d3 = 'A';
    elseif x(5)== '0' && x(6)== '0';
        d3 = 'C';        
    elseif x(5)== '1' && x(6)== '1';
        d3 = 'G';
    elseif x(5)== '1' && x(6)== '0';     
        d3 = 'T';
    end    
    if x(7)== '0' && x(8)== '1';    
        d4 = 'A';
    elseif x(7) == '0' && x(8) == '0';
        d4 = 'C';        
    elseif x(7) == '1' && x(8) == '1';
        d4 = 'G';
    elseif x(7) == '1' && x(8) == '0';     
        d4 = 'T';
    end   
  d = [d d1 d2 d3 d4];
end