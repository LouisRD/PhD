% Takes the CCSM3 TEMP, UVEL, VVEL files and output a .mat of the annual gates output/input through the 4 gates of the Arctic Ocean: Barents, Bering, CAA and Fram.
% Start the file in the gates folder with a hist file. 

clear 
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

lat1fram = 370;
lat2fram = 384;
longfram = 100;

lat1barents = 334;
lat2barents = 369;
longbarents = 100;

latbering = 333;
long1bering = 198;
long2bering = 202;

lat1CAA = 333;
lat2CAA = 384;
longCAA = 230;


n20 = 'b40.20th.track1.1deg.';
n21 = 'b40.rcp6_0.1deg.';
nU = '.pop.h.UVEL.';
nV = '.pop.h.VVEL.';
nT = '.pop.h.TEMP.';
nm = 120;

y20a = {'1900' '1910' '1920' '1930' '1940' '1950' '1960' '1970' '1980' '1990'};
y20b = {'1909' '1919' '1929' '1939' '1949' '1959' '1969' '1979' '1989' '1999'};
y21a = {'2000' '2010' '2020' '2030' '2040' '2050' '2060' '2070' '2080' '2090'};
y21b = {'2009' '2019' '2029' '2039' '2049' '2059' '2069' '2079' '2089' '2099'};


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 005 -> 003
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd RCP6_5
nrun20 = '005';
nrun21 = '003';
nameU = strcat(n20,nrun20,nU,y20a,'01-',y20b,'12.nc');
nameU = cat(2,nameU,strcat(n21,nrun21,nU,y21a,'01-',y21b,'12.nc'));
nameV = strcat(n20,nrun20,nV,y20a,'01-',y20b,'12.nc');
nameV = cat(2,nameV,strcat(n21,nrun21,nV,y21a,'01-',y21b,'12.nc'));
nameT = strcat(n20,nrun20,nT,y20a,'01-',y20b,'12.nc');
nameT = cat(2,nameT,strcat(n21,nrun21,nT,y21a,'01-',y21b,'12.nc'));

F5U = zeros(200,50,lat2fram-lat1fram+1);
F5T = zeros(200,50,lat2fram-lat1fram+1);
BA5U = zeros(200,30,lat2barents-lat1barents+1);
BA5T = zeros(200,30,lat2barents-lat1barents+1);
BE5V = zeros(200,6,long2bering-long1bering+1);
BE5T = zeros(200,6,long2bering-long1bering+1);
C5U = zeros(200,30,lat2CAA-lat1CAA+1);
C5T = zeros(200,30,lat2CAA-lat1CAA+1);

for i=1:20
	time = [nrun20 ' --> ' nrun21 ' ' int2str(i)]
	ncload(char(nameU(i)),'UVEL');
	F5U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA5U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C5U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	ncload(char(nameV(i)),'VVEL');
	BE5V(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(VVEL(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	

	ncload(char(nameT(i)),'TEMP');
	F5T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA5T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C5T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	BE5T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	

end

cd ..

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 006 -> 004
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd RCP6_6
nrun20 = '006';
nrun21 = '004';
nameU = strcat(n20,nrun20,nU,y20a,'01-',y20b,'12.nc');
nameU = cat(2,nameU,strcat(n21,nrun21,nU,y21a,'01-',y21b,'12.nc'));
nameV = strcat(n20,nrun20,nV,y20a,'01-',y20b,'12.nc');
nameV = cat(2,nameV,strcat(n21,nrun21,nV,y21a,'01-',y21b,'12.nc'));
nameT = strcat(n20,nrun20,nT,y20a,'01-',y20b,'12.nc');
nameT = cat(2,nameT,strcat(n21,nrun21,nT,y21a,'01-',y21b,'12.nc'));

F6U = zeros(200,50,lat2fram-lat1fram+1);
F6T = zeros(200,50,lat2fram-lat1fram+1);
BA6U = zeros(200,30,lat2barents-lat1barents+1);
BA6T = zeros(200,30,lat2barents-lat1barents+1);
BE6V = zeros(200,6,long2bering-long1bering+1);
BE6T = zeros(200,6,long2bering-long1bering+1);
C6U = zeros(200,30,lat2CAA-lat1CAA+1);
C6T = zeros(200,30,lat2CAA-lat1CAA+1);

for i=1:20
	time = [nrun20 ' --> ' nrun21 ' ' int2str(i)]
	ncload(char(nameU(i)),'UVEL');
	F6U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA6U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C6U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	ncload(char(nameV(i)),'VVEL');
	BE6V(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(VVEL(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	

	ncload(char(nameT(i)),'TEMP');
	F6T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA6T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C6T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	BE6T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	

end

cd ..




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 007 -> 005
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd RCP6_7
nrun20 = '007';
nrun21 = '005';
nameU = strcat(n20,nrun20,nU,y20a,'01-',y20b,'12.nc');
nameU = cat(2,nameU,strcat(n21,nrun21,nU,y21a,'01-',y21b,'12.nc'));
nameV = strcat(n20,nrun20,nV,y20a,'01-',y20b,'12.nc');
nameV = cat(2,nameV,strcat(n21,nrun21,nV,y21a,'01-',y21b,'12.nc'));
nameT = strcat(n20,nrun20,nT,y20a,'01-',y20b,'12.nc');
nameT = cat(2,nameT,strcat(n21,nrun21,nT,y21a,'01-',y21b,'12.nc'));

F7U = zeros(200,50,lat2fram-lat1fram+1);
F7T = zeros(200,50,lat2fram-lat1fram+1);
BA7U = zeros(200,30,lat2barents-lat1barents+1);
BA7T = zeros(200,30,lat2barents-lat1barents+1);
BE7V = zeros(200,6,long2bering-long1bering+1);
BE7T = zeros(200,6,long2bering-long1bering+1);
C7U = zeros(200,30,lat2CAA-lat1CAA+1);
C7T = zeros(200,30,lat2CAA-lat1CAA+1);

for i=1:20
	time = [nrun20 ' --> ' nrun21 ' ' int2str(i)]
	ncload(char(nameU(i)),'UVEL');
	F7U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA7U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C7U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	ncload(char(nameV(i)),'VVEL');
	BE7V(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(VVEL(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	

	ncload(char(nameT(i)),'TEMP');
	F7T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA7T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C7T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	BE7T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	

end

cd ..


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 008 -> 001
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd RCP6_8
nrun20 = '008';
nrun21 = '001';
nameU = strcat(n20,nrun20,nU,y20a,'01-',y20b,'12.nc');
nameU = cat(2,nameU,strcat(n21,nrun21,nU,y21a,'01-',y21b,'12.nc'));
nameV = strcat(n20,nrun20,nV,y20a,'01-',y20b,'12.nc');
nameV = cat(2,nameV,strcat(n21,nrun21,nV,y21a,'01-',y21b,'12.nc'));
nameT = strcat(n20,nrun20,nT,y20a,'01-',y20b,'12.nc');
nameT = cat(2,nameT,strcat(n21,nrun21,nT,y21a,'01-',y21b,'12.nc'));

F8U = zeros(200,50,lat2fram-lat1fram+1);
F8T = zeros(200,50,lat2fram-lat1fram+1);
BA8U = zeros(200,30,lat2barents-lat1barents+1);
BA8T = zeros(200,30,lat2barents-lat1barents+1);
BE8V = zeros(200,6,long2bering-long1bering+1);
BE8T = zeros(200,6,long2bering-long1bering+1);
C8U = zeros(200,30,lat2CAA-lat1CAA+1);
C8T = zeros(200,30,lat2CAA-lat1CAA+1);

for i=1:20
	time = [nrun20 ' --> ' nrun21 ' ' int2str(i)]
	ncload(char(nameU(i)),'UVEL');
	F8U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA8U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C8U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	ncload(char(nameV(i)),'VVEL');
	BE8V(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(VVEL(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	

	ncload(char(nameT(i)),'TEMP');
	F8T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA8T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C8T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	BE8T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	

end

cd ..


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 009 -> 002
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd RCP6_9
nrun20 = '009';
nrun21 = '002';
nameU = strcat(n20,nrun20,nU,y20a,'01-',y20b,'12.nc');
nameU = cat(2,nameU,strcat(n21,nrun21,nU,y21a,'01-',y21b,'12.nc'));
nameV = strcat(n20,nrun20,nV,y20a,'01-',y20b,'12.nc');
nameV = cat(2,nameV,strcat(n21,nrun21,nV,y21a,'01-',y21b,'12.nc'));
nameT = strcat(n20,nrun20,nT,y20a,'01-',y20b,'12.nc');
nameT = cat(2,nameT,strcat(n21,nrun21,nT,y21a,'01-',y21b,'12.nc'));

F9U = zeros(200,50,lat2fram-lat1fram+1);
F9T = zeros(200,50,lat2fram-lat1fram+1);
BA9U = zeros(200,30,lat2barents-lat1barents+1);
BA9T = zeros(200,30,lat2barents-lat1barents+1);
BE9V = zeros(200,6,long2bering-long1bering+1);
BE9T = zeros(200,6,long2bering-long1bering+1);
C9U = zeros(200,30,lat2CAA-lat1CAA+1);
C9T = zeros(200,30,lat2CAA-lat1CAA+1);

for i=1:20
	time = [nrun20 ' --> ' nrun21 ' ' int2str(i)]
	ncload(char(nameU(i)),'UVEL');
	F9U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA9U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C9U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	ncload(char(nameV(i)),'VVEL');
	BE9V(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(VVEL(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	

	ncload(char(nameT(i)),'TEMP');
	F9T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA9T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C9T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	BE9T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	

end

cd ..


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 012 -> 006
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd RCP6_12
nrun20 = '012';
nrun21 = '006';
nameU = strcat(n20,nrun20,nU,y20a,'01-',y20b,'12.nc');
nameU = cat(2,nameU,strcat(n21,nrun21,nU,y21a,'01-',y21b,'12.nc'));
nameV = strcat(n20,nrun20,nV,y20a,'01-',y20b,'12.nc');
nameV = cat(2,nameV,strcat(n21,nrun21,nV,y21a,'01-',y21b,'12.nc'));
nameT = strcat(n20,nrun20,nT,y20a,'01-',y20b,'12.nc');
nameT = cat(2,nameT,strcat(n21,nrun21,nT,y21a,'01-',y21b,'12.nc'));

F12U = zeros(200,50,lat2fram-lat1fram+1);
F12T = zeros(200,50,lat2fram-lat1fram+1);
BA12U = zeros(200,30,lat2barents-lat1barents+1);
BA12T = zeros(200,30,lat2barents-lat1barents+1);
BE12V = zeros(200,6,long2bering-long1bering+1);
BE12T = zeros(200,6,long2bering-long1bering+1);
C12U = zeros(200,30,lat2CAA-lat1CAA+1);
C12T = zeros(200,30,lat2CAA-lat1CAA+1);

for i=1:20
	time = [nrun20 ' --> ' nrun21 ' ' int2str(i)]
	ncload(char(nameU(i)),'UVEL');
	F12U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA12U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C12U(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	ncload(char(nameV(i)),'VVEL');
	BE12V(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(VVEL(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	

	ncload(char(nameT(i)),'TEMP');
	F12T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA12T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C12T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	BE12T(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	

end

cd ..



save Gates4VT.mat
