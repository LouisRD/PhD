% CCSM3 column budget
% Variables: ADVT, HDIFT, SHF, QFLUX, TEMP
% We want to make everything in Watts = J/s.

clear
addpath /glade/u/home/renaud/scripts

%%%%%%%%%%%%%%%%%%%%%%%%%
% Variables
%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030b.ES01.pop.h.1899-12.nc TEMP rho_sw cp_sw dz TAREA
[nz nlat nlong] = size(TEMP);
cp_sw = cp_sw*10^-7; % erg/(g C) -> J/(g C)
dz = repmat(dz,[1 nlat nlong]);
adv = zeros(12,nlat,nlong);
diff = zeros(12,nlat,nlong);
surf = zeros(12,nlat,nlong);
q = zeros(12,nlat,nlong);
T = zeros(14,nlat,nlong);
T(1,:,:) = squeeze(nansum(TEMP.*dz*cp_sw*rho_sw)).*TAREA;
ncload b30.030b.ES01.pop.h.1900-01.nc ADVT HDIFT SHF QFLUX TEMP
adv(1,:,:) = ADVT.*TAREA*cp_sw*rho_sw;
diff(1,:,:) = HDIFT.*TAREA*cp_sw*rho_sw;
surf(1,:,:) = SHF.*TAREA/10^4;
q(1,:,:) = QFLUX.*TAREA/10^4;
T(2,:,:) = squeeze(nansum(TEMP.*dz*cp_sw*rho_sw)).*TAREA;
ncload b30.030b.ES01.pop.h.1900-02.nc ADVT HDIFT SHF QFLUX TEMP
adv(2,:,:) = ADVT.*TAREA*cp_sw*rho_sw;
diff(2,:,:) = HDIFT.*TAREA*cp_sw*rho_sw;
surf(2,:,:) = SHF.*TAREA/10^4;
q(2,:,:) = QFLUX.*TAREA/10^4;
T(3,:,:) = squeeze(nansum(TEMP.*dz*cp_sw*rho_sw)).*TAREA;
ncload b30.030b.ES01.pop.h.1900-03.nc ADVT HDIFT SHF QFLUX TEMP
adv(3,:,:) = ADVT.*TAREA*cp_sw*rho_sw;
diff(3,:,:) = HDIFT.*TAREA*cp_sw*rho_sw;
surf(3,:,:) = SHF.*TAREA/10^4;
q(3,:,:) = QFLUX.*TAREA/10^4;
T(4,:,:) = squeeze(nansum(TEMP.*dz*cp_sw*rho_sw)).*TAREA;
ncload b30.030b.ES01.pop.h.1900-04.nc ADVT HDIFT SHF QFLUX TEMP
adv(4,:,:) = ADVT.*TAREA*cp_sw*rho_sw;
diff(4,:,:) = HDIFT.*TAREA*cp_sw*rho_sw;
surf(4,:,:) = SHF.*TAREA/10^4;
q(4,:,:) = QFLUX.*TAREA/10^4;
T(5,:,:) = squeeze(nansum(TEMP.*dz*cp_sw*rho_sw)).*TAREA;
ncload b30.030b.ES01.pop.h.1900-05.nc ADVT HDIFT SHF QFLUX TEMP
adv(5,:,:) = ADVT.*TAREA*cp_sw*rho_sw;
diff(5,:,:) = HDIFT.*TAREA*cp_sw*rho_sw;
surf(5,:,:) = SHF.*TAREA/10^4;
q(5,:,:) = QFLUX.*TAREA/10^4;
T(6,:,:) = squeeze(nansum(TEMP.*dz*cp_sw*rho_sw)).*TAREA;
ncload b30.030b.ES01.pop.h.1900-06.nc ADVT HDIFT SHF QFLUX TEMP
adv(6,:,:) = ADVT.*TAREA*cp_sw*rho_sw;
diff(6,:,:) = HDIFT.*TAREA*cp_sw*rho_sw;
surf(6,:,:) = SHF.*TAREA/10^4;
q(6,:,:) = QFLUX.*TAREA/10^4;
T(7,:,:) = squeeze(nansum(TEMP.*dz*cp_sw*rho_sw)).*TAREA;
ncload b30.030b.ES01.pop.h.1900-07.nc ADVT HDIFT SHF QFLUX TEMP
adv(7,:,:) = ADVT.*TAREA*cp_sw*rho_sw;
diff(7,:,:) = HDIFT.*TAREA*cp_sw*rho_sw;
surf(7,:,:) = SHF.*TAREA/10^4;
q(7,:,:) = QFLUX.*TAREA/10^4;
T(8,:,:) = squeeze(nansum(TEMP.*dz*cp_sw*rho_sw)).*TAREA;
ncload b30.030b.ES01.pop.h.1900-08.nc ADVT HDIFT SHF QFLUX TEMP
adv(8,:,:) = ADVT.*TAREA*cp_sw*rho_sw;
diff(8,:,:) = HDIFT.*TAREA*cp_sw*rho_sw;
surf(8,:,:) = SHF.*TAREA/10^4;
q(8,:,:) = QFLUX.*TAREA/10^4;
T(9,:,:) = squeeze(nansum(TEMP.*dz*cp_sw*rho_sw)).*TAREA;
ncload b30.030b.ES01.pop.h.1900-09.nc ADVT HDIFT SHF QFLUX TEMP
adv(9,:,:) = ADVT.*TAREA*cp_sw*rho_sw;
diff(9,:,:) = HDIFT.*TAREA*cp_sw*rho_sw;
surf(9,:,:) = SHF.*TAREA/10^4;
q(9,:,:) = QFLUX.*TAREA/10^4;
T(10,:,:) = squeeze(nansum(TEMP.*dz*cp_sw*rho_sw)).*TAREA;
ncload b30.030b.ES01.pop.h.1900-10.nc ADVT HDIFT SHF QFLUX TEMP
adv(10,:,:) = ADVT.*TAREA*cp_sw*rho_sw;
diff(10,:,:) = HDIFT.*TAREA*cp_sw*rho_sw;
surf(10,:,:) = SHF.*TAREA/10^4;
q(10,:,:) = QFLUX.*TAREA/10^4;
T(11,:,:,:) = squeeze(nansum(TEMP.*dz*cp_sw*rho_sw)).*TAREA;
ncload b30.030b.ES01.pop.h.1900-11.nc ADVT HDIFT SHF QFLUX TEMP
adv(11,:,:) = ADVT.*TAREA*cp_sw*rho_sw;
diff(11,:,:) = HDIFT.*TAREA*cp_sw*rho_sw;
surf(11,:,:) = SHF.*TAREA/10^4;
q(11,:,:) = QFLUX.*TAREA/10^4;
T(12,:,:) = squeeze(nansum(TEMP.*dz*cp_sw*rho_sw)).*TAREA;
ncload b30.030b.ES01.pop.h.1900-12.nc ADVT HDIFT SHF QFLUX TEMP
adv(12,:,:) = ADVT.*TAREA*cp_sw*rho_sw;
diff(12,:,:) = HDIFT.*TAREA*cp_sw*rho_sw;
surf(12,:,:) = SHF.*TAREA/10^4;
q(12,:,:) = QFLUX.*TAREA/10^4;
T(13,:,:,:) = squeeze(nansum(TEMP.*dz*cp_sw*rho_sw)).*TAREA;
ncload b30.030b.ES01.pop.h.1901-01.nc TEMP
T(14,:,:) = squeeze(nansum(TEMP.*dz*cp_sw*rho_sw)).*TAREA;

%%%%%%%%%%%%%%%%%%%%%%%%%
% Column Temperature Tendency
%%%%%%%%%%%%%%%%%%%%%%%%%%

dt = [31,28,31,30,31,30,31,31,30,31,30,31]'*24*60^2; % 1 month->seconds
dt = repmat(dt,[1 nlat nlong]);

dTf = (T(3:end,:,:) - T(2:end-1,:,:))./dt;
dTb = (T(2:end-1,:,:) - T(1:end-2,:,:))./dt;
dTlf = (T(1:end-2,:,:) - T(3:end,:,:))./(2*dt);

%%%%%%%%%%%%%%%%%%%%%%%%%
% Budget
%%%%%%%%%%%%%%%%%%%%%%%%%%

bf = dTf - (adv+diff+surf+q);
bb = dTb - (adv+diff+surf+q);
blf = dTlf - (adv+diff+surf+q);


%%%%%%%%%%%%%%%%%%%%%%%%%
% Graphs
%%%%%%%%%%%%%%%%%%%%%%%%%%
%Global

index = find(isnan(SHF)==1);
oa = TAREA; oa(index) = NaN; oa = nansum(nansum(oa))./10^4;
dTfG = nansum(nansum(dTf,3),2)./oa;
dTbG = nansum(nansum(dTb,3),2)./oa;
dTlfG = nansum(nansum(dTlf,3),2)./oa;
advG = nansum(nansum(adv,3),2)./oa;
diffG = nansum(nansum(diff,3),2)./oa;
surfG = nansum(nansum(surf,3),2)./oa;
qG = nansum(nansum(q,3),2)./oa;
bfG = nansum(nansum(bf,3),2)./oa;
bbG = nansum(nansum(bb,3),2)./oa;
blfG = nansum(nansum(blf,3),2)./oa;

x = (1:12);
plot(x,dTfG,x,advG,x,diffG,x,surfG,x,qG,x,bfG,'LineWidth',2)
legend('dT','adv','diff','surf','q','budget','Location','SouthWest')


plot(x,bfG,x,bbG,x,blfG,'LineWidth',2)
legend('forward','backward','leap-frog')





% Mean arctic error
lat1 = 333;
lat2 = 384;
long1 = 100;
long2 = 230;

index = find(isnan(SHF)==1);
aoa = TAREA; aoa(index) = NaN; aoa = nansum(nansum(aoa(lat1:lat2,long1:long2)))./10^4;

dTfA = nansum(nansum(dTf(:,lat1:lat2,long1:long2),3),2)./aoa;
dTbA = nansum(nansum(dTb(:,lat1:lat2,long1:long2),3),2)./aoa;
dTlfA = nansum(nansum(dTlf(:,lat1:lat2,long1:long2),3),2)./aoa;
advA = nansum(nansum(adv(:,lat1:lat2,long1:long2),3),2)./aoa;
diffA = nansum(nansum(diff(:,lat1:lat2,long1:long2),3),2)./aoa;
surfA = nansum(nansum(surf(:,lat1:lat2,long1:long2),3),2)./aoa;
qA = nansum(nansum(q(:,lat1:lat2,long1:long2),3),2)./aoa;
bfA = nansum(nansum(bf(:,lat1:lat2,long1:long2),3),2)./aoa;
bbA = nansum(nansum(bb(:,lat1:lat2,long1:long2),3),2)./aoa;
blfA = nansum(nansum(blf(:,lat1:lat2,long1:long2),3),2)./aoa;


x = (1:12);
plot(x,dTfA,x,advA,x,diffA,x,surfA,x,qA,x,bfA,'LineWidth',2)
legend('dT','adv','diff','surf','q','budget','Location','SouthWest')


plot(x,bfA,x,bbA,x,blfA,'LineWidth',2)
legend('foward','backward','leap-frog')


pcolor(squeeze(bf(1,:,:)).*TAREA/10^4);shading interp; colorbar
pcolor(nanmean(bf).*TAREA/10^4);shading interp; colorbar

%%%%%%%%%%%%%%%%

addpath /glade/u/home/renaud/scripts/m_map
ncload b30.030b.ES01.pop.h.1900-03.nc TLAT TLONG

month = {'J','F','M','A','M','J','J','A','S','O','N','D'};
for i=1:12
subplot(3,4,i)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLONG,TLAT,squeeze(bf(i,:,:))./(TAREA/10^4));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); 
caxis([-10 10])
title(month(i))
end

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-10 10])
























