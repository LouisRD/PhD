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

n20 = 'b30.030';
n21 = 'b30.040';
nU = '.pop.h.UVEL.';
nV = '.pop.h.VVEL.';
nT = '.pop.h.TEMP.';

y20a = {'1900' '1910' '1920' '1930' '1940' '1950' '1960' '1970' '1980' '1990'};
y20b = {'1909' '1919' '1929' '1939' '1949' '1959' '1969' '1979' '1989' '1999'};
y20 = {'1900' '1901' '1902' '1903' '1904' '1905' '1906' '1907' '1908' '1909' ...
	'1910' '1911' '1912' '1913' '1914' '1915' '1916' '1917' '1918' '1919' ...
	'1920' '1921' '1922' '1923' '1924' '1925' '1926' '1927' '1928' '1929' ...
	'1930' '1931' '1932' '1933' '1934' '1935' '1936' '1937' '1938' '1939' ...
	'1940' '1941' '1942' '1943' '1944' '1945' '1946' '1947' '1948' '1949' ...
	'1950' '1951' '1952' '1953' '1954' '1955' '1956' '1957' '1958' '1959' ...
	'1960' '1961' '1962' '1963' '1964' '1965' '1966' '1967' '1968' '1969' ...
	'1970' '1971' '1972' '1973' '1974' '1975' '1976' '1977' '1978' '1979' ...
	'1980' '1981' '1982' '1983' '1984' '1985' '1986' '1987' '1988' '1989' ...
	'1990' '1991' '1992' '1993' '1994' '1995' '1996' '1997' '1998' '1999' };
y21a = {'2000' '2010' '2020' '2030' '2040' '2050' '2060' '2070' '2080' '2090'};
y21a5 = {'2000' '2005' '2010' '2015' '2020' '2025' '2030' '2035' '2040' '2045' '2050' '2055' '2060' '2065' '2070' '2075' '2080' '2085' '2090' '2095'};
y21b = {'2009' '2019' '2029' '2039' '2049' '2059' '2069' '2079' '2089' '2099'};
y21b5 = {'2004' '2009' '2014' '2019' '2024' '2029' '2034' '2039' '2044' '2049' '2054' '2059'  '2064' '2069' '2074' '2079' '2084' '2089' '2094' '2099'};
y21 = {'2000' '2001' '2002' '2003' '2004' '2005' '2006' '2007' '2008' '2009' ...
	'2010' '2011' '2012' '2013' '2014' '2015' '2016' '2017' '2018' '2019' ...
	'2020' '2021' '2022' '2023' '2024' '2025' '2026' '2027' '2028' '2029' ...
	'2030' '2031' '2032' '2033' '2034' '2035' '2036' '2037' '2038' '2039' ...
	'2040' '2041' '2042' '2043' '2044' '2045' '2046' '2047' '2048' '2049' ...
	'2050' '2051' '2052' '2053' '2054' '2055' '2056' '2057' '2058' '2059' ...
	'2060' '2061' '2062' '2063' '2064' '2065' '2066' '2067' '2068' '2069' ...
	'2070' '2071' '2072' '2073' '2074' '2075' '2076' '2077' '2078' '2079' ...
	'2080' '2081' '2082' '2083' '2084' '2085' '2086' '2087' '2088' '2089' ...
	'2090' '2091' '2092' '2093' '2094' '2095' '2096' '2097' '2098' '2099' };
nm = 120;
nm5 = 60;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% b.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd A1Bb
nrun = 'b.ES01';
nameU = strcat(n20,nrun,nU,y20a,'01-',y20b,'12.nc');
nameU = cat(2,nameU,strcat(n21,nrun,nU,y21a,'01-',y21b,'12.nc'));
nameV = strcat(n20,nrun,nV,y20a,'01-',y20b,'12.nc');
nameV = cat(2,nameV,strcat(n21,nrun,nV,y21a,'01-',y21b,'12.nc'));
nameT = strcat(n20,nrun,nT,y20a,'01-',y20b,'12.nc');
nameT = cat(2,nameT,strcat(n21,nrun,nT,y21a,'01-',y21b,'12.nc'));

FbU = zeros(200,30,lat2fram-lat1fram+1);
FbT = zeros(200,30,lat2fram-lat1fram+1);
BAbU = zeros(200,16,lat2barents-lat1barents+1);
BAbT = zeros(200,16,lat2barents-lat1barents+1);
BEbV = zeros(200,6,long2bering-long1bering+1);
BEbT = zeros(200,6,long2bering-long1bering+1);
CbU = zeros(200,16,lat2CAA-lat1CAA+1);
CbT = zeros(200,16,lat2CAA-lat1CAA+1);


for i=1:20
	time = [nrun ' ' int2str(i)]
	ncload(char(nameU(i)),'UVEL');
	FbU(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:30,lat1fram:lat2fram,longfram)),[12 nm/12 30 lat2fram-lat1fram+1])));
	BAbU(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:16,lat1barents:lat2barents,longbarents)),[12 nm/12 16 lat2barents-lat1barents+1])));	
	CbU(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:16,lat1CAA:lat2CAA,longCAA)),[12 nm/12 16 lat2CAA-lat1CAA+1])));	
	ncload(char(nameV(i)),'VVEL');
	BEbV(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(VVEL(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));
	ncload(char(nameT(i)),'TEMP');
	FbT(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:30,lat1fram:lat2fram,longfram)),[12 nm/12 30 lat2fram-lat1fram+1])));
	BAbT(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:16,lat1barents:lat2barents,longbarents)),[12 nm/12 16 lat2barents-lat1barents+1])));	
	CbT(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:16,lat1CAA:lat2CAA,longCAA)),[12 nm/12 16 lat2CAA-lat1CAA+1])));	
	BEbT(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));
end

cd ..


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% f.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd A1Bf
nrun = 'f.ES01';
nameU = strcat(n20,nrun,nU,y20a,'01-',y20b,'12.nc');
nameU = cat(2,nameU,strcat(n21,nrun,nU,y21a,'01-',y21b,'12.nc'));
nameV = strcat(n20,nrun,nV,y20a,'01-',y20b,'12.nc');
nameV = cat(2,nameV,strcat(n21,nrun,nV,y21a,'01-',y21b,'12.nc'));
nameT = strcat(n20,nrun,nT,y20a,'01-',y20b,'12.nc');
nameT = cat(2,nameT,strcat(n21,nrun,nT,y21a,'01-',y21b,'12.nc'));

FfU = zeros(200,30,lat2fram-lat1fram+1);
FfT = zeros(200,30,lat2fram-lat1fram+1);
BAfU = zeros(200,16,lat2barents-lat1barents+1);
BAfT = zeros(200,16,lat2barents-lat1barents+1);
BEfV = zeros(200,6,long2bering-long1bering+1);
BEfT = zeros(200,6,long2bering-long1bering+1);
CfU = zeros(200,16,lat2CAA-lat1CAA+1);
CfT = zeros(200,16,lat2CAA-lat1CAA+1);


for i=1:20
	time = [nrun ' ' int2str(i)]
	ncload(char(nameU(i)),'UVEL');
	FfU(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:30,lat1fram:lat2fram,longfram)),[12 nm/12 30 lat2fram-lat1fram+1])));
	BAfU(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:16,lat1barents:lat2barents,longbarents)),[12 nm/12 16 lat2barents-lat1barents+1])));	
	CfU(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:16,lat1CAA:lat2CAA,longCAA)),[12 nm/12 16 lat2CAA-lat1CAA+1])));	
	ncload(char(nameV(i)),'VVEL');
	BEfV(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(VVEL(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));
	ncload(char(nameT(i)),'TEMP');
	FfT(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:30,lat1fram:lat2fram,longfram)),[12 nm/12 30 lat2fram-lat1fram+1])));
	BAfT(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:16,lat1barents:lat2barents,longbarents)),[12 nm/12 16 lat2barents-lat1barents+1])));	
	CfT(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:16,lat1CAA:lat2CAA,longCAA)),[12 nm/12 16 lat2CAA-lat1CAA+1])));	
	BEfT(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));
end

cd ..


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% g.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd A1Bg
nrun = 'g.ES01';
nameU = strcat(n20,nrun,nU,y20a,'01-',y20b,'12.nc');
nameU = cat(2,nameU,strcat(n21,nrun,nU,y21a,'01-',y21b,'12.nc'));
nameV = strcat(n20,nrun,nV,y20a,'01-',y20b,'12.nc');
nameV = cat(2,nameV,strcat(n21,nrun,nV,y21a,'01-',y21b,'12.nc'));
nameT = strcat(n20,nrun,nT,y20a,'01-',y20b,'12.nc');
nameT = cat(2,nameT,strcat(n21,nrun,nT,y21a,'01-',y21b,'12.nc'));

FgU = zeros(200,30,lat2fram-lat1fram+1);
FgT = zeros(200,30,lat2fram-lat1fram+1);
BAgU = zeros(200,16,lat2barents-lat1barents+1);
BAgT = zeros(200,16,lat2barents-lat1barents+1);
BEgV = zeros(200,6,long2bering-long1bering+1);
BEgT = zeros(200,6,long2bering-long1bering+1);
CgU = zeros(200,16,lat2CAA-lat1CAA+1);
CgT = zeros(200,16,lat2CAA-lat1CAA+1);


for i=1:20
	time = [nrun ' ' int2str(i)]
	ncload(char(nameU(i)),'UVEL');
	FgU(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:30,lat1fram:lat2fram,longfram)),[12 nm/12 30 lat2fram-lat1fram+1])));
	BAgU(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:16,lat1barents:lat2barents,longbarents)),[12 nm/12 16 lat2barents-lat1barents+1])));	
	CgU(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:16,lat1CAA:lat2CAA,longCAA)),[12 nm/12 16 lat2CAA-lat1CAA+1])));	
	ncload(char(nameV(i)),'VVEL');
	BEgV(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(VVEL(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));
	ncload(char(nameT(i)),'TEMP');
	FgT(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:30,lat1fram:lat2fram,longfram)),[12 nm/12 30 lat2fram-lat1fram+1])));
	BAgT(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:16,lat1barents:lat2barents,longbarents)),[12 nm/12 16 lat2barents-lat1barents+1])));	
	CgT(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:16,lat1CAA:lat2CAA,longCAA)),[12 nm/12 16 lat2CAA-lat1CAA+1])));	
	BEgT(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));
end

cd ..


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% e
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd A1Be
nrun = 'e'
nameU = strcat(n20,nrun,nU,y20a,'-01_cat_',y20b,'-12.nc');
nameV = strcat(n20,nrun,nV,y20a,'-01_cat_',y20b,'-12.nc');
nameT = strcat(n20,nrun,nT,y20a,'-01_cat_',y20b,'-12.nc');

FeU = zeros(200,30,lat2fram-lat1fram+1);
FeT = zeros(200,30,lat2fram-lat1fram+1);
BAeU = zeros(200,16,lat2barents-lat1barents+1);
BAeT = zeros(200,16,lat2barents-lat1barents+1);
BEeV = zeros(200,6,long2bering-long1bering+1);
BEeT = zeros(200,6,long2bering-long1bering+1);
CeU = zeros(200,16,lat2CAA-lat1CAA+1);
CeT = zeros(200,16,lat2CAA-lat1CAA+1);


for i=1:10
	time = [nrun ' ' int2str(i)]	
	ncload(char(nameU(i)),'UVEL');
	FeU(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:30,lat1fram:lat2fram,longfram)),[12 nm/12 30 lat2fram-lat1fram+1])));
	BAeU(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:16,lat1barents:lat2barents,longbarents)),[12 nm/12 16 lat2barents-lat1barents+1])));	
	CeU(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:16,lat1CAA:lat2CAA,longCAA)),[12 nm/12 16 lat2CAA-lat1CAA+1])));	
	ncload(char(nameV(i)),'VVEL');
	BEeV(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(VVEL(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));
	ncload(char(nameT(i)),'TEMP');
	FeT(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:30,lat1fram:lat2fram,longfram)),[12 nm/12 30 lat2fram-lat1fram+1])));
	BAeT(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:16,lat1barents:lat2barents,longbarents)),[12 nm/12 16 lat2barents-lat1barents+1])));	
	CeT(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:16,lat1CAA:lat2CAA,longCAA)),[12 nm/12 16 lat2CAA-lat1CAA+1])));	
	BEeT(10*(i-1)+1:10*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:6,latbering,long1bering:long2bering)),[12 nm/12 6 long2bering-long1bering+1])));
end

nameU = strcat(n21,nrun,nU,y21a5,'-01_cat_',y21b5,'-12.nc');
nameV = strcat(n21,nrun,nV,y21a5,'-01_cat_',y21b5,'-12.nc');
nameT = strcat(n21,nrun,nT,y21a5,'-01_cat_',y21b5,'-12.nc');
for i=1:20
	time = [nrun ' ' int2str(i)]	
	ncload(char(nameU(i)),'UVEL');
	FeU(100+5*(i-1)+1:100+5*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:30,lat1fram:lat2fram,longfram)),[12 nm5/12 30 lat2fram-lat1fram+1])));
	BAeU(100+5*(i-1)+1:100+5*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:16,lat1barents:lat2barents,longbarents)),[12 nm5/12 16 lat2barents-lat1barents+1])));	
	CeU(100+5*(i-1)+1:100+5*i,:,:) = squeeze(nanmean(reshape(squeeze(UVEL(:,1:16,lat1CAA:lat2CAA,longCAA)),[12 nm5/12 16 lat2CAA-lat1CAA+1])));	
	ncload(char(nameV(i)),'VVEL');
	BEeV(100+5*(i-1)+1:100+5*i,:,:) = squeeze(nanmean(reshape(squeeze(VVEL(:,1:6,latbering,long1bering:long2bering)),[12 nm5/12 6 long2bering-long1bering+1])));	
	ncload(char(nameT(i)),'TEMP');
	FeT(100+5*(i-1)+1:100+5*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:30,lat1fram:lat2fram,longfram)),[12 nm5/12 30 lat2fram-lat1fram+1])));
	BAeT(100+5*(i-1)+1:100+5*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:16,lat1barents:lat2barents,longbarents)),[12 nm5/12 16 lat2barents-lat1barents+1])));	
	CeT(100+5*(i-1)+1:100+5*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:16,lat1CAA:lat2CAA,longCAA)),[12 nm5/12 16 lat2CAA-lat1CAA+1])));	
	BEeT(100+5*(i-1)+1:100+5*i,:,:) = squeeze(nanmean(reshape(squeeze(TEMP(:,1:6,latbering,long1bering:long2bering)),[12 nm5/12 6 long2bering-long1bering+1])));
end

cd ..


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% c
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd A1Bc
nrun = 'c'
nameUV = strcat(n20,nrun,'.pop.h.',y20,'.nc');
nameUV = cat(2,nameUV,strcat(n21,nrun,'.pop.h.',y21,'.ann.nc'));

FcU = zeros(200,30,lat2fram-lat1fram+1);
FcT = zeros(200,30,lat2fram-lat1fram+1);
BAcU = zeros(200,16,lat2barents-lat1barents+1);
BAcT = zeros(200,16,lat2barents-lat1barents+1);
BEcV = zeros(200,6,long2bering-long1bering+1);
BEcT = zeros(200,6,long2bering-long1bering+1);
CcU = zeros(200,16,lat2CAA-lat1CAA+1);
CcT = zeros(200,16,lat2CAA-lat1CAA+1);

for i=1:200
	time = [nrun ' ' int2str(i)]	
	ncload(char(nameUV(i)),'UVEL','VVEL','TEMP');
	FcU(i,:,:) = squeeze(UVEL(1:30,lat1fram:lat2fram,longfram));
	FcT(i,:,:) = squeeze(TEMP(1:30,lat1fram:lat2fram,longfram));
	BAcU(i,:,:) = squeeze(UVEL(1:16,lat1barents:lat2barents,longbarents));
	BAcT(i,:,:) = squeeze(TEMP(1:16,lat1barents:lat2barents,longbarents));	
	CcU(i,:,:) = squeeze(UVEL(1:16,lat1CAA:lat2CAA,longCAA));	
	CcT(i,:,:) = squeeze(TEMP(1:16,lat1CAA:lat2CAA,longCAA));	
	BEcV(i,:,:) = squeeze(VVEL(1:6,latbering,long1bering:long2bering));	
	BEcT(i,:,:) = squeeze(TEMP(1:6,latbering,long1bering:long2bering));	
end

cd ..


save Gates3VT.mat



