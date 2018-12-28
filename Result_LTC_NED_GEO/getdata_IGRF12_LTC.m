%-------------------------------------------------------------------------%
% This program use to generating data Earth Magnetic Field at n-altitude
% in Local Tangent Coordinated
%   nomelature symbol
%   Re = Earth's Radius
%   d = day fraction after epoch 1 January 2000
%   r = altitude
%   Bx,By,Bz = Magnetic Field Component at x=r, y=teta, z=phi, direction
%   phi = longitude, teta = latitude
% Source : adabted code with IGRF11 Matlab Code By Charles Rino
%-------------------------------------------------------------------------%
clc;
%Generating Data
%Initial Value
Re=6378.148; %km
r=Re+630; %in Km
dfy=17.7265;
%-------------------------------------------------------------------------%
%Initial Condition for looping
a=length([-180:179]);
b=length([-89:90]);
B=zeros(size(a,b));
Br=zeros(size(a,b));
Bt=zeros(size(a,b));
Bp=zeros(size(a,b));
mB=zeros(size(a,b)); %mb is magnitude of B
for phi=-180:179 %phi = longitude
    for teta=-89:90 %teta = lattitude
        B=Earth_MagField_may16_Rev4(r,teta,phi,dfy);
        Br(phi+181,teta+90)=B(1);
        Bt(phi+181,teta+90)=B(2);
        Bp(phi+181,teta+90)=B(3);
        mB(phi+181,teta+90)=((B(1)^2)+(B(2)^2)+(B(3)^2))^0.5;
    end
end
%-------------------------------------------------------------------------%
%save data
save('B_LTC.mat','B','Br','Bt','Bp','mB','-v7.3')
%-------------------------------------------------------------------------%