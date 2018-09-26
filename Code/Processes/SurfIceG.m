%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ice Surface fluxes graph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load SurfIce.mat

[nt nlat nlong] = size(swa);
sway = nanmean(nanmean(nanmean(reshape(swa,[12 nt/12 nlat nlong]),4),3),1);
swby = nanmean(nanmean(nanmean(reshape(swb,[12 nt/12 nlat nlong]),4),3),1);
swcy = nanmean(nanmean(nanmean(reshape(swc,[12 nt/12 nlat nlong]),4),3),1);
swey = nanmean(nanmean(nanmean(reshape(swe,[12 nt/12 nlat nlong]),4),3),1);
swfy = nanmean(nanmean(nanmean(reshape(swf,[12 nt/12 nlat nlong]),4),3),1);
swgy = nanmean(nanmean(nanmean(reshape(swg,[12 nt/12 nlat nlong]),4),3),1);
lwday = nanmean(nanmean(nanmean(reshape(lwda.*aa/100,[12 nt/12 nlat nlong]),4),3),1);
lwdby = nanmean(nanmean(nanmean(reshape(lwdb.*ab/100,[12 nt/12 nlat nlong]),4),3),1);
lwdcy = nanmean(nanmean(nanmean(reshape(lwdc.*ac/100,[12 nt/12 nlat nlong]),4),3),1);
lwdey = nanmean(nanmean(nanmean(reshape(lwde.*ae/100,[12 nt/12 nlat nlong]),4),3),1);
lwdfy = nanmean(nanmean(nanmean(reshape(lwdf.*af/100,[12 nt/12 nlat nlong]),4),3),1);
lwdgy = nanmean(nanmean(nanmean(reshape(lwdg.*ag/100,[12 nt/12 nlat nlong]),4),3),1);
lwoay = nanmean(nanmean(nanmean(reshape(lwoa.*aa/100,[12 nt/12 nlat nlong]),4),3),1);
lwoby = nanmean(nanmean(nanmean(reshape(lwob.*ab/100,[12 nt/12 nlat nlong]),4),3),1);
lwocy = nanmean(nanmean(nanmean(reshape(lwoc.*ac/100,[12 nt/12 nlat nlong]),4),3),1);
lwoey = nanmean(nanmean(nanmean(reshape(lwoe.*ae/100,[12 nt/12 nlat nlong]),4),3),1);
lwofy = nanmean(nanmean(nanmean(reshape(lwof.*af/100,[12 nt/12 nlat nlong]),4),3),1);
lwogy = nanmean(nanmean(nanmean(reshape(lwog.*ag/100,[12 nt/12 nlat nlong]),4),3),1);


x = (1900:2099);

subplot(2,3,1)
plot(x,sway,x,lwday,x,-lwoay)
hold on
area([2036 2037], [300 300],'FaceColor', 'k','Linestyle','none');
xlim([1900 2100])
ylim([0 230])
set(gca,'xtick',[1900 1950 2000 2050 2100],'xticklabel',{'1900','','2000','','2100'})
title('a')
ylabel('W/m^2')
grid on


subplot(2,3,2)
plot(x,swby,x,lwdby,x,-lwoby)
hold on
area([2027 2028], [300 300],'FaceColor', 'k','Linestyle','none');
area([2030 2031], [300 300],'FaceColor', 'k','Linestyle','none');
xlim([1900 2100])
ylim([0 230])
set(gca,'xtick',[1900 1950 2000 2050 2100],'xticklabel',{'1900','','2000','','2100'})
title({'Arctic surface fluxes','b.ES01'})
grid on

subplot(2,3,3)
plot(x,swcy,x,lwdcy,x,-lwocy)
hold on
area([2032 2033], [300 300],'FaceColor', 'k','Linestyle','none');
xlim([1900 2100])
ylim([0 230])
set(gca,'xtick',[1900 1950 2000 2050 2100],'xticklabel',{'1900','','2000','','2100'})
title('c')
grid on

subplot(2,3,4)
plot(x,swey,x,lwdey,x,-lwoey)
hold on
area([2032 2033], [300 300],'FaceColor', 'k','Linestyle','none');
xlim([1900 2100])
ylim([0 230])
set(gca,'xtick',[1900 1950 2000 2050 2100],'xticklabel',{'1900','','2000','','2100'})
title('e')
ylabel('W/m^2')
grid on

subplot(2,3,5)
plot(x,swfy,x,lwdfy,x,-lwofy)
hold on
area([2013 2015], [300 300],'FaceColor', 'k','Linestyle','none');
xlim([1900 2100])
ylim([0 230])
set(gca,'xtick',[1900 1950 2000 2050 2100],'xticklabel',{'1900','','2000','','2100'})
title('f.ES01')
grid on

subplot(2,3,6)
plot(x,swgy,x,lwdgy,x,-lwogy)
hold on
area([2044 2045], [300 300],'FaceColor', 'k','Linestyle','none');
xlim([1900 2100])
ylim([0 230])
set(gca,'xtick',[1900 1950 2000 2050 2100],'xticklabel',{'1900','','2000','','2100'})
title('g.ES01')
grid on

% print('SurfIce','-djpeg')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ice Surface fluxes spacial graph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear
addpath /glade/u/home/renaud/scripts/
addpath /glade/u/home/renaud/scripts/m_map
load SurfIce.mat

a = swa+(lwda+lwoa).*aa/100;
b = swb+(lwdb+lwob).*ab/100;
c = swc+(lwdc+lwoc).*ac/100;
e = swe+(lwde+lwoe).*ae/100;
f = swf+(lwdf+lwof).*af/100;
g = swg+(lwdg+lwog).*ag/100;


ncload b30.040g.ES01.csim.h.Flwdn_nh.2000-01_cat_2049-12.nc TLAT TLON

subplot(2,3,1)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON(latt1:latt2,long1:long2),TLAT(latt1:latt2,long1:long2),squeeze(nanmean(a(end-120:end,:,:))-nanmean(a(1:120,:,:))));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); 
caxis([-15 10])
title('a')

subplot(2,3,2)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON(latt1:latt2,long1:long2),TLAT(latt1:latt2,long1:long2),squeeze(nanmean(b(end-120:end,:,:))-nanmean(b(1:120,:,:))));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); 
caxis([-15 10])
title({'Total surface radiation absorbed flux difference between 2090s and 1900s','b.ES01'})

subplot(2,3,3)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON(latt1:latt2,long1:long2),TLAT(latt1:latt2,long1:long2),squeeze(nanmean(c(end-120:end,:,:))-nanmean(c(1:120,:,:))));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); 
caxis([-15 10])
title('c')

subplot(2,3,4)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON(latt1:latt2,long1:long2),TLAT(latt1:latt2,long1:long2),squeeze(nanmean(e(end-120:end,:,:))-nanmean(e(1:120,:,:))));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); 
caxis([-15 10])
title('e')

subplot(2,3,5)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON(latt1:latt2,long1:long2),TLAT(latt1:latt2,long1:long2),squeeze(nanmean(f(end-120:end,:,:))-nanmean(f(1:120,:,:))));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); 
caxis([-15 10])
title('f.ES01')

subplot(2,3,6)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON(latt1:latt2,long1:long2),TLAT(latt1:latt2,long1:long2),squeeze(nanmean(g(end-120:end,:,:))-nanmean(g(1:120,:,:))));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); 
caxis([-15 10])
title('g.ES01')

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-15 10])

% print('SurfIceSpatial','-djpeg')



subplot(1,3,1)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON(latt1:latt2,long1:long2),TLAT(latt1:latt2,long1:long2),squeeze(nanmean(swa(end-120:end,:,:))-nanmean(swa(1:120,:,:))));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); 
colorbar('Location','South')
title('SW')



subplot(1,3,2)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON(latt1:latt2,long1:long2),TLAT(latt1:latt2,long1:long2),squeeze(nanmean(lwda(end-120:end,:,:))-nanmean(lwda(1:120,:,:))));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); 
colorbar('Location','South')
title('Down')


subplot(1,3,3)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON(latt1:latt2,long1:long2),TLAT(latt1:latt2,long1:long2),squeeze(nanmean(lwoa(end-120:end,:,:))-nanmean(lwoa(1:120,:,:))));shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); 
colorbar('Location','South')
title('Out')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nt nlat nlong] = size(swa);
lwday = nanmean(nanmean(nanmean(reshape(lwda,[12 nt/12 nlat nlong]),4),3),1);
lwoay = nanmean(nanmean(nanmean(reshape(lwoa,[12 nt/12 nlat nlong]),4),3),1);
sway = nanmean(nanmean(nanmean(reshape(swa,[12 nt/12 nlat nlong]),4),3),1);
swaay = nanmean(nanmean(nanmean(reshape(swaa,[12 nt/12 nlat nlong]),4),3),1);
latay = nanmean(nanmean(nanmean(reshape(lata,[12 nt/12 nlat nlong]),4),3),1);
senay = nanmean(nanmean(nanmean(reshape(sena,[12 nt/12 nlat nlong]),4),3),1);


x = (1900:2099);
plot(x,lwday,x,lwoay,x,sway,x,swaay,x,latay,x,senay)
legend('LWd','LWo','SW','SWa','Lat','Sens')



plot(x,lwday+lwoay,x,sway,x,swaay,x,latay,x,senay)
legend('LW','SW','SWa','Lat','Sens')
grid on





plot(x,lwday,x,-lwoay,x,sway,x,swaay)
legend('LWd','LWo','SW','SWa')
grid on



















