%-------------------------------------------------------------------------%
%This program use to ploting data Earth Magnetic Field at n-altitude
% in Local Tangent Coordinated
% Plot data magnetic field at x altitude
%   data IGRF12
%   n=13, degree
%   m=0,1,2...,n, orde'
% in 7 elements :
%   X = N = North component
%   Y = E = East component
%   Z = D = Down component
%   H = Horizontal intensity 
%   F = Total intensity 
%   I = Inclination 
%   D = Declination 
% Source : adabted code with IGRF11 Matlab Code By Charles Rino
%          The USUK World Magnetic Model for 2015-2020
%-------------------------------------------------------------------------%
load B_XYZF X Y Z F %load data
load B_HID H I D
%-------------------------------------------------------------------------%
Blong=-180:179;
Blat=-89:90;
LINESPEC='w';
%-------------------------------------------------------------------------%
%-----------------------------North Component-----------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],X') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('North Component (X) nT at h=630km')
% with contour line
figure
imagesc(Blong,Blat,X')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('North Component (X) nT at h=630km')
hold on
[cs,h]=contour(Blong,Blat,X',20,LINESPEC); 
%-------------------------------------------------------------------------%
%-----------------------------East Component------------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],Y') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('East Component (Y) nT at h=630km')
% with contour line
figure
imagesc(Blong,Blat,Y')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('East Component (Y) nT at h=630km')
hold on
[cs,h]=contour(Blong,Blat,Y',20,LINESPEC); 
%-------------------------------------------------------------------------%
%-----------------------------Down Component------------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],Z') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Down Component (Z) nT at h=630km')
% with contour line
figure
imagesc(Blong,Blat,Z')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Down Component (Z) nT at h=630km')
hold on
[cs,h]=contour(Blong,Blat,Z',20,LINESPEC); 
%-------------------------------------------------------------------------%
%-----------------------------Total Intensity-----------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],F') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Total Intensity (F) nT at h=630km')
% with contour line
figure
imagesc(Blong,Blat,F')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Total Intensity (F) nT at h=630km')
hold on
[cs,h]=contour(Blong,Blat,F',20,LINESPEC); 
%-------------------------------------------------------------------------%
%---------------------------Horizontal Intensity--------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],H') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Horizontal Intensity (H) nT at h=630km')
% with contour line
figure
imagesc(Blong,Blat,H')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Horizontal Intensity (H) nT at h=630km')
hold on
[cs,h]=contour(Blong,Blat,H',20,LINESPEC); 
%-------------------------------------------------------------------------%
%-------------------------------Inclination-------------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],I') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Inclination (I) nT at h=630km')
% with contour line
figure
imagesc(Blong,Blat,I')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Inclination (I) nT at h=630km')
hold on
[cs,h]=contour(Blong,Blat,I',20,LINESPEC); 
%-------------------------------------------------------------------------%
%-------------------------------Declination-------------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],D') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Declination (D) nT at h=630km')
% with contour line
figure
imagesc(Blong,Blat,D')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Declination (D) nT at h=630km')
hold on
[cs,h]=contour(Blong,Blat,D',20,LINESPEC); 
%-------------------------------------------------------------------------%
%--------------------------------END--------------------------------------%