clear
addpath /glade/u/home/renaud/scripts

Aa = 8.6108e+12; % meters
Ag = 3.6114e+14; % meters

ncload b40.20th.track1.1deg.012.pop.h.columndTdt.195001-195912.nc
Adv = ADVT;
AdvSubm = ADVT_SUBM;
Diff = HDIFT;
Err = Error;
K = KPP;
S = SHF;
dE = dEdt;
Q = QFLUX;
ncload b40.20th.track1.1deg.012.pop.h.columndTdt.196001-196912.nc
Adv = cat(1,Adv,ADVT);
AdvSubm = cat(1,AdvSubm,ADVT_SUBM);
Diff = cat(1,Diff,HDIFT);
Err = cat(1,Err,Error);
K = cat(1,K,KPP);
S = cat(1,S,SHF);
dE = cat(1,dE,dEdt);
Q = cat(1,Q,QFLUX);
ncload b40.20th.track1.1deg.012.pop.h.columndTdt.197001-197912.nc
Adv = cat(1,Adv,ADVT);
AdvSubm = cat(1,AdvSubm,ADVT_SUBM);
Diff = cat(1,Diff,HDIFT);
Err = cat(1,Err,Error);
K = cat(1,K,KPP);
S = cat(1,S,SHF);
dE = cat(1,dE,dEdt);
Q = cat(1,Q,QFLUX);
ncload b40.20th.track1.1deg.012.pop.h.columndTdt.198001-198912.nc
Adv = cat(1,Adv,ADVT);
AdvSubm = cat(1,AdvSubm,ADVT_SUBM);
Diff = cat(1,Diff,HDIFT);
Err = cat(1,Err,Error);
K = cat(1,K,KPP);
S = cat(1,S,SHF);
dE = cat(1,dE,dEdt);
Q = cat(1,Q,QFLUX);
ncload b40.20th.track1.1deg.012.pop.h.columndTdt.199001-199912.nc
Adv = cat(1,Adv,ADVT);
AdvSubm = cat(1,AdvSubm,ADVT_SUBM);
Diff = cat(1,Diff,HDIFT);
Err = cat(1,Err,Error);
K = cat(1,K,KPP);
S = cat(1,S,SHF);
dE = cat(1,dE,dEdt);
Q = cat(1,Q,QFLUX);

%----------------------------------------------------------------------
% Global Error
Gerr = squeeze(nansum(nansum(Err,2),3));
x = (1950:1999);
plot(x,Gerr/Ag)
title('Global heat budget error')
xlabel('year')
ylabel('W/m^2')
print('ErrdTdtglobal','-djpeg')

GdE = squeeze(nansum(nansum(dE,2),3));
GS = squeeze(nansum(nansum(S,2),3));
GK = squeeze(nansum(nansum(K,2),3));
GAD = squeeze(nansum(nansum(Adv+AdvSubm+Diff,2),3));
GQ = squeeze(nansum(nansum(Q,2),3));

plot(x,[Gerr GdE GS GK GAD GQ]/Ag)
legend('Error','dE/dt','Surf','KPP','Div','QFLUX')
title('Global heat budget')
xlabel('year')
ylabel('W/m^2')
print('GlobaldTdt','-djpeg')


%----------------------------------------------------------------------
% Arctic Error

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

x = (1950:1999);
Aerr = squeeze(nansum(nansum(Err(:,lat1:lat2,long1:long2),2),3));
AdE = squeeze(nansum(nansum(dE(:,lat1:lat2,long1:long2),2),3));
AS = squeeze(nansum(nansum(S(:,lat1:lat2,long1:long2),2),3));
AK = squeeze(nansum(nansum(K(:,lat1:lat2,long1:long2),2),3));
AAD = squeeze(nansum(nansum(Adv(:,lat1:lat2,long1:long2)-Diff(:,lat1:lat2,long1:long2),2),3));
AQ = squeeze(nansum(nansum(Q(:,lat1:lat2,long1:long2),2),3));


plot(x,Aerr/Aa)
title('Arctic heat budget error')
xlabel('year')
ylabel('W/m^2')
print('ErrdTdtarctic','-djpeg')

plot(x,[Aerr AdE AS AK AAD AQ]/Aa)
legend('Error','dE/dt','Surf','KPP','Div','QFLUX')
title('Arctic heat budget')
xlabel('year')
ylabel('W/m^2')
print('ArcticdTdt','-djpeg')

%----------------------------------------------------------------------
% Column Error

pcolor(squeeze(nanmean(Err,1))./TAREA);shading interp; colorbar
title('Mean error of the heat budget between 1950-1999 in W/m^2')
print('ErrdTdtcolumn','-djpeg')

index = find(dE==0);
dE(index) = NaN;

subplot(2,2,1)
pcolor(squeeze(nanmean(-Q,1))./TAREA);shading interp; colorbar
title('Minus Mean QFLUX')
caxis([-10 0])
subplot(2,2,2)
pcolor(squeeze(nanmean(-S,1))./TAREA);shading interp; colorbar
title('Minus Mean Surface fluxes')
subplot(2,2,3)
pcolor(squeeze(nanmean(-Adv-Diff,1))./TAREA);shading interp; colorbar
title('Mean Div(-Adv-Diff)')
%caxis([-500 500])
subplot(2,2,4)
pcolor(squeeze(nanmean(dE,1))./TAREA);shading interp; colorbar
title('Mean dE/dt')
print('BudgetdTdt','-djpeg')







