% CCSM4 column budget
% Variables: ADVT, HDIFT, SHF, QFLUX, TEMP
% We want to make everything in Watts = J/s.

clear
addpath /glade/u/home/renaud/scripts

%%%%%%%%%%%%%%%%
% Heat Fluxes
%%%%%%%%%%%%%%%%

ncload b40.20th.track1.1deg.012.pop.h.ADVT.185001-200512.nc ADVT TAREA cp_sw rho_sw dz
cp_sw = cp_sw*10^-7;
[nt nlat nlong] = size(ADVT);
dz = repmat(dz,[1,nlat,nlong]);
ADVT = ADVT(100*12+1:110*12,:,:);
adv = zeros(10,nlat,nlong);
dt = [31,28,31,30,31,30,31,31,30,31,30,31]'/365; % 1 month->seconds
dt = repmat(dt,[1 nlat nlong]);
for i=0:9
adv(i+1,:,:) = squeeze(nansum(ADVT(i*12+1:(i+1)*12,:,:).*dt)).*TAREA*cp_sw*rho_sw;
end

ncload b40.20th.track1.1deg.012.pop.h.ADVT_ISOP.185001-200512.nc ADVT_ISOP
ADVT_ISOP = ADVT_ISOP(100*12+1:110*12,:,:);
advi = zeros(10,nlat,nlong);
for i=0:9
advi(i+1,:,:) = squeeze(nansum(ADVT_ISOP(i*12+1:(i+1)*12,:,:).*dt)).*TAREA*cp_sw*rho_sw;
end

ncload b40.20th.track1.1deg.012.pop.h.ADVT_SUBM.185001-200512.nc ADVT_SUBM
ADVT_SUBM = ADVT_SUBM(100*12+1:110*12,:,:);
advs = zeros(10,nlat,nlong);
for i=0:9
advs(i+1,:,:) = squeeze(nansum(ADVT_SUBM(i*12+1:(i+1)*12,:,:).*dt)).*TAREA*cp_sw*rho_sw;
end

ncload b40.20th.track1.1deg.012.pop.h.HDIFT.185001-200512.nc HDIFT 
HDIFT = HDIFT(100*12+1:110*12,:,:);
diff = zeros(10,nlat,nlong);
for i=0:9
diff(i+1,:,:) = squeeze(nansum(HDIFT(i*12+1:(i+1)*12,:,:).*dt)).*TAREA*cp_sw*rho_sw;
end

ncload b40.20th.track1.1deg.012.pop.h.SHF.185001-200512.nc SHF 
SHF = SHF(100*12+1:110*12,:,:);
surf = zeros(10,nlat,nlong);
for i=0:9
surf(i+1,:,:) = squeeze(nansum(SHF(i*12+1:(i+1)*12,:,:).*dt)).*TAREA/10^4;
end

ncload b40.20th.track1.1deg.012.pop.h.QFLUX.185001-200512.nc QFLUX 
QFLUX = QFLUX(100*12+1:110*12,:,:);
q = zeros(10,nlat,nlong);
for i=0:9
q(i+1,:,:) = squeeze(nansum(QFLUX(i*12+1:(i+1)*12,:,:).*dt)).*TAREA/10^4;
end

dt2 = repmat(dt,[1 1 1 60]); dt2 = permute(dt2,[1 4 2 3]);
ncload b40.20th.track1.1deg.012.pop.h.KPP_SRC_TEMP.195001-195912.nc KPP_SRC_TEMP
kpp = zeros(10,nlat,nlong);
for i=0:9
kpp(i+1,:,:) = squeeze(nansum(squeeze(nansum(KPP_SRC_TEMP(i*12+1:(i+1)*12,:,:,:).*dt2)).*dz*cp_sw*rho_sw)).*TAREA;
end



%%%%%%%%%%%%%%%%
% Internal energy difference
%%%%%%%%%%%%%%%%
T = zeros(11,nlat,nlong);
ncload b40.20th.track1.1deg.012.pop.1950.nc TEMP_CUR
T(1,:,:) = squeeze(nansum(TEMP_CUR.*dz*cp_sw*rho_sw)).*TAREA;
ncload b40.20th.track1.1deg.012.pop.1951.nc TEMP_CUR
T(2,:,:) = squeeze(nansum(TEMP_CUR.*dz*cp_sw*rho_sw)).*TAREA;
ncload b40.20th.track1.1deg.012.pop.1952.nc TEMP_CUR
T(3,:,:) = squeeze(nansum(TEMP_CUR.*dz*cp_sw*rho_sw)).*TAREA;
ncload b40.20th.track1.1deg.012.pop.1953.nc TEMP_CUR
T(4,:,:) = squeeze(nansum(TEMP_CUR.*dz*cp_sw*rho_sw)).*TAREA;
ncload b40.20th.track1.1deg.012.pop.1954.nc TEMP_CUR
T(5,:,:) = squeeze(nansum(TEMP_CUR.*dz*cp_sw*rho_sw)).*TAREA;
ncload b40.20th.track1.1deg.012.pop.1955.nc TEMP_CUR
T(6,:,:) = squeeze(nansum(TEMP_CUR.*dz*cp_sw*rho_sw)).*TAREA;
ncload b40.20th.track1.1deg.012.pop.1956.nc TEMP_CUR
T(7,:,:) = squeeze(nansum(TEMP_CUR.*dz*cp_sw*rho_sw)).*TAREA;
ncload b40.20th.track1.1deg.012.pop.1957.nc TEMP_CUR
T(8,:,:) = squeeze(nansum(TEMP_CUR.*dz*cp_sw*rho_sw)).*TAREA;
ncload b40.20th.track1.1deg.012.pop.1958.nc TEMP_CUR
T(9,:,:) = squeeze(nansum(TEMP_CUR.*dz*cp_sw*rho_sw)).*TAREA;
ncload b40.20th.track1.1deg.012.pop.1959.nc TEMP_CUR
T(10,:,:) = squeeze(nansum(TEMP_CUR.*dz*cp_sw*rho_sw)).*TAREA;
ncload b40.20th.track1.1deg.012.pop.1960.nc TEMP_CUR
T(11,:,:) = squeeze(nansum(TEMP_CUR.*dz*cp_sw*rho_sw)).*TAREA;
dT = (T(2:end,:,:) - T(1:end-1,:,:))/(265*24*60^2);

%%%%%%%%%%%%%%%%
% Budget
%%%%%%%%%%%%%%%%

err = dT - (adv+diff+surf+q+kpp); 
err3 = dT - (adv+diff+surf+q); 

tmp = err;
for i=1:10
tmp(i,:,:) = squeeze(err(i,:,:))./(TAREA/10^4);
end

%%%%%%%%%%%%%%%%%%%%%%%%%
% Graphs
%%%%%%%%%%%%%%%%%%%%%%%%%%

% Global

index = find(isnan(squeeze(SHF(1,:,:)))==1);
oa = TAREA; oa(index) = NaN; oa = nansum(nansum(oa))./10^4;
dTG = nansum(nansum(dT,3),2)./oa;
advG = nansum(nansum(adv,3),2)./oa;
diffG = nansum(nansum(diff,3),2)./oa;
kppG = nansum(nansum(kpp,3),2)./oa;
surfG = nansum(nansum(surf,3),2)./oa;
qG = nansum(nansum(q,3),2)./oa;
errG = nansum(nansum(err,3),2)./oa;

% Mean arctic error
lat1 = 333;
lat2 = 384;
long1 = 100;
long2 = 230;

index = find(isnan(squeeze(SHF(1,:,:)))==1);
aoa = TAREA; aoa(index) = NaN; aoa = nansum(nansum(aoa(lat1:lat2,long1:long2)))./10^4;

dTA = nansum(nansum(dT(:,lat1:lat2,long1:long2),3),2)./aoa;
advA = nansum(nansum(adv(:,lat1:lat2,long1:long2),3),2)./aoa;
diffA = nansum(nansum(diff(:,lat1:lat2,long1:long2),3),2)./aoa;
kppA = nansum(nansum(kpp(:,lat1:lat2,long1:long2),3),2)./aoa;
surfA = nansum(nansum(surf(:,lat1:lat2,long1:long2),3),2)./aoa;
qA = nansum(nansum(q(:,lat1:lat2,long1:long2),3),2)./aoa;
errA = nansum(nansum(err(:,lat1:lat2,long1:long2),3),2)./aoa;

x = (1950:1959);

subplot(2,1,1)
plot(x,dTG,x,advG,x,diffG,x,surfG,x,qG,x,kppG,x,errG,'LineWidth',2)
%legend('dT','adv','diff','surf','q','budget','Location','SouthWest')
title('Global budget')
grid on
%xlim([1 12])
ylim([-2 2])
ylabel('W/m^2')
subplot(2,1,2)
plot(x,dTA,x,advA,x,diffA,x,surfA,x,qA,x,kppA,x,errA,'LineWidth',2)
leg = legend('dT','adv','diff','surf','q','KPP','budget')
title('Arctic Ocean budget')
grid on
%xlim([1 12])
ylim([-7 5])
ylabel('W/m^2')
% print('Error4GA','-djpeg')



subplot(2,1,1)
plot(x,dTG,x,advG,x,diffG,x,surfG,x,qG,x,errG,'LineWidth',2)
%legend('dT','adv','diff','surf','q','budget','Location','SouthWest')
title('Global budget')
grid on
%xlim([1 12])
ylim([-2 2])
ylabel('W/m^2')
subplot(2,1,2)
plot(x,dTA,x,advA,x,diffA,x,surfA,x,qA,x,errA,'LineWidth',2)
leg = legend('dT','adv','diff','surf','q','budget')
title('Arctic Ocean budget')
grid on
%xlim([1 12])
ylim([-7 5])
ylabel('W/m^2')
% print('Error4GALike3','-djpeg')


%%%%%%%%%%%%%%%%

index = find(err==0); err(index) = NaN;
year = {'1950','1951','1952','1953','1954','1955','1956','1957','1958','1959'};
for i=1:8
subplot(3,3,i)
pcolor(squeeze(err(i+1,:,:))./(TAREA/10^4));shading interp
caxis([-50 50])
set(gca,'xtick',[],'ytick',[])
title(year(i+1))
end

subplot(3,3,9)
pcolor(squeeze(mean(err))./(TAREA/10^4));shading interp
caxis([-50 50])
set(gca,'xtick',[],'ytick',[])
title('1950-59 Mean')

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-50 50])

% print('Error4','-djpeg')




index = find(err==0); err(index) = NaN;
year = {'1950','1951','1952','1953','1954','1955','1956','1957','1958','1959'};
for i=1:8
subplot(3,3,i)
pcolor(squeeze(err3(i+1,:,:))./(TAREA/10^4));shading interp
caxis([-50 50])
set(gca,'xtick',[],'ytick',[])
title(year(i+1))
end

subplot(3,3,9)
pcolor(squeeze(mean(err3))./(TAREA/10^4));shading interp
caxis([-50 50])
set(gca,'xtick',[],'ytick',[])
title('1950-59 Mean')

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-50 50])

% print('Error4Like3','-djpeg')

index = find(kpp==0); kpp(index) = NaN;
pcolor(squeeze(kpp(1,:,:))./(TAREA/10^4)); shading interp; colorbar
title('Vertically integrated KPP (W/m^2)')
set(gca,'xtick',[],'ytick',[])
% print('kpp','-djpeg')






addpath /glade/u/home/renaud/scripts/m_map
ncload b40.20th.track1.1deg.012.pop.h.SHF.185001-200512.nc TLAT TLONG

year = {'1950','1951','1952','1953','1954','1955','1956','1957','1958','1959'};
for i=1:9
subplot(3,3,i)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLONG,TLAT,squeeze(err(i+1,:,:))./(TAREA/10^4));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); 
caxis([-10 10])
title(year(i+1))
end

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-10 10])


