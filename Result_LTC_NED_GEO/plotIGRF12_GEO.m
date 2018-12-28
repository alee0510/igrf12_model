%-------------------------------------------------------------------------%
%This program use to ploting data Earth Magnetic Field at n-altitude
% in Geocentric Coordinated (GEO), unit in nT
% Plot data magnetic field at x altitude
%   data IGRF12
%   n=13, degree
%   m=0,1,2...,n, orde'
% Source : adabted code with IGRF11 Matlab Code By Charles Rino
%-------------------------------------------------------------------------%
load B_GEO Bx By Bz mB_GEO %load data
%-------------------------------------------------------------------------%
Blong=-180:179;
Blat=-89:90;
LINESPEC='w';
%-------------------------------------------------------------------------%
%-----------------------------X Direction----------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],Bx') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('X Direction (X) nT at h=630km in GEO')
% with contour line
figure
imagesc(Blong,Blat,Bx')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('X Direction (X) nT at h=630km in GEO')
hold on
[cs,h]=contour(Blong,Blat,Bx',20,LINESPEC); 
%-------------------------------------------------------------------------%
%------------------------------Y Direction-----------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],By') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Y Direction (Y) nT at h=630km in GEO')
% with contour line
figure
imagesc(Blong,Blat,By')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Y Direction (Y) nT at h=630km in GEO')
hold on
[cs,h]=contour(Blong,Blat,By',20,LINESPEC); 
%-------------------------------------------------------------------------%
%------------------------------Z Direction-----------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],Bz') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Z Direction (Z) nT at h=630km in GEO')
% with contour line
figure
imagesc(Blong,Blat,Bz')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Z Direction (Z) nT at h=630km in GEO')
hold on
[cs,h]=contour(Blong,Blat,Bz',20,LINESPEC); 
%-------------------------------------------------------------------------%
%-----------------------------Total Intensity-----------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],mB_GEO') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Total Intensity (F) nT at h=630km in GEO')
% with contour line
figure
imagesc(Blong,Blat,mB_GEO')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Total Intensity (F) nT at h=630km in GEO')
hold on
[cs,h]=contour(Blong,Blat,mB_GEO',20,LINESPEC); 
%-------------------------------------------------------------------------%
%--------------------------------END--------------------------------------%