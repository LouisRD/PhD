clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

ncload b30.030a.csim.h.aice.1870-01_cat_1999-12.nc tarea aice
a = aice(30*12+1:end,end-103:end,:);
ncload b30.040a.csim.h.aice.2000-01_cat_2099-12.nc aice
a = cat(1,a,aice(:,end-103:end,:));
[nt nlat nlong] = size(a);
TA = repmat(tarea(end-103:end,:),[1 1 nt]);
TA = permute(TA,[3 1 2]);
indexNaN = find(isnan(a)==1);
index15 = find(a<15);
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index15) = NaN;
aE = nansum(nansum(tmp,2),3);
aC = nansum(nansum(a(:,latt1:latt2,long1:long2).*TA(:,latt1:latt2,long1:long2),2),3);

ncload b30.030b.ES01.csim.h.aice_nh.1900-01_cat_1949-12.nc aice 
b = aice;
ncload b30.030b.ES01.csim.h.aice_nh.1950-01_cat_1999-12.nc aice
b = cat(1,b,aice);
ncload b30.040b.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
b = cat(1,b,aice);
ncload b30.040b.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
b = cat(1,b,aice);
indexNaN = find(isnan(b)==1);
index15 = find(b<15);
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index15) = NaN;
bE = nansum(nansum(tmp,2),3);
bC = nansum(nansum(b(:,latt1:latt2,long1:long2).*TA(:,latt1:latt2,long1:long2),2),3);

ncload b30.030c.csim.h.aice.1870-01_cat_1999-12.nc aice
c = aice(30*12+1:end,end-103:end,:);
ncload b30.040c.csim.h.aice_nh.2000-01_cat_2049-12.nc aice tarea
c = cat(1,c,aice);
ncload b30.040c.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
c = cat(1,c,aice);
indexNaN = find(isnan(c)==1);
index15 = find(c<15);
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index15) = NaN;
cE = nansum(nansum(tmp,2),3);
cC = nansum(nansum(c(:,latt1:latt2,long1:long2).*TA(:,latt1:latt2,long1:long2),2),3);

ncload b30.030e.csim.h.aice.1870-01_cat_1999-12.nc aice tarea
e = aice(30*12+1:end,end-103:end,:);
ncload b30.040e.csim.h.aice.2000-01_cat_2099-12.nc aice
e = cat(1,e,aice(:,end-103:end,:));
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index15) = NaN;
eE = nansum(nansum(tmp,2),3);
eC = nansum(nansum(e(:,latt1:latt2,long1:long2).*TA(:,latt1:latt2,long1:long2),2),3);

ncload b30.030f.ES01.csim.h.aice.1870-01_cat_1999-12.nc aice
f = aice(30*12+1:end,end-103:end,:);
ncload b30.040f.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice tarea
f = cat(1,f,aice);
ncload b30.040f.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
f = cat(1,f,aice);
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index15) = NaN;
fE = nansum(nansum(tmp,2),3);
fC = nansum(nansum(f(:,latt1:latt2,long1:long2).*TA(:,latt1:latt2,long1:long2),2),3);

ncload b30.030g.ES01.csim.h.aice_nh.1900-01_cat_1949-12.nc aice tarea
g = aice;
ncload b30.030g.ES01.csim.h.aice_nh.1950-01_cat_1999-12.nc aice
g = cat(1,g,aice);
ncload b30.040g.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
g = cat(1,g,aice);
ncload b30.040g.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
g = cat(1,g,aice);
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index15) = NaN;
gE = nansum(nansum(tmp,2),3);
gC = nansum(nansum(g(:,latt1:latt2,long1:long2).*TA(:,latt1:latt2,long1:long2),2),3);

% Minimum occurs in September (9)
% Maximum occurs in March (3)

x = (1900:2099);
subplot(3,2,1)
plot(x,aC(3:12:end)/10^14,'b',x,aE(9:12:end)/10^12,'r',x,aC(9:12:end)/10^14,'b','LineWidth',2)
hold on
area([2036 2037], [10 10],'FaceColor', 'k','Linestyle','none');
hold off
grid on
title('a')
ylim([0 10])
set(gca,'YTick',[(0:2:10)])

subplot(3,2,2)
plot(x,bC(3:12:end)/10^14,'b',x,bC(9:12:end)/10^14,'b',x,bE(9:12:end)/10^12,'r','LineWidth',2)
hold on
area([2027 2028], [10 10],'FaceColor', 'k','Linestyle','none');
area([2030 2031], [10 10],'FaceColor', 'k','Linestyle','none');
hold off
grid on
title('b.ES01')
ylim([0 10])
set(gca,'YTick',[(0:2:10)])

subplot(3,2,3)
plot(x,cC(3:12:end)/10^14,'b',x,cC(9:12:end)/10^14,'b',x,cE(9:12:end)/10^12,'r','LineWidth',2)
hold on
area([2032 2033], [10 10],'FaceColor', 'k','Linestyle','none');
hold off
grid on
title('c')
ylim([0 10])
ylabel('10^6 km^2')
set(gca,'YTick',[(0:2:10)])

subplot(3,2,4)
plot(x,eC(3:12:end)/10^14,'b',x,eC(9:12:end)/10^14,'b',x,eE(9:12:end)/10^12,'r','LineWidth',2)
hold on
area([2032 2033], [10 10],'FaceColor', 'k','Linestyle','none');
hold off
grid on
title('e')
ylim([0 10])
set(gca,'YTick',[(0:2:10)])

subplot(3,2,5)
plot(x,fC(3:12:end)/10^14,'b',x,fC(9:12:end)/10^14,'b',x,fE(9:12:end)/10^12,'r','LineWidth',2)
hold on
area([2013 2015], [10 10],'FaceColor', 'k','Linestyle','none');
hold off
grid on
title('f.ES01')
ylim([0 10])
set(gca,'YTick',[(0:2:10)])

subplot(3,2,6)
plot(x,gC(3:12:end)/10^14,'b',x,gC(9:12:end)/10^14,'b',x,gE(9:12:end)/10^12,'r','LineWidth',2)
hold on
area([2044 2045], [10 10],'FaceColor', 'k','Linestyle','none');
hold off
grid on
title('g.ES01')
ylim([0 10])
set(gca,'YTick',[(0:2:10)])

print('aice','-djpeg')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
addpath /glade/u/home/renaud/scripts
addpath /glade/u/home/renaud/scripts/m_map

ncload b30.040a.csim.h.aice.2000-01_cat_2099-12.nc TLAT TLON aice
lat = TLAT;
lon = TLON;
a = squeeze(aice(end-9,:,:));
ncload b30.040b.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice TLAT TLON
b = squeeze(aice(end-9,:,:));
ncload b30.040c.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
c = squeeze(aice(end-9,:,:));
ncload b30.040e.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
e = squeeze(aice(end-9,:,:));
ncload b30.040f.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
f = squeeze(aice(end-9,:,:));
ncload b30.040g.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
g = squeeze(aice(end-9,:,:));


subplot(2,3,1)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(lon,lat,a);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([0 100])
title('a')
subplot(2,3,2)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,b);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([0 100])
title('b.ES01')
subplot(2,3,3)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,c);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([0 100])
title('c')
subplot(2,3,4)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,e);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([0 100])
title('e')
subplot(2,3,5)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,f);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([0 100])
title('f.ES01')
subplot(2,3,6)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,g);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([0 100])
title('g.ES01')
print('MarchAice2099','-djpeg')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


load aice.mat
addpath /glade/u/home/renaud/scripts/
addpath /glade/u/home/renaud/scripts/m_map
ncload b30.030a.csim.h.aice.1870-01_cat_1871-12.nc TLAT TLON
TLAT = TLAT(end-103:end,:);
TLON = TLON(end-103:end,:);

am99 = squeeze(a(end-9,:,:));
bm99 = squeeze(b(end-9,:,:));
cm99 = squeeze(c(end-9,:,:));
em99 = squeeze(e(end-9,:,:));
fm99 = squeeze(f(end-9,:,:));
gm99 = squeeze(g(end-9,:,:));


subplot(2,3,1)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,am99);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([0 100])
title('a')
subplot(2,3,2)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,bm99);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([0 100])
title({'March 2099 ice concentration';'';'b.ES01'})
subplot(2,3,3)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,cm99);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([0 100])
title('c')
subplot(2,3,4)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,em99);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([0 100])
title('e')
subplot(2,3,5)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,fm99);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([0 100])
title('f.ES01')
subplot(2,3,6)
m_proj('stereographic','lat',90,'long',0,'radius',25);
m_pcolor(TLON,TLAT,gm99);shading interp
m_grid('Xtick',[],'Ytick',[],'yticklabels',[],'xticklabels',[],'linestyle','none','ticklen',.02);
m_coast('patch',[.7 .7 .7],'edgecolor','k'); %colorbar
caxis([0 100])
title('g.ES01')

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([0 100])

%print('MarchAice2099','-djpeg')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load aice.mat
tmp = aC(9:12:end);
asC = (tmp(5:end)+tmp(4:end-1)+tmp(3:end-2)+tmp(2:end-3)+tmp(1:end-4))/5;
dasC = asC(2:end)-asC(1:end-1);
plot(dasC)
max(dasC)/10^14

tmp = bC(9:12:end);
bsC = (tmp(5:end)+tmp(4:end-1)+tmp(3:end-2)+tmp(2:end-3)+tmp(1:end-4))/5;
dbsC = bsC(2:end)-bsC(1:end-1);
plot(dbsC)
max(dbsC)/10^14

tmp = cC(9:12:end);
csC = (tmp(5:end)+tmp(4:end-1)+tmp(3:end-2)+tmp(2:end-3)+tmp(1:end-4))/5;
dcsC = csC(2:end)-csC(1:end-1);
plot(dcsC)
max(dcsC)/10^14

tmp = eC(9:12:end);
esC = (tmp(5:end)+tmp(4:end-1)+tmp(3:end-2)+tmp(2:end-3)+tmp(1:end-4))/5;
desC = esC(2:end)-esC(1:end-1);
plot(desC)
max(desC)/10^14

tmp = fC(9:12:end);
fsC = (tmp(5:end)+tmp(4:end-1)+tmp(3:end-2)+tmp(2:end-3)+tmp(1:end-4))/5;
dfsC = fsC(2:end)-fsC(1:end-1);
plot(dfsC)
max(dfsC)/10^14

tmp = gC(9:12:end);
gsC = (tmp(5:end)+tmp(4:end-1)+tmp(3:end-2)+tmp(2:end-3)+tmp(1:end-4))/5;
dgsC = gsC(2:end)-gsC(1:end-1);
plot(dgsC)
max(dgsC)/10^14









