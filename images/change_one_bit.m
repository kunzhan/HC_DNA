for i = 1:6
    switch i
        case 1
            name = 'lena';
            p = [name '.jpg'];        
        case 2
            name = 'cameraman.jpg';
            p = [name '.jpg'];    
        case 3
            name = 'circuit.jpg';
            p = [name '.jpg'];    
        case 4
            name = 'peppers.tiff';
            p = [name '.tiff'];    
        case 5
            name = 'barbara';
            p = [name '.tif'];
        otherwise
            name = 'aerial.png';
            p = [name '.png'];
    end
    P = imread(p);
    [m,n] = size(P);
    for k = 1:10
        M = ceil(unifrnd(0, 1, 1) * m);
        N = ceil(unifrnd(0, 1, 1) * n);
        P1 = P;
        if P(M, N) ~= 255
            P1(M, N) = P(M, N) + 1;
        else
            P1(M, N) = P(M, N) - 1;
        end
        imwrite(P1, [name '_m_' num2str(M) '_n_' num2str(M)  '.bmp'], 'bmp');
    end
  end