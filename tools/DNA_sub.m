function K = DNA_sub(D1,D2)
% K = D2 - D1
if D1=='A' && D2=='A';
    K = 'A';
elseif D1=='G' && D2=='G';
    K = 'A';
elseif D1=='C' && D2=='C';
    K = 'A';
elseif D1=='T' && D2=='T';
    K = 'A';
elseif D1=='A' && D2=='G';
    K = 'G';
elseif D1=='G' && D2=='C';
    K = 'G';
elseif D1=='C' && D2=='T';
    K = 'G';
elseif D1=='T' && D2=='A';
    K = 'G';
elseif D1=='A' && D2=='C';
    K = 'C';
elseif D1=='G' && D2=='T';
    K = 'C';
elseif D1=='C' && D2=='A';
    K = 'C';
elseif D1=='T' && D2=='G';
    K = 'C';
elseif D1=='A' && D2=='T';
    K = 'T';
elseif D1=='G' && D2=='A';
    K = 'T';
elseif D1=='C' && D2=='G';
    K = 'T';
elseif D1=='T' && D2=='C';
    K = 'T';
end