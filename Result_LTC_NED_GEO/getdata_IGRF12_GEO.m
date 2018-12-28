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
alp=107.611099;
dec=0;
%deg to rad
a=alp*0.017453292519943;
d=dec*0.017453292519943;
ca=cos(a); sa=sin(a);
cd=cos(d); sd=sin(d);
%-------------------------------------------------------------------------%
%Initial Condition for looping
%load data after generating data in local tangent coordinate
load B_LTC Br Bt Bp
%Bx=Br, By=Bt, Bz=Bp;
%-------------------------------------------------------------------------%
%initial value
a=length([-180:179]);
b=length([-89:90]);
Bx=zeros(size(a,b));
By=zeros(size(a,b));
Bz=zeros(size(a,b));
mB_GEO=zeros(size(a,b)); %mb is magnitude of B
%coordinates transformation
for phi=-180:179 %phi = longitude
    for teta=-89:90 %teta = lattitude
        Bx(phi+181,teta+90)=(Br(phi+181,teta+90)*cd+Bt(phi+181,teta+90)*sd)*ca...
            -Bp(phi+181,teta+90)*sa;
        By(phi+181,teta+90)=(Br(phi+181,teta+90)*cd+Bt(phi+181,teta+90)*sd)*sa...
            +Bp(phi+181,teta+90)*ca;
        Bz(phi+181,teta+90)=Br(phi+181,teta+90)*sd+Bt(phi+181,teta+90)*cd;
        mB_GEO(phi+181,teta+90)=((Bx(phi+181,teta+90)^2)+...
            (By(phi+181,teta+90)^2)+(Bz(phi+181,teta+90)^2))^0.5;
    end
end
%-------------------------------------------------------------------------%
%save data
save('B_GEO','Bx','By','Bz','mB_GEO','-v7.3')
%-------------------------------------------------------------------------%