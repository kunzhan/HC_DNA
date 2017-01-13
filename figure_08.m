% function table_09
clear
load data_in_mem
Q_HC_DNC = data{4,1};
Q_C_DNC = data{5,1};
Q_CDCP = data{7,1};
Q_CHC = data{9,1};

gamma_h_HC_DNA = zeros(3,1);
uaci_HC_DNA = gamma_h_HC_DNA;
npcr_HC_DNA = gamma_h_HC_DNA;

gamma_h_C_DNA = gamma_h_HC_DNA;
uaci_C_DNA = gamma_h_HC_DNA;
npcr_C_DNA = gamma_h_HC_DNA;

gamma_h_CDCP = gamma_h_HC_DNA;
uaci_CDCP = gamma_h_HC_DNA;
npcr_CDCP = gamma_h_HC_DNA;

gamma_h_CHC = gamma_h_HC_DNA;
uaci_CHC = gamma_h_HC_DNA;
npcr_CHC = gamma_h_HC_DNA;
for d = 1:3
    Q1 = Q_HC_DNC;
    if d == 1
        Q1(65:192,65:192) = 0;
    end
    if d == 2
        Q1(1:32,1:256) = 0;
        Q1(225:256,1:256) = 0;
    end
    if d == 3
        Q1(1:256,1:32) = 0;
        Q1(1:256,225:256) = 0;
    end
    subplot(5,3,d),imshow(uint8(Q1))
    P = inverse_hyper_chaotic_DNA(Q1,data{3,1},'A');
	subplot(5,3,d+3),imshow(uint8(P))
    gamma_h_HC_DNA(d) = corr_horizontal(P);
    uaci_HC_DNA(d) = UACI(P,data{2,1});
    npcr_HC_DNA(d) = NPCR(P,data{2,1});
    
    Q1 = Q_C_DNC;
    if d == 1
        Q1(65:192,65:192) = 0;
    end
    if d == 2
        Q1(1:32,1:256) = 0;
        Q1(225:256,1:256) = 0;
    end
    if d == 3
        Q1(1:256,1:32) = 0;
        Q1(1:256,225:256) = 0;
    end
    P = Decryption(Q1);
    subplot(5,3,d+6),imshow(uint8(P))
    gamma_h_C_DNA(d) = corr_horizontal(P);
    uaci_C_DNA(d) = UACI(P,data{2,1});
    npcr_C_DNA(d) = NPCR(P,data{2,1});
    
    Q1 = Q_CDCP;
    if d == 1
        Q1(65:192,65:192) = 0;
    end
    if d == 2
        Q1(1:32,1:256) = 0;
        Q1(225:256,1:256) = 0;
    end
    if d == 3
        Q1(1:256,1:32) = 0;
        Q1(1:256,225:256) = 0;
    end
    P = CDCP_decrypt(data{6,1},52,Q1);
    subplot(5,3,d+9),imshow(uint8(P))
    gamma_h_CDCP(d) = corr_horizontal(P);
    uaci_CDCP(d) = UACI(P,data{2,1});
    npcr_CDCP(d) = NPCR(P,data{2,1});
    
    Q1 = Q_CHC;
    if d == 1
        Q1(65:192,65:192) = 0;
    end
    if d == 2
        Q1(1:32,1:256) = 0;
        Q1(225:256,1:256) = 0;
    end
    if d == 3
        Q1(1:256,1:32) = 0;
        Q1(1:256,225:256) = 0;
    end
    P = CHC_decrypt(data{8,1},74,double(Q1));
    subplot(5,3,d+12),imshow(uint8(P))
    gamma_h_CHC(d) = corr_horizontal(P);
    uaci_CHC(d) = UACI(P,data{2,1});
    npcr_CHC(d) = NPCR(P,data{2,1});
end
