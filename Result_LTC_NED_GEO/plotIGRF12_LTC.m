%-------------------------------------------------------------------------%
%This program use to ploting data Earth Magnetic Field at n-altitude
% in Local Tangent Coordinated (LTC), unit in nT
% Plot data magnetic field at x altitude
%   data IGRF12
%   n=13, degree
%   m=0,1,2...,n, orde'
% Source : adabted code with IGRF11 Matlab Code By Charles Rino
%-------------------------------------------------------------------------%
load B_LTC Br Bt Bp mB %load data
%-------------------------------------------------------------------------%
Blong=-180:179;
Blat=-89:90;
LINESPEC='w';
%-------------------------------------------------------------------------%
%-----------------------------Radial Direction----------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],Br') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Radial Direction (R) nT at h=630km in LTC')
% with contour line
figure
imagesc(Blong,Blat,Br')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Radial Direction (R) nT at h=630km in LTC')
hold on
[cs,h]=contour(Blong,Blat,Br',20,LINESPEC); 
%-------------------------------------------------------------------------%
%------------------------------Teta Direction-----------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],Bt') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Teta Direction (T) nT at h=630km in LTC')
% with contour line
figure
imagesc(Blong,Blat,Bt')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Teta Direction (T) nT at h=630km in LTC')
hold on
[cs,h]=contour(Blong,Blat,Bt',20,LINESPEC); 
%-------------------------------------------------------------------------%
%------------------------------Phi Direction------------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],Bp') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Phi Direction (P) nT at h=630km in LTC')
% with contour line
figure
imagesc(Blong,Blat,Bp')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Phi Direction (P) nT at h=630km in LTC')
hold on
[cs,h]=contour(Blong,Blat,Bp',20,LINESPEC); 
%-------------------------------------------------------------------------%
%-----------------------------Total Intensity-----------------------------%
% without contour line
figure
imagesc([-180:179],[-89:90],mB') %image scale, B'=transpose(B)
axis xy
colorbar %show color bar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Total Intensity (F) nT at h=630km in LTC')
% with contour line
figure
imagesc(Blong,Blat,mB')
axis xy
hold on
colorbar
xlabel('Longitude [deg]')
ylabel('Latitude [deg]')
title('Total Intensity (F) nT at h=630km in LTC')
hold on
[cs,h]=contour(Blong,Blat,mB',20,LINESPEC); 
%-------------------------------------------------------------------------%
%--------------------------------END--------------------------------------%