%-------------------------------------------------------------------------%
% This program use to generating data Earth Magnetic Field at n-altitude
% in Local Tangent Coordinated, unit = nT
%   nomelature symbol
%   Re = Earth's Radius
%   d = day fraction after epoch 1 January 2000
%   r = altitude
%   Bx,By,Bz = Magnetic Field Component at x=r, y=teta, z=phi, direction
%   phi = longitude, teta = latitude
% OUTPUT :
%   X = N = North component
%   Y = E = East component
%   Z = D = Down component
%   F = Total intensity 
% Source : adabted code with IGRF11 Matlab Code By Charles Rino
%          The USUK World Magnetic Model for 2015-2020
%-------------------------------------------------------------------------%
clc;
eps=0;
%deg to rad
e=eps*0.017453292519943;
c=cos(e); s=sin(e);
%-------------------------------------------------------------------------%
%Initial Condition for looping
%load data after generating data in local tangent coordinate
load B_LTC Br Bt Bp
%Bx=Br, By=Bt, Bz=Bp;
%-------------------------------------------------------------------------%
%initial value
a=length([-180:179]);
b=length([-89:90]);
X=zeros(size(a,b));
Y=zeros(size(a,b));
Z=zeros(size(a,b));
F=zeros(size(a,b)); %mb is magnitude of B
%coordinates transformation
for phi=-180:179 %phi = longitude
    for teta=-89:90 %teta = lattitude
        X(phi+181,teta+90)=-(Bt(phi+181,teta+90)*c)...
            -(Br(phi+181,teta+90)*s);
        Y(phi+181,teta+90)=Bp(phi+181,teta+90);
        Z(phi+181,teta+90)=(Bt(phi+181,teta+90)*s)-...
            (Br(phi+181,teta+90)*c);
        F(phi+181,teta+90)=((X(phi+181,teta+90)^2)+...
            (Y(phi+181,teta+90)^2)+(Z(phi+181,teta+90)^2))^0.5;
        %total intensity
    end
end
%-------------------------------------------------------------------------%
%save data
save('B_XYZF','X','Y','Z','F','-v7.3')
%-------------------------------------------------------------------------%