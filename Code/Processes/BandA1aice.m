clear
addpath /glade/u/home/renaud/scripts
addpath /glade/u/home/renaud/scripts/m_map

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

%%%%%%%%%%% a %%%%%%%%%%% 
ncload b30.040a.csim.h.aice.2000-01_cat_2099-12.nc aice TLAT TLON
aa = aice;
lat = TLAT;
long = TLON;
index = find(aa==0);
aa(index) = NaN;
%%%%%%%%%%% b %%%%%%%%%%% 
ncload b30.040b.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice TLAT TLON
ab = aice;
latnh = TLAT;
longnh = TLON;
ncload b30.040b.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
ab = cat(1,ab,aice);
index = find(ab==0);
ab(index) = NaN;
%%%%%%%%%%% c %%%%%%%%%%% 
ncload b30.040c.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
ac = aice;
ncload b30.040c.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
ac = cat(1,ac,aice);
index = find(ac==0);
ac(index) = NaN;
%%%%%%%%%%% e %%%%%%%%%%% 
ncload b30.040e.csim.h.aice.2000-01_cat_2099-12.nc aice
ae = aice;
index = find(ae==0);
ae(index) = NaN;
%%%%%%%%%%% f %%%%%%%%%%% 
ncload b30.040f.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
af = aice;
ncload b30.040f.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
af = cat(1,af,aice);
index = find(af==0);
af(index) = NaN;
%%%%%%%%%%% g %%%%%%%%%%% 
ncload b30.040g.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
ag = aice;
ncload b30.040g.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
ag = cat(1,ag,aice);
index = find(ag==0);
ag(index) = NaN;




subplot(2,3,1)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(long,lat,squeeze(aa(9+12*41,:,:)-aa(9+12*31,:,:)));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('a')

subplot(2,3,2)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(longnh,latnh,squeeze(-ab(9+12*22,:,:)+ab(9+12*35,:,:)));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('b.ES01')

subplot(2,3,3)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(longnh,latnh,squeeze(-ac(9+12*27,:,:)+ac(9+12*37,:,:)));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('c')

subplot(2,3,4)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(long,lat,squeeze(-ae(9+12*27,:,:)+ae(9+12*48,:,:)));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('e')

subplot(2,3,5)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(longnh,latnh,squeeze(-af(9+12*30,:,:)+af(9+12*50,:,:)));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('f.ES01')

subplot(2,3,6)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(longnh,latnh,squeeze(-ag(9+12*29,:,:)+ag(9+12*49,:,:)));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('g.ES01')

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-80 40])

% print('BandAaice','-djpeg')





