% function mem_data
addpath('tools');
addpath('images');
addpath('C_DNA');
clear
data{1,6} = [];
data{10,6} = [];
for i = 1:6
    switch i
        case 1
            data{1,i} = 'lena.jpg';
        case 2
            data{1,i} = 'cameraman.jpg';
        case 3
            data{1,i} = 'circuit.jpg';
        case 4
            data{1,i} = 'peppers.tiff';
        case 5
        	data{1,i} = 'barbara.tif';
        otherwise
            data{1,i} = 'aerial.png';
	end
    data{2,i} = imread(data{1,i});                          %   P
    [r,c] = size(data{2,i});  rc = r*c;
    data{3,i} = hyper_chaotic_system(rc);                   %   k_HC_DNA
    data{4,i} = hyper_chaotic_DNA(data{3,i},data{2,i},'A'); %   Q_HC_DNA
    
    data{5,i} = Encryption(data{2,i});                      %   Q_C_DNA
    
    data{6,i} = CDCP_chaos(rc);                             %   k_CDCP
    data{7,i} = CDCP_encrypt(data{2,i},data{6,i},52);       %   Q_CDCP
    
    data{8,i} = CHC_chaos(rc);                              %   k_CHC
    data{9,i} = uint8(CHC_encrypt(data{2,i},data{8,i},74)); % 	Q_CHC    
%____________    

    clear Q1 T key_image c r rc
end
clear i
save data_in_mem