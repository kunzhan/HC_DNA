function [npcr]= NPCR(C1,C2)
[~,a] = find(C1(:) ~= C2(:));
npcr = sum(a)./numel(C1);