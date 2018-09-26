% Takes the CCSM4 UET and VNT files and output a .mat of the annual gates output/input through the 4 gates of the Arctic Ocean: Barents, Bering, CAA and Fram.
% Start the file in the gates folder with a hist file. 

% The 2000-2005 and 2005-2009 files were concatenated in a 2000-2009 file under the RCP name.

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
nUET = '.pop.h.UET.';
nVNT = '.pop.h.VNT.';
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
nameU = strcat(n20,nrun20,nUET,y20a,'01-',y20b,'12.nc');
nameU = cat(2,nameU,strcat(n21,nrun21,nUET,y21a,'01-',y21b,'12.nc'));
nameV = strcat(n20,nrun20,nVNT,y20a,'01-',y20b,'12.nc');
nameV = cat(2,nameV,strcat(n21,nrun21,nVNT,y21a,'01-',y21b,'12.nc'));

F5 = zeros(200,50,lat2fram-lat1fram+1);
BA5 = zeros(200,30,lat2barents-lat1barents+1);
BE5 = zeros(200,6,long2bering-long1bering+1);
C5 = zeros(200,30,lat2CAA-lat1CAA+1);

for i=1:20
	time = [nrun20 ' --> ' nrun21 ' ' int2str(i)]
	ncload(char(nameU(i)),'UET');
	F5(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA5(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C5(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	ncload(char(nameV(i)),'VNT');
	BE5(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(VNT(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	
end

cd ..

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 006 -> 004
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd RCP6_6
nrun20 = '006';
nrun21 = '004';
nameU = strcat(n20,nrun20,nUET,y20a,'01-',y20b,'12.nc');
nameU = cat(2,nameU,strcat(n21,nrun21,nUET,y21a,'01-',y21b,'12.nc'));
nameV = strcat(n20,nrun20,nVNT,y20a,'01-',y20b,'12.nc');
nameV = cat(2,nameV,strcat(n21,nrun21,nVNT,y21a,'01-',y21b,'12.nc'));

F6 = zeros(200,50,lat2fram-lat1fram+1);
BA6 = zeros(200,30,lat2barents-lat1barents+1);
BE6 = zeros(200,6,long2bering-long1bering+1);
C6 = zeros(200,30,lat2CAA-lat1CAA+1);

for i=1:20
	time = [nrun20 ' --> ' nrun21 ' ' int2str(i)]
	ncload(char(nameU(i)),'UET');
	F6(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA6(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C6(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	ncload(char(nameV(i)),'VNT');
	BE6(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(VNT(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	
end

cd ..

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 007 -> 005
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd RCP6_7
nrun20 = '007';
nrun21 = '005';
nameU = strcat(n20,nrun20,nUET,y20a,'01-',y20b,'12.nc');
nameU = cat(2,nameU,strcat(n21,nrun21,nUET,y21a,'01-',y21b,'12.nc'));
nameV = strcat(n20,nrun20,nVNT,y20a,'01-',y20b,'12.nc');
nameV = cat(2,nameV,strcat(n21,nrun21,nVNT,y21a,'01-',y21b,'12.nc'));

F7 = zeros(200,50,lat2fram-lat1fram+1);
BA7 = zeros(200,30,lat2barents-lat1barents+1);
BE7 = zeros(200,6,long2bering-long1bering+1);
C7 = zeros(200,30,lat2CAA-lat1CAA+1);

for i=1:20
	time = [nrun20 ' --> ' nrun21 ' ' int2str(i)]
	ncload(char(nameU(i)),'UET');
	F7(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA7(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C7(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	ncload(char(nameV(i)),'VNT');
	BE7(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(VNT(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	
end

cd ..

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 008 -> 001
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd RCP6_8
nrun20 = '008';
nrun21 = '001';
nameU = strcat(n20,nrun20,nUET,y20a,'01-',y20b,'12.nc');
nameU = cat(2,nameU,strcat(n21,nrun21,nUET,y21a,'01-',y21b,'12.nc'));
nameV = strcat(n20,nrun20,nVNT,y20a,'01-',y20b,'12.nc');
nameV = cat(2,nameV,strcat(n21,nrun21,nVNT,y21a,'01-',y21b,'12.nc'));

F8 = zeros(200,50,lat2fram-lat1fram+1);
BA8 = zeros(200,30,lat2barents-lat1barents+1);
BE8 = zeros(200,6,long2bering-long1bering+1);
C8 = zeros(200,30,lat2CAA-lat1CAA+1);

for i=1:20
	time = [nrun20 ' --> ' nrun21 ' ' int2str(i)]
	ncload(char(nameU(i)),'UET');
	F8(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA8(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C8(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	ncload(char(nameV(i)),'VNT');
	BE8(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(VNT(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	
end

cd ..

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 009 -> 002
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd RCP6_9
nrun20 = '009';
nrun21 = '002';
nameU = strcat(n20,nrun20,nUET,y20a,'01-',y20b,'12.nc');
nameU = cat(2,nameU,strcat(n21,nrun21,nUET,y21a,'01-',y21b,'12.nc'));
nameV = strcat(n20,nrun20,nVNT,y20a,'01-',y20b,'12.nc');
nameV = cat(2,nameV,strcat(n21,nrun21,nVNT,y21a,'01-',y21b,'12.nc'));

F9 = zeros(200,50,lat2fram-lat1fram+1);
BA9 = zeros(200,30,lat2barents-lat1barents+1);
BE9 = zeros(200,6,long2bering-long1bering+1);
C9 = zeros(200,30,lat2CAA-lat1CAA+1);

for i=1:20
	time = [nrun20 ' --> ' nrun21 ' ' int2str(i)]
	ncload(char(nameU(i)),'UET');
	F9(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA9(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C9(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	ncload(char(nameV(i)),'VNT');
	BE9(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(VNT(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	
end

cd ..

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 012 -> 006
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd RCP6_12
nrun20 = '012';
nrun21 = '006';
nameU = strcat(n20,nrun20,nUET,y20a,'01-',y20b,'12.nc');
nameU = cat(2,nameU,strcat(n21,nrun21,nUET,y21a,'01-',y21b,'12.nc'));
nameV = strcat(n20,nrun20,nVNT,y20a,'01-',y20b,'12.nc');
nameV = cat(2,nameV,strcat(n21,nrun21,nVNT,y21a,'01-',y21b,'12.nc'));

F12 = zeros(200,50,lat2fram-lat1fram+1);
BA12 = zeros(200,30,lat2barents-lat1barents+1);
BE12 = zeros(200,6,long2bering-long1bering+1);
C12 = zeros(200,30,lat2CAA-lat1CAA+1);

for i=1:20
	time = [nrun20 ' --> ' nrun21 ' ' int2str(i)]
	ncload(char(nameU(i)),'UET');
	F12(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:50,lat1fram:lat2fram,longfram)),[12 nm/12 50 lat2fram-lat1fram+1])));
	BA12(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:30,lat1barents:lat2barents,longbarents)),[12 nm/12 30 lat2barents-lat1barents+1])));	
	C12(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UET(:,1:30,lat1CAA:lat2CAA,longCAA)),[12 nm/12 30 lat2CAA-lat1CAA+1])));	
	ncload(char(nameV(i)),'VNT');
	BE12(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(VNT(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));	
end

cd ..
clearvars UET VNT

save Gates4.mat


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Facteur de Conversion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ncload b40.20th.track1.1deg.005.pop.h2.2004-09-01.nc dz TAREA rho_sw cp_sw
cp_sw = cp_sw*10^-7; % erg/(gC) -> J/(gC)
nz = size(dz); [nlat nlong] = size(TAREA); nt=10;
AREA = squeeze(repmat(TAREA,[1 1 nz nt]));
AREA = permute(AREA,[4 3 1 2]);
z = repmat(dz,[1 nlat nlong nt]);
z = permute(z,[4 1 2 3]);
% conversion variables from C/s -> W
Fconv4 = squeeze(AREA(:,1:50,lat1fram:lat2fram,longfram).*z(:,1:50,lat1fram:lat2fram,longfram)*cp_sw*rho_sw);
BAconv4 = squeeze(AREA(:,1:30,lat1barents:lat2barents,longbarents).*z(:,1:30,lat1barents:lat2barents,longbarents)*cp_sw*rho_sw);
BEconv4 = squeeze(AREA(:,1:6,latbering,long1bering:long2bering).*z(:,1:6,latbering,long1bering:long2bering)*cp_sw*rho_sw);
Cconv4 = squeeze(AREA(:,1:30,lat1CAA:lat2CAA,longCAA).*z(:,1:30,lat1CAA:lat2CAA,longCAA)*cp_sw*rho_sw);
clearvars AREA nz nt nlat nlong cp_sw rhp_sw TAREA dz 

save conv4.mat


