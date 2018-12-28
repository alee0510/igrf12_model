%-------------------------------------------------------------------------%
load s_coef s
%-------------------------------------------------------------------------%
% editing coef schmidt quasi-normalization
baris=1;
N=13;
for n=1:N %orde n
    for m=0:n %degree m
        scoef(baris,1)=n;
        scoef(baris,2)=m;
        scoef(baris,3)=s(n,m+1);
        baris=baris+1;
    end
end
%-------------------------------------------------------------------------%
% save data
save('coef_S.mat','scoef','-v7.3');
S = 'coef_S.xlsx';
xlswrite(S,scoef,1);
%-------------------------------------------------------------------------%