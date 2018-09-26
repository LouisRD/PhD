clear
addpath /glade/u/home/renaud/scripts
addpath /glade/u/home/renaud/scripts/m_map

ncload b30.040b.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice TLAT TLON
a = aice(9:12:end,:,:);
ncload b30.040b.ES01.csim.h.hi_nh.2000-01_cat_2049-12.nc hi
h = hi(9:12:end,:,:);
ncload b30.040b.ES01.csim.h.Fhnet_nh.2000-01_cat_2049-12.nc Fhnet
[nt nlat nlon] = size(Fhnet);
tmp = reshape(Fhnet,[12 nt/12 nlat nlon]);
f = squeeze(nanmean(tmp));
fs = squeeze(tmp(7,:,:,:)+tmp(8,:,:,:)+tmp(9,:,:,:))/3;
fw = squeeze(tmp(1,:,:,:)+tmp(2,:,:,:)+tmp(3,:,:,:))/3;
clearvars tmp

ncload  b30.040b.ES01.csim.h.Flwdn_nh.2000-01_cat_2049-12.nc Flwdn
[nt nlat nlon] = size(Fhnet);
tmp = reshape(Flwdn,[12 nt/12 nlat nlon]);
flw = squeeze(nanmean(tmp));
flws = squeeze(tmp(7,:,:,:)+tmp(8,:,:,:)+tmp(9,:,:,:))/3;
flww = squeeze(tmp(1,:,:,:)+tmp(2,:,:,:)+tmp(3,:,:,:))/3;
clearvars tmp




n= 3;
p = 26;
for i=1:n^2
subplot(n,n,i)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,squeeze(flws(p+i,:,:)));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([250 330])
title(int2str(2026+i))
end
colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([250 330])
print('flws','-djpeg')

for i=1:n^2
subplot(n,n,i)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,squeeze(flww(p+i,:,:)));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([150 300])
title(int2str(2026+i))
end
colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([150 300])
print('flww','-djpeg')











n= 3;
p = 26;

for i=1:n^2
subplot(n,n,i)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,squeeze(-fs(p+i,:,:)));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([0 100])
title(int2str(2026+i))
end
colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([0 100])
print('fs9','-djpeg')

for i=1:n^2
subplot(n,n,i)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,squeeze(-fw(p+i,:,:)));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([0 10])
title(int2str(2026+i))
end
colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([0 10])
print('fw9','-djpeg')













n= 3;
p = 26;
for i=1:n^2
subplot(n,n,i)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,squeeze(a(p+i,:,:)));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([0 100])
title(int2str(2015+i))
end
print('aice9','-djpeg')

for i=1:n^2
subplot(n,n,i)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,squeeze(h(p+i,:,:)));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([0 3])
title(int2str(2015+i))  
end
print('h9','-djpeg')

for i=1:n^2
subplot(n,n,i)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,squeeze(-f(p+i,:,:)));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([0 10])
title(int2str(2015+i))
end
print('f9','-djpeg')


















