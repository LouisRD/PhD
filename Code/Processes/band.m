clear
addpath /glade/u/home/renaud/scripts
addpath /glade/u/home/renaud/scripts/m_map2

load volume.mat
ncload b30.040g.ES01.csim.h.hi_nh.2050-01_cat_2099-12.nc TLAT TLON
lat = TLAT(latt1:latt2,long1:long2);
long = TLON(latt1:latt2,long1:long2);

subplot(2,3,1)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_contour(long,lat,squeeze(ah(9+12*131,:,:)),[1,1],'Linecolor','b','Linestyle',':','Linewidth',2);
hold on
m_contour(long,lat,squeeze(a(9+12*131,:,:)),[15,15],'Linecolor','r','Linestyle',':','Linewidth',2);
m_contour(long,lat,squeeze(ah(9+12*141,:,:)),[1,1],'Linecolor','b','Linewidth',2);	
m_contour(long,lat,squeeze(a(9+12*141,:,:)),[15,15],'Linecolor','r','Linewidth',2);	
m_coast('patch',[.7 .7 .7],'edgecolor','k');
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
title('a')

subplot(2,3,2)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_contour(long,lat,squeeze(bh(9+12*122,:,:)),[1,1],'Linecolor','b','Linewidth',2,'Linestyle',':');
hold on
m_contour(long,lat,squeeze(b(9+12*122,:,:)),[15,15],'Linecolor','r','Linewidth',2,'Linestyle',':');
m_contour(long,lat,squeeze(bh(9+12*135,:,:)),[1,1],'Linecolor','b','Linewidth',2);	
m_contour(long,lat,squeeze(b(9+12*135,:,:)),[15,15],'Linecolor','r','Linewidth',2);	
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('b.ES01')

subplot(2,3,3)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_contour(long,lat,squeeze(ch(9+12*127,:,:)),[1,1],'Linecolor','b','Linewidth',2,'Linestyle',':');
hold on
m_contour(long,lat,squeeze(c(9+12*127,:,:)),[15,15],'Linecolor','r','Linewidth',2,'Linestyle',':');
m_contour(long,lat,squeeze(ch(9+12*137,:,:)),[1,1],'Linecolor','b','Linewidth',2);	
m_contour(long,lat,squeeze(c(9+12*137,:,:)),[15,15],'Linecolor','r','Linewidth',2);	
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('c')

subplot(2,3,4)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_contour(long,lat,squeeze(eh(9+12*127,:,:)),[1,1],'Linecolor','b','Linewidth',2,'Linestyle',':');
hold on
m_contour(long,lat,squeeze(e(9+12*127,:,:)),[15,15],'Linecolor','r','Linewidth',2,'Linestyle',':');
m_contour(long,lat,squeeze(eh(9+12*148,:,:)),[1,1],'Linecolor','b','Linewidth',2);
m_contour(long,lat,squeeze(e(9+12*148,:,:)),[15,15],'Linecolor','r','Linewidth',2);
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('e')

subplot(2,3,5)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_contour(long,lat,squeeze(fh(9+12*130,:,:)),[1,1],'Linecolor','b','Linewidth',2,'Linestyle',':');
hold on
m_contour(long,lat,squeeze(f(9+12*130,:,:)),[15,15],'Linecolor','r','Linewidth',2,'Linestyle',':');
m_contour(long,lat,squeeze(fh(9+12*150,:,:)),[1,1],'Linecolor','b','Linewidth',2);
m_contour(long,lat,squeeze(f(9+12*150,:,:)),[15,15],'Linecolor','r','Linewidth',2);
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('f.ES01')

subplot(2,3,6)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_contour(long,lat,squeeze(gh(9+12*129,:,:)),[1,1],'Linecolor','b','Linewidth',2,'Linestyle',':');
hold on
m_contour(long,lat,squeeze(g(9+12*129,:,:)),[15,15],'Linecolor','r','Linewidth',2,'Linestyle',':');
m_contour(long,lat,squeeze(gh(9+12*149,:,:)),[1,1],'Linecolor','b','Linewidth',2);	
m_contour(long,lat,squeeze(g(9+12*149,:,:)),[15,15],'Linecolor','r','Linewidth',2);	
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('g.ES01')

% print('BandA1m','-djpeg')



%%%%%%%%%%%%

subplot(1,2,1)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_contour(long,lat,squeeze(gh(9+12*129,:,:)),[1,1],'Linecolor','b','Linewidth',2,'Linestyle',':');
hold on
m_contour(long,lat,squeeze(g(9+12*129,:,:)),[15,15],'Linecolor','r','Linewidth',2,'Linestyle',':');
m_contour(long,lat,squeeze(gh(9+12*149,:,:)),[1,1],'Linecolor','b','Linewidth',2);	
m_contour(long,lat,squeeze(g(9+12*149,:,:)),[15,15],'Linecolor','r','Linewidth',2);	
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('g.ES01 129->149')
subplot(1,2,2)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_contour(long,lat,squeeze(gh(9+12*139,:,:)),[1,1],'Linecolor','b','Linewidth',2,'Linestyle',':');
hold on
m_contour(long,lat,squeeze(g(9+12*139,:,:)),[15,15],'Linecolor','r','Linewidth',2,'Linestyle',':');
m_contour(long,lat,squeeze(gh(9+12*149,:,:)),[1,1],'Linecolor','b','Linewidth',2);	
m_contour(long,lat,squeeze(g(9+12*149,:,:)),[15,15],'Linecolor','r','Linewidth',2);	
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
title('g.ES01 139->149')

