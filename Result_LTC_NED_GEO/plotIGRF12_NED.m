%-------------------------------------------------------------------------%
%This program use to ploting data Earth Magnetic Field at n-altitude
% in North East Down Coordinated (NED), unit in nT
% Plot data magnetic field at x altitude
%   data IGRF12
%   n=13, degree
%   m=0,1,2...,n, orde'
% Source : adabted code with IGRF11 Matlab Code By Charles Rino
%-------------------------------------------------------------------------%
load B_NED N E D mB_NED %load data
%-------------------------------------------------------------------------%
Blong=-180:179;
Blat=-89:90;
LINESPEC='w';
%-------------------------------------------------------------------------%
%-----------------------------North Direction----------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],N') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('North Direction (N) nT at h=630km in NED')
% with contour line
figure
imagesc(Blong,Blat,N')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('North Direction (N) nT at h=630km in NED')
hold on
[cs,h]=contour(Blong,Blat,N',20,LINESPEC); 
%-------------------------------------------------------------------------%
%------------------------------East Direction-----------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],E') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('East Direction (E) nT at h=630km in NED')
% with contour line
figure
imagesc(Blong,Blat,E')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('East Direction (E) nT at h=630km in NED')
hold on
[cs,h]=contour(Blong,Blat,E',20,LINESPEC); 
%-------------------------------------------------------------------------%
%------------------------------Down Direction-----------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],D') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Down Direction (D) nT at h=630km in NED')
% with contour line
figure
imagesc(Blong,Blat,D')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Down Direction (D) nT at h=630km in NED')
hold on
[cs,h]=contour(Blong,Blat,D',20,LINESPEC); 
%-------------------------------------------------------------------------%
%-----------------------------Total Intensity-----------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],mB_NED') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Total Intensity (F) nT at h=630km in NED')
% with contour line
figure
imagesc(Blong,Blat,mB_NED')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Total Intensity (F) nT at h=630km in NED')
hold on
[cs,h]=contour(Blong,Blat,mB_NED',20,LINESPEC); 
%-------------------------------------------------------------------------%
%--------------------------------END--------------------------------------%