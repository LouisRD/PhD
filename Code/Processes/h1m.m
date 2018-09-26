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
ncload b30.040a.csim.h.hi.2000-01_cat_2099-12.nc hi TLAT TLON
ha = hi;
lat = TLAT;
long = TLON;
%%%%%%%%%%% b %%%%%%%%%%% 
ncload b30.040b.ES01.csim.h.hi_nh.2000-01_cat_2049-12.nc hi TLAT TLON
hb = hi;
latnh = TLAT;
longnh = TLON;
ncload b30.040b.ES01.csim.h.hi_nh.2050-01_cat_2099-12.nc hi
hb = cat(1,hb,hi);
%%%%%%%%%%% c %%%%%%%%%%% 
ncload b30.040c.csim.h.hi_nh.2000-01_cat_2049-12.nc hi
hc = hi;
ncload b30.040c.csim.h.hi_nh.2050-01_cat_2099-12.nc hi
hc = cat(1,hc,hi);
%%%%%%%%%%% e %%%%%%%%%%% 
ncload b30.040e.csim.h.hi_nh.2000-01_cat_2049-12.nc hi
he = hi;
ncload b30.040e.csim.h.hi_nh.2050-01_cat_2099-12.nc hi
he = cat(1,he,hi);
%%%%%%%%%%% f %%%%%%%%%%% 
ncload b30.040f.ES01.csim.h.hi_nh.2000-01_cat_2049-12.nc hi TLAT TLON
hf = hi;
ncload b30.040f.ES01.csim.h.hi_nh.2050-01_cat_2099-12.nc hi
hf = cat(1,hf,hi);
%%%%%%%%%%% g %%%%%%%%%%% 
ncload b30.040g.ES01.csim.h.hi_nh.2000-01_cat_2049-12.nc hi TLAT TLON
hg = hi;
ncload b30.040g.ES01.csim.h.hi_nh.2050-01_cat_2099-12.nc hi
hg = cat(1,hg,hi);


subplot(2,3,1)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_contour(long,lat,squeeze(ha(9+12*31,:,:)),[1,1],'Linecolor','b','Linewidth',2);
hold on
m_contour(long,lat,squeeze(ha(9+12*41,:,:)),[1,1],'Linecolor','r','Linewidth',2);	
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('a')

subplot(2,3,2)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_contour(longnh,latnh,squeeze(hb(9+12*22,:,:)),[1,1],'Linecolor','b','Linewidth',2);
hold on
m_contour(longnh,latnh,squeeze(hb(9+12*35,:,:)),[1,1],'Linecolor','r','Linewidth',2);	
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('b.ES01')

subplot(2,3,3)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_contour(longnh,latnh,squeeze(hc(9+12*27,:,:)),[1,1],'Linecolor','b','Linewidth',2);
hold on
m_contour(longnh,latnh,squeeze(hc(9+12*37,:,:)),[1,1],'Linecolor','r','Linewidth',2);	
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('c')

subplot(2,3,4)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_contour(longnh,latnh,squeeze(he(9+12*27,:,:)),[1,1],'Linecolor','b','Linewidth',2);
hold on
m_contour(longnh,latnh,squeeze(he(9+12*48,:,:)),[1,1],'Linecolor','r','Linewidth',2);	
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('e')

subplot(2,3,5)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_contour(longnh,latnh,squeeze(hf(9+12*30,:,:)),[1,1],'Linecolor','b','Linewidth',2);
hold on
m_contour(longnh,latnh,squeeze(hf(9+12*50,:,:)),[1,1],'Linecolor','r','Linewidth',2);	
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('f.ES01')

subplot(2,3,6)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_contour(longnh,latnh,squeeze(hg(9+12*29,:,:)),[1,1],'Linecolor','b','Linewidth',2);
hold on
m_contour(longnh,latnh,squeeze(hg(9+12*49,:,:)),[1,1],'Linecolor','r','Linewidth',2);	
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('g.ES01')

% print('BandA1m','-djpeg')
