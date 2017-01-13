clear
addpath('tools');
addpath('images');
addpath('C_DNA');

load data_in_mem
NPCR_hc_dna = zeros(6,10);
UACI_hc_dna = NPCR_hc_dna;
NPCR_c_dna  = NPCR_hc_dna;
UACI_c_dna  = NPCR_hc_dna;
NPCR_cdcp   = NPCR_hc_dna;
UACI_cdcp   = NPCR_hc_dna;
NPCR_chc    = NPCR_hc_dna;
UACI_chc    = NPCR_hc_dna;
for i = 1:6
    switch i
        case 1
            name = 'lena';
            p = [name '.jpg'];
        case 2
            name = 'cameraman';
            p = [name '.jpg'];    
        case 3
            name = 'circuit';
            p = [name '.jpg'];    
        case 4
            name = 'peppers';
            p = [name '.tiff'];    
        case 5
            name = 'barbara';
            p = [name '.tif'];
        otherwise
            name = 'aerial';
            p = [name '.png'];
    end
    P = imread(p);
    [m,n] = size(P);
    for k = 1:100
        M = ceil(unifrnd(0, 1, 1) * m);
        N = ceil(unifrnd(0, 1, 1) * n);
        P1 = P;
        if P(M, N) ~= 255
            P1(M, N) = P(M, N) + 1;
        else
            P1(M, N) = P(M, N) - 1;
        end
        Q_HC_DNA = uint8(hyper_chaotic_DNA(data{3,i},P1,'A'));
        NPCR_hc_dna(i,k) = NPCR(Q_HC_DNA,data{4,i});
        UACI_hc_dna(i,k) = UACI(Q_HC_DNA,data{4,i});
        
        Q_C_DNA = uint8(Encryption(P1));
        NPCR_c_dna(i,k) = NPCR(Q_C_DNA,data{5,i});
        UACI_c_dna(i,k) = UACI(Q_C_DNA,data{5,i});
        
        Q_CDCP = uint8(CDCP_encrypt(P1, data{6,i},52));
        NPCR_cdcp(i,k) = NPCR(Q_CDCP,data{7,i});
        UACI_cdcp(i,k) = UACI(Q_CDCP,data{7,i});
        
        Q_CHC = uint8(CHC_encrypt(P1,data{8,i},72));
        NPCR_chc(i,k) = NPCR(Q_CHC,data{9,i});
        UACI_chc(i,k) = UACI(Q_CHC,data{9,i});
%         imwrite(P1, ['images_NPCR_UACI/' name '_m_' num2str(M) '_n_' num2str(M)  '.bmp'], 'bmp');
    end
  end