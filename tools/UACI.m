function ucai = UACI(C1,C2)
ucai = sum(sum(abs(double(C1)-double(C2))))./255./numel(C1);
