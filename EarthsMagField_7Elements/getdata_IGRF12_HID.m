%-------------------------------------------------------------------------%
% This program use to generating data Earth Magnetic Field at n-altitude
% in 7 elements, unit = nT
%   X = N = North component
%   Y = E = East component
%   Z = D = Down component
%   H = Horizontal intensity 
%   F = Total intensity 
%   I = Inclination 
%   D = Declination 
% Source : The USUK World Magnetic Model for 2015-2020
%-------------------------------------------------------------------------%
load B_XYZF X Y Z
%-------------------------------------------------------------------------%
%initial value
a=length([-180:179]);
b=length([-89:90]);
H=zeros(size(a,b));
I=zeros(size(a,b));
D=zeros(size(a,b));
mB_NED=zeros(size(a,b)); %mb is magnitude of B
%coordinates transformation
for phi=-180:179 %phi = longitude
    for teta=-89:90 %teta = lattitude
        H(phi+181,teta+90)=(((X(phi+181,teta+90))^2)+...
            ((Y(phi+181,teta+90))^2))^0.5;
        I(phi+181,teta+90)=atan2d((Z(phi+181,teta+90)),(H(phi+181,teta+90)));
        D(phi+181,teta+90)=atan2d((Y(phi+181,teta+90)),(X(phi+181,teta+90)));
    end
end
%-------------------------------------------------------------------------%
%save data
save('B_HID','H','I','D','-v7.3')
%-------------------------------------------------------------------------%