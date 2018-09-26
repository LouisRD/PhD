% CCSM4 verification for HSIFT and ADVT.
% Variables: UET,VNT -> ADVT, HDIFE_TEMP,HDIFN_TEMP -> HDIFT 

clear
addpath /glade/u/home/renaud/scripts

%%%%%%%%%%%%%%%%
% HDIFT
%%%%%%%%%%%%%%%%

% data
ncload b40.20th.track1.1deg.012.pop.h.1998-12.nc HDIFT HDIFE_TEMP HDIFN_TEMP TAREA dz rho_sw cp_sw
cp_sw = cp_sw/10^7;
% vertical integration and multiplication by TAREA
[nz nlat nlong] = size(HDIFE_TEMP);
dz3 = repmat(dz,[1 nlat nlong]);
dife = squeeze(nansum(HDIFE_TEMP.*dz3)).*TAREA; % C/s -> cm^3 C/s
difn = squeeze(nansum(HDIFN_TEMP.*dz3)).*TAREA;

% Divergence E-W
divEW = dife;
divEW(:,2:end) =  dife(:,2:end) - dife(:,1:end-1);
divEW(:,1) = dife(:,1) - dife(:,end); % cyclical
% Divergence N-S
divNS = difn;
divNS(2:end,:) = difn(2:end,:) - difn(1:end-1,:);
% No need to define (1,:) since the variables are all null on the grid's pole (land).
% Divergence
div = divEW + divNS;

% Easier to compare in W/m^2
err = (HDIFT.*TAREA-div)*cp_sw*rho_sw./(TAREA/10^4);

% Graph
pcolor(err);shading interp;colorbar
set(gca,'xtick',[],'ytick',[])
title('Difference between HDIFT and HDIFE,N\_TEMP (W/m^2)')
print('HDIFENT','-djpeg')


%%%%%%%%%%%%%%%%
% ADVT
%%%%%%%%%%%%%%%%
clear
addpath /glade/u/home/renaud/scripts

% data
ncload b40.20th.track1.1deg.012.pop.h.1998-12.nc ADVT UET VNT TAREA dz rho_sw cp_sw
cp_sw = cp_sw/10^7;
% vertical integration and multiplication by TAREA
[nz nlat nlong] = size(UET);
dz3 = repmat(dz,[1 nlat nlong]);
dife = squeeze(nansum(UET.*dz3)).*TAREA; % C/s -> cm^3 C/s
difn = squeeze(nansum(VNT.*dz3)).*TAREA;

% Divergence E-W
divEW = dife;
divEW(:,2:end) =  dife(:,2:end) - dife(:,1:end-1);
divEW(:,1) = dife(:,1) - dife(:,end); % cyclical
% Divergence N-S
divNS = difn;
divNS(2:end,:) = difn(2:end,:) - difn(1:end-1,:);
% No need to define (1,:) since the variables are all null on the grid's pole (land).
% Divergence
div = divEW + divNS;

% Easier to compare in W/m^2
err = (ADVT.*TAREA+div)*cp_sw*rho_sw./(TAREA/10^4);

% Graph
index = find(abs(err)>1); err(index) = NaN;
pcolor(err);shading interp;colorbar
set(gca,'xtick',[],'ytick',[])
title('Difference between ADVT and UET,VNT (W/m^2)')
%print('ADVTUETVNT','-djpeg')






index = find(div==0);div(index) = NaN;
subplot(1,2,1)
pcolor(ADVT.*TAREA*cp_sw*rho_sw./(TAREA/10^4));shading interp;colorbar
set(gca,'xtick',[],'ytick',[])
title('ADVT')
caxis([-5000 5000])
subplot(1,2,2)
pcolor(div*cp_sw*rho_sw./(TAREA/10^4));shading interp;colorbar
set(gca,'xtick',[],'ytick',[])
title('UET,VNT')
caxis([-5000 5000])
















