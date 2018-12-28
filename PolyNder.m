%-------------------------------------------------------------------------%
% ASSOCIATED LEGENDRE POLYNOMIALS AND FIRST DERIVATIVE TEST 
% this program build to validate the value of legendre equation
%-------------------------------------------------------------------------%
teta=30; % latitude
%-------------------------------------------------------------------------%
%co-latitude, convert from degree to radian
colat=90-teta; %co-latitude
nLat=colat*0.017453292519943; %co-latitude, convert to radian
s1=sin(nLat); c1=cos(nLat);
%-------------------------------------------------------------------------%
C=1; %for case n=0, p(0,m)=1;
N=13;
P2=zeros(N,N+1); % associated legendre polynomials
dP2=zeros(N,N+1); % first derivative of associated legendre polynomials
for n=1:N
    for m=0:n
        if n==1 && m==0
            P2(n,m+1)=c1;
            dP2(n,m+1)=-s1;
        elseif n==1 && m==1
            P2(n,m+1)=s1;
            dP2(n,m+1)=c1;
        elseif n==m % n>1 & m>1
            P2(n,m+1)=s1*P2(n-1,m);
            dP2(n,m+1)=(s1*dP2(n-1,m))+(c1*P2(n-1,m));
        else % n>1 & m>1
            k=(((n-1)^2)-m^2)/(((2*n)-1)*((2*n)-3));
            if n==2
                P2(n,m+1)=c1*P2(n-1,m+1)-k*C;
                dP2(n,m+1)=(c1*dP2(n-1,m+1))-(s1*P2(n-1,m+1));
            else %n>3
                P2(n,m+1)=c1*P2(n-1,m+1)-k*P2(n-2,m+1);
                dP2(n,m+1)=(c1*dP2(n-1,m+1))-(s1*P2(n-1,m+1))...
                    -(k*dP2(n-2,m+1));
            end
        end        
    end
end
%-------------------------------------------------------------------------%
save('polyNder02.mat','P2','dP2','-v7.3');
%-------------------------------------------------------------------------%