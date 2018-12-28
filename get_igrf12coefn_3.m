%-------------------------------------------------------------------------%
%This program use to calculate data from igrf2015.xlsx file after editing
%source from : https://www.ngdc.noaa.gov/geomag/data.shtml
%   nomeclature symbol :
%   g and h is gaussian coef from data
%   n is orde, for this case, n=13
%   m is degree,
%   d is delta-Kronecer, which : d=1 if n=m and d=0,else
%   SQN = Schimdt-quasi Normalization
%data after normalization save to excel file and .mat file v7.3
%-------------------------------------------------------------------------%
%Import data
[num,txt,raw]=xlsread('igrf12coeffs.xls'); %base on igrf2015 data in excel
igrf2015=raw;
save('igrf2015.mat','igrf2015', '-v7.3'); %save data in mat-file
disp(igrf2015); %display result

%splitting data
gh=igrf2015(5:end,1);
a =igrf2015(5:end,2);  %n
b =igrf2015(5:end,3);  %m
c =igrf2015(5:end,27); %IGRF
d =igrf2015(5:end,28); %sv=scular variation

%convert cell format to double mat file
n=cell2mat(a);
m=cell2mat(b);
igrf=cell2mat(c);
sv=cell2mat(d);
%-------------------------------------------------------------------------%
%make initial value
N=max([a{:}]); %max value for data type : array
g=zeros(N,N+1);
h=zeros(N,N+1);
gsv=zeros(N,N+1);
hsv=zeros(N,N+1);

%split data to matrix with dimention (N,N+1) or for n=13,(13,14)
for i=1:length(n)
    if strcmp(gh(i),'g') %if gh have value string g
        g(n(i),(m(i)+1))=igrf(i);
        gsv(n(i),(m(i)+1))=sv(i);
    else
        h(n(i),(m(i)+1))=igrf(i);
        hsv(n(i),(m(i)+1))=sv(i);
    end
end
disp(g); disp(h); disp(gsv); disp(hsv);
%-------------------------------------------------------------------------%
%schimdt quasi-normalizarion equation
%make initial vector value
N=max(n);
s=zeros(N,N+1);
for k=1:N %orde n
    for l=0:k %degree m
        if l==0 %m=0
            if k==1 %n=1
                s(k,l+1)=1;
            else %n>1
                s(k,l+1)=s(k-1,l+1)*(((2*k)-1)/k);
            end
        elseif l==1 %m=1
            s(k,l+1)=s(k,l)*(((2*k)/(1+k))^0.5);
        else %m>1
            s(k,l+1)=s(k,l)*(((k-l+1)/(k+l))^0.5);
        %schimdt-quasi normalization coef
        end
    end
end
disp(s);
save('s_coef.mat','s','n','m','igrf','sv','-v7.3');
%-------------------------------------------------------------------------%
%normaliztion data with schmidt quasi-normalization
baris=1;
N=max(n);
for i=1:N %orde n
    for j=0:i %degree m
        %for coeficien g
        gsn(baris,1)=i;
        gsn(baris,2)=j;
        gsn(baris,3)=(s(i,j+1))*(g(i,j+1));
        gsn(baris,4)=(s(i,j+1))*(gsv(i,j+1));
        %for coeficien h
        hsn(baris,1)=i;
        hsn(baris,2)=j;
        hsn(baris,3)=(s(i,j+1))*(h(i,j+1));
        hsn(baris,4)=(s(i,j+1))*(hsv(i,j+1));
        baris=baris+1;
    end
end
%-------------------------------------------------------------------------%
%Save Data
save('gh_norm_dat.mat','gsn','hsn','-v7.3'); %save data
GH = 'gh_norm_dat.xlsx';
xlswrite(GH,gsn,1);
xlswrite(GH,hsn,2);
%display data to workspace
disp(gsn);
disp(hsn);
%-------------------------------------------------------------------------%