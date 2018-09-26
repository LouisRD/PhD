% fonction ncload
addpath /glade/u/home/renaud/scripts
% carte pour faire les graphiques
addpath /glade/u/home/renaud/scripts/m_map

ncload b30.030b.ES01.pop.h.SHF.1980-01_cat_1989-12.nc TLAT TLONG TAREA SHF
%%%%%%%%%%%%

lat1A = 333;
lat2A = 384;
long1A = 100;
long2A = 230;

lat1fram = 370;
lat2fram = 384;
longfram = 100;

lat1barents = 334;
lat2barents = 369;
longbarents = 100;

latbering = 333;
long1bering = 199;
long2bering = 202;

lat1CAA = 333;
lat2CAA = 384;
longCAA = 230;


% Région Arctique. 

clf
m_proj('stereographic','lat',90,'long',0,'radius',40);
%m_grid('xtick',4,'tickdir','out','ytick',[65 75],'linest','-');
%m_coast('patch',[.7 .7 .7],'edgecolor','k');

lon = TLONG(333,100:230);
lat = TLAT(333,100:230);
m_line(lon,lat,'linewi',3,'color','r')

lon = TLONG(384,100:230);
lat = TLAT(384,100:230);
m_line(lon,lat,'linewi',3,'color','r')

lon = TLONG(333:384,100);
lat = TLAT(333:384,100);
m_line(lon,lat,'linewi',3,'color','r')

lon = TLONG(333:384,230);
lat = TLAT(333:384,230);
m_line(lon,lat,'linewi',3,'color','r')

m_grid('xtick',4,'tickdir','out','ytick',[65 75],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','k');


m_text(TLONG(lat1fram/2+lat2fram/2,longfram-5),TLAT(lat1fram/2+lat2fram/2,longfram-5),{'\uparrow' , 'Fram Strait'},'HorizontalAlignment','center','VerticalAlignment','top','FontWeight','bold')
m_text(TLONG(lat1CAA/2+lat2CAA/2+19/2,longCAA),TLAT(lat1CAA/2+lat2CAA/2+19/2,longCAA),'CAA \rightarrow ','HorizontalAlignment','right','FontWeight','bold')
m_text(TLONG(latbering-1,long1bering/2+1/2+long2bering/2),TLAT(latbering-1,long1bering/2+1/2+long2bering/2),{'Bering Strait','\downarrow'},'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold')
m_text(TLONG(lat1barents/2+lat2barents/2+11/2,longbarents+1),TLAT(lat1barents/2+lat2barents/2+11/2,longbarents+1),{'BSO','\downarrow'},'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold')

print('AA2+','-djpeg')



%%%%%%%%%%%%%%%%%%%%%%

tmp = squeeze(SHF(1,:,:));
index = find(isnan(tmp)==1);
TAREA(index) = NaN;
TA = nansum(nansum(TAREA(lat1A:lat2A,long1A:long2A)))/100^2;











