clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;
latnh = 281;

ncload b30.030a.csim.h.Fhnet_nh.1900-01_cat_1949-12.nc Fhnet TLAT TLON
Fa = Fhnet; 
ncload b30.030a.csim.h.Fhnet_nh.1950-01_cat_1999-12.nc Fhnet
Fa = cat(1,Fa,Fhnet);
ncload b30.040a.csim.h.Fhnet.2000-01_cat_2099-12.nc Fhnet
Fa = cat(1,Fa,Fhnet(:,latnh:end,:));
[nt nlat nlong] = size(Fa);
Fa = squeeze(nanmean(reshape(Fa,[12 nt/12 nlat nlong])));

ncload b30.030b.ES01.csim.h.Fhnet_nh.1900-01_cat_1949-12.nc Fhnet
Fb = Fhnet;
ncload b30.030b.ES01.csim.h.Fhnet_nh.1950-01_cat_1999-12.nc Fhnet
Fb = cat(1,Fb,Fhnet);
ncload b30.040b.ES01.csim.h.Fhnet_nh.2000-01_cat_2049-12.nc Fhnet
Fb = cat(1,Fb,Fhnet);
ncload b30.040b.ES01.csim.h.Fhnet_nh.2050-01_cat_2099-12.nc Fhnet
Fb = cat(1,Fb,Fhnet);
Fb = squeeze(nanmean(reshape(Fb,[12 nt/12 nlat nlong])));

ncload b30.030c.csim.h.Fhnet_nh.1900-01_cat_1949-12.nc Fhnet
Fc = Fhnet;
ncload b30.030c.csim.h.Fhnet_nh.1950-01_cat_1999-12.nc Fhnet
Fc = cat(1,Fc,Fhnet);
ncload b30.040c.csim.h.Fhnet_nh.2000-01_cat_2049-12.nc Fhnet
Fc = cat(1,Fc,Fhnet);
ncload b30.040c.csim.h.Fhnet_nh.2050-01_cat_2099-12.nc Fhnet
Fc = cat(1,Fc,Fhnet);
Fc = squeeze(nanmean(reshape(Fc,[12 nt/12 nlat nlong])));

ncload b30.030e.csim.h.Fhnet_nh.1900-01_cat_1949-12.nc Fhnet
Fe = Fhnet;
ncload b30.030e.csim.h.Fhnet_nh.1950-01_cat_1999-12.nc Fhnet
Fe = cat(1,Fe,Fhnet);
ncload b30.040e.csim.h.Fhnet_nh.2000-01_cat_2049-12.nc Fhnet
Fe = cat(1,Fe,Fhnet);
ncload b30.040e.csim.h.Fhnet_nh.2050-01_cat_2099-12.nc Fhnet
Fe = cat(1,Fe,Fhnet);
Fe = squeeze(nanmean(reshape(Fe,[12 nt/12 nlat nlong])));

ncload b30.030f.ES01.csim.h.Fhnet_nh.1900-01_cat_1949-12.nc Fhnet
Ff = Fhnet;
ncload b30.030f.ES01.csim.h.Fhnet_nh.1950-01_cat_1999-12.nc Fhnet
Ff = cat(1,Ff,Fhnet);
ncload b30.040f.ES01.csim.h.Fhnet_nh.2000-01_cat_2049-12.nc Fhnet
Ff = cat(1,Ff,Fhnet);
ncload b30.040f.ES01.csim.h.Fhnet_nh.2050-01_cat_2099-12.nc Fhnet
Ff = cat(1,Ff,Fhnet);
Ff = squeeze(nanmean(reshape(Ff,[12 nt/12 nlat nlong])));

ncload b30.030g.ES01.csim.h.Fhnet_nh.1900-01_cat_1949-12.nc Fhnet
Fg = Fhnet;
ncload b30.030g.ES01.csim.h.Fhnet_nh.1950-01_cat_1999-12.nc Fhnet
Fg = cat(1,Fg,Fhnet);
ncload b30.040g.ES01.csim.h.Fhnet_nh.2000-01_cat_2049-12.nc Fhnet
Fg = cat(1,Fg,Fhnet);
ncload b30.040g.ES01.csim.h.Fhnet_nh.2050-01_cat_2099-12.nc Fhnet
Fg = cat(1,Fg,Fhnet);
Fg = squeeze(nanmean(reshape(Fg,[12 nt/12 nlat nlong])));

clearvars Fhnet lat1 lat2 latt1 latt2 long1 long2
save OHF.mat

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

addpath /glade/u/home/renaud/scripts/m_map

clear 
load OHF.mat

dFa = -squeeze(nanmean(Fa(141:150,:,:))-nanmean(Fa(121:130,:,:)));
dFb = -squeeze(nanmean(Fb(141:150,:,:))-nanmean(Fb(121:130,:,:)));
dFc = -squeeze(nanmean(Fc(141:150,:,:))-nanmean(Fc(121:130,:,:)));
dFe = -squeeze(nanmean(Fe(141:150,:,:))-nanmean(Fe(121:130,:,:)));
dFf = -squeeze(nanmean(Ff(141:150,:,:))-nanmean(Ff(121:130,:,:)));
dFg = -squeeze(nanmean(Fg(141:150,:,:))-nanmean(Fg(121:130,:,:)));

subplot(2,3,1)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,dFa);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); 
caxis([-10 20])
title('a')

subplot(2,3,2)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,dFb);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); 
caxis([-10 20])
title('b.ES01')

subplot(2,3,3)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,dFc);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); 
caxis([-10 20])
title('c')

subplot(2,3,4)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,dFe);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); 
caxis([-10 20])
title('e')

subplot(2,3,5)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,dFf);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); 
caxis([-10 20])
title('f.ES01')

subplot(2,3,6)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,dFg);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); 
caxis([-10 20])
title('g.ES01')

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-10 20])

%print('OHF2','-djpeg')


