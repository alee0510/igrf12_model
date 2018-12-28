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
N=zeros(size(a,b));
E=zeros(size(a,b));
D=zeros(size(a,b));
mB_NED=zeros(size(a,b)); %mb is magnitude of B
%coordinates transformation
for phi=-180:179 %phi = longitude
    for teta=-89:90 %teta = lattitude
        N(phi+181,teta+90)=-(Bt(phi+181,teta+90)*c)...
            -(Br(phi+181,teta+90)*s);
        E(phi+181,teta+90)=Bp(phi+181,teta+90);
        D(phi+181,teta+90)=(Bt(phi+181,teta+90)*s)-...
            (Br(phi+181,teta+90)*c);
        mB_NED(phi+181,teta+90)=((N(phi+181,teta+90)^2)+...
            (E(phi+181,teta+90)^2)+(D(phi+181,teta+90)^2))^0.5;
    end
end
%-------------------------------------------------------------------------%
%save data
save('B_NED','N','E','D','mB_NED','-v7.3')
%-------------------------------------------------------------------------%