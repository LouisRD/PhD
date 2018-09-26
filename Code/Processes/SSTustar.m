clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;
latnh = 281;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% b.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030b.ES01.pop.h.SST.1900-01_cat_1909-12.nc TEMP
[nt nz nlat nlong] = size(TEMP);
TEMP = squeeze(TEMP);
SSTb = squeeze(squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030b.ES01.pop.h.SST.1910-01_cat_1919-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030b.ES01.pop.h.SST.1920-01_cat_1929-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030b.ES01.pop.h.SST.1930-01_cat_1939-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030b.ES01.pop.h.SST.1940-01_cat_1949-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030b.ES01.pop.h.SST.1950-01_cat_1959-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030b.ES01.pop.h.SST.1960-01_cat_1969-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030b.ES01.pop.h.SST.1970-01_cat_1979-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030b.ES01.pop.h.SST.1980-01_cat_1989-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030b.ES01.pop.h.SST.1990-01_cat_1999-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.040b.ES01.pop.h.SST.2000-01_cat_2009-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.040b.ES01.pop.h.SST.2010-01_cat_2019-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.040b.ES01.pop.h.SST.2020-01_cat_2029-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.040b.ES01.pop.h.SST.2030-01_cat_2039-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.040b.ES01.pop.h.SST.2040-01_cat_2049-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.040b.ES01.pop.h.SST.2050-01_cat_2059-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.040b.ES01.pop.h.SST.2060-01_cat_2069-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.040b.ES01.pop.h.SST.2070-01_cat_2079-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.040b.ES01.pop.h.SST.2080-01_cat_2089-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.040b.ES01.pop.h.SST.2090-01_cat_2099-12.nc TEMP
TEMP = squeeze(TEMP);
SSTb = cat(1,SSTb,squeeze(nanmean(reshape(TEMP(:,latnh:end,:),[12 nt/12 104 nlong]))));
clearvars TEMP

ncload b30.030b.ES01.csim.h.strocnx_nh.1900-01_cat_1949-12.nc strocnx
ncload b30.030b.ES01.csim.h.strocny_nh.1900-01_cat_1949-12.nc strocny
rho = 1026; % kg/m3
[nt nlat nlong] = size(strocnx);
ustarb = squeeze(nanmean(reshape(sqrt(sqrt(strocnx.^2+strocny.^2)/rho),[12 nt/12 nlat nlong])));  
ncload b30.030b.ES01.csim.h.strocnx_nh.1950-01_cat_1999-12.nc strocnx
ncload b30.030b.ES01.csim.h.strocny_nh.1950-01_cat_1999-12.nc strocny 
ustarb = cat(1,ustarb,squeeze(nanmean(reshape(sqrt(sqrt(strocnx(:,:,:).^2+strocny(:,:,:).^2)/rho),[12 nt/12 nlat nlong]))));
ncload b30.040b.ES01.csim.h.strocnx_nh.2000-01_cat_2049-12.nc strocnx
ncload b30.040b.ES01.csim.h.strocny_nh.2000-01_cat_2049-12.nc strocny   
ustarb = cat(1,ustarb,squeeze(nanmean(reshape(sqrt(sqrt(strocnx(:,:,:).^2+strocny(:,:,:).^2)/rho),[12 nt/12 nlat nlong]))));
ncload b30.040b.ES01.csim.h.strocnx_nh.2050-01_cat_2099-12.nc strocnx
ncload b30.040b.ES01.csim.h.strocny_nh.2050-01_cat_2099-12.nc strocny   
ustarb = cat(1,ustarb,squeeze(nanmean(reshape(sqrt(sqrt(strocnx(:,:,:).^2+strocny(:,:,:).^2)/rho),[12 nt/12 nlat nlong]))));
clearvars strocnx strocny

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% c
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030c.pop.h.TEMP.1900-01_cat_1904-12.nc TEMP
[nt nz nlat nlong] = size(TEMP);
SSTc = squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong])));
ncload b30.030c.pop.h.TEMP.1905-01_cat_1909-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1910-01_cat_1914-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1915-01_cat_1919-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1920-01_cat_1924-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1925-01_cat_1929-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1930-01_cat_1934-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1935-01_cat_1939-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1940-01_cat_1944-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1945-01_cat_1949-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1950-01_cat_1954-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1955-01_cat_1959-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1960-01_cat_1964-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1965-01_cat_1969-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1970-01_cat_1974-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1975-01_cat_1979-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1980-01_cat_1984-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1985-01_cat_1989-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1990-01_cat_1994-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.030c.pop.h.TEMP.1995-01_cat_1999-12.nc TEMP
SSTc = cat(1,SSTc,squeeze(nanmean(reshape(TEMP(:,1,latnh:end,:),[12 nt/12 104 nlong]))));
ncload b30.040c.pop.h.2000.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2001.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2002.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2003.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2004.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2005.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2006.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2007.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2008.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2009.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2010.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2011.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2012.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2013.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2014.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2015.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2016.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2017.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2018.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2019.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2020.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2021.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2022.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2023.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2024.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2025.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2026.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2027.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2028.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2029.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2030.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2031.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2032.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2033.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2034.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2035.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2036.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2037.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2038.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2039.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2040.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2041.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2042.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2043.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2044.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2045.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2046.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2047.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2048.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2049.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2050.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2051.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2052.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2053.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2054.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2055.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2056.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2057.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2058.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2059.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2060.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2061.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2062.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2063.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2064.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2065.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2066.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2067.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2068.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2069.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2070.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2071.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2072.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2073.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2074.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2075.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2076.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2077.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2078.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2079.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2080.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2081.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2082.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2083.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2084.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2085.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2086.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2087.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2088.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2089.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2090.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2091.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2092.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2093.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2094.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2095.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2096.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2097.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2098.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
ncload b30.040c.pop.h.2099.ann.nc TEMP
SSTc = cat(1,SSTc,TEMP(1,latnh:end,:));
clearvars TEMP

ncload b30.030c.csim.h.strocnx_nh.1900-01_cat_1949-12.nc strocnx
ncload b30.030c.csim.h.strocny_nh.1900-01_cat_1949-12.nc strocny
rho = 1026; % kg/m3
[nt nlat nlong] = size(strocnx);
ustarc = squeeze(nanmean(reshape(sqrt(sqrt(strocnx.^2+strocny.^2)/rho),[12 nt/12 nlat nlong])));  
ncload b30.030c.csim.h.strocnx_nh.1950-01_cat_1999-12.nc strocnx
ncload b30.030c.csim.h.strocny_nh.1950-01_cat_1999-12.nc strocny
ustarc = cat(1,ustarc,squeeze(nanmean(reshape(sqrt(sqrt(strocnx(:,:,:).^2+strocny(:,:,:).^2)/rho),[12 nt/12 nlat nlong]))));
ncload b30.040c.csim.h.strocnx_nh.2000-01_cat_2049-12.nc strocnx
ncload b30.040c.csim.h.strocny_nh.2000-01_cat_2049-12.nc strocny
ustarc = cat(1,ustarc,squeeze(nanmean(reshape(sqrt(sqrt(strocnx(:,:,:).^2+strocny(:,:,:).^2)/rho),[12 nt/12 nlat nlong]))));
ncload b30.040c.csim.h.strocnx_nh.2050-01_cat_2099-12.nc strocnx
ncload b30.040c.csim.h.strocny_nh.2050-01_cat_2099-12.nc strocny
ustarc = cat(1,ustarc,squeeze(nanmean(reshape(sqrt(sqrt(strocnx(:,:,:).^2+strocny(:,:,:).^2)/rho),[12 nt/12 nlat nlong]))));
clearvars strocnx strocny

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% e
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030e.pop.h.SST.1870-01_cat_1999-12.nc SST
SSTe = squeeze(nanmean(reshape(squeeze(SST(30*12+1:end,1,latnh:end,:)),[12 100 104 320])));
ncload b30.040e.pop.h.SST.2000-01_cat_2099-12.nc SST
SSTe = cat(1,SSTe,squeeze(nanmean(reshape(squeeze(SST(:,1,latnh:end,:)),[12 100 104 320]))));
clearvars SST

ncload b30.030e.csim.h.strocnx_nh.1900-01_cat_1949-12.nc strocnx
ncload b30.030e.csim.h.strocny_nh.1900-01_cat_1949-12.nc strocny
rho = 1026; % kg/m3
[nt nlat nlong] = size(strocnx);
ustare = squeeze(nanmean(reshape(sqrt(sqrt(strocnx.^2+strocny.^2)/rho),[12 nt/12 nlat nlong])));  
ncload b30.030e.csim.h.strocnx_nh.1950-01_cat_1999-12.nc strocnx
ncload b30.030e.csim.h.strocny_nh.1950-01_cat_1999-12.nc strocny
ustare = cat(1,ustare,squeeze(nanmean(reshape(sqrt(sqrt(strocnx(:,:,:).^2+strocny(:,:,:).^2)/rho),[12 nt/12 nlat nlong]))));
ncload b30.040e.csim.h.strocnx_nh.2000-01_cat_2049-12.nc strocnx
ncload b30.040e.csim.h.strocny_nh.2000-01_cat_2049-12.nc strocny 
ustare = cat(1,ustare,squeeze(nanmean(reshape(sqrt(sqrt(strocnx(:,:,:).^2+strocny(:,:,:).^2)/rho),[12 nt/12 nlat nlong]))));
ncload b30.040e.csim.h.strocnx_nh.2050-01_cat_2099-12.nc strocnx
ncload b30.040e.csim.h.strocny_nh.2050-01_cat_2099-12.nc strocny 
ustare = cat(1,ustare,squeeze(nanmean(reshape(sqrt(sqrt(strocnx(:,:,:).^2+strocny(:,:,:).^2)/rho),[12 nt/12 nlat nlong]))));
clearvars strocnx strocny

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% f.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030f.ES01.pop.h.SST.1900-01_cat_1909-12.nc TEMP
SSTf = squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320])));
ncload b30.030f.ES01.pop.h.SST.1910-01_cat_1919-12.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.030f.ES01.pop.h.SST.1920-01_cat_1929-12.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.030f.ES01.pop.h.SST.1930-01_cat_1939-12.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.030f.ES01.pop.h.SST.1940-01_cat_1949-12.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.030f.ES01.pop.h.SST.1950-01_cat_1959-12.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.030f.ES01.pop.h.SST.1960-01_cat_1969-12.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.030f.ES01.pop.h.SST.1970-01_cat_1979-12.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.030f.ES01.pop.h.SST.1980-01_cat_1989-12.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.030f.ES01.pop.h.SST.1990-01_cat_1999-12.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040f.ES01.pop.h.TEMP.200001-200912.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040f.ES01.pop.h.TEMP.201001-201912.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040f.ES01.pop.h.TEMP.202001-202912.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040f.ES01.pop.h.TEMP.203001-203912.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040f.ES01.pop.h.TEMP.204001-204912.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040f.ES01.pop.h.TEMP.205001-205912.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040f.ES01.pop.h.TEMP.206001-206912.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040f.ES01.pop.h.TEMP.207001-207912.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040f.ES01.pop.h.TEMP.208001-208912.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040f.ES01.pop.h.TEMP.209001-209912.nc TEMP
SSTf = cat(1,SSTf,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
clearvars TEMP

ncload b30.030f.ES01.csim.h.strocnx_nh.1900-01_cat_1949-12.nc strocnx
ncload b30.030f.ES01.csim.h.strocny_nh.1900-01_cat_1949-12.nc strocny
rho = 1026; % kg/m3
[nt nlat nlong] = size(strocnx);
ustarf = squeeze(nanmean(reshape(sqrt(sqrt(strocnx.^2+strocny.^2)/rho),[12 nt/12 nlat nlong])));  
ncload b30.030f.ES01.csim.h.strocnx_nh.1950-01_cat_1999-12.nc strocnx
ncload b30.030f.ES01.csim.h.strocny_nh.1950-01_cat_1999-12.nc strocny
ustarf = cat(1,ustarf,squeeze(nanmean(reshape(sqrt(sqrt(strocnx(:,:,:).^2+strocny(:,:,:).^2)/rho),[12 nt/12 nlat nlong]))));
ncload b30.040f.ES01.csim.h.strocnx_nh.2000-01_cat_2049-12.nc strocnx
ncload b30.040f.ES01.csim.h.strocny_nh.2000-01_cat_2049-12.nc strocny
ustarf = cat(1,ustarf,squeeze(nanmean(reshape(sqrt(sqrt(strocnx(:,:,:).^2+strocny(:,:,:).^2)/rho),[12 nt/12 nlat nlong]))));
ncload b30.040f.ES01.csim.h.strocnx_nh.2050-01_cat_2099-12.nc strocnx
ncload b30.040f.ES01.csim.h.strocny_nh.2050-01_cat_2099-12.nc strocny
ustarf = cat(1,ustarf,squeeze(nanmean(reshape(sqrt(sqrt(strocnx(:,:,:).^2+strocny(:,:,:).^2)/rho),[12 nt/12 nlat nlong]))));
clearvars strocnx strocny

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% g.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030g.ES01.pop.h.SST.1900-01_cat_1909-12.nc TEMP
SSTg = squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320])));
ncload b30.030g.ES01.pop.h.SST.1910-01_cat_1919-12.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.030g.ES01.pop.h.SST.1920-01_cat_1929-12.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.030g.ES01.pop.h.SST.1930-01_cat_1939-12.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.030g.ES01.pop.h.SST.1940-01_cat_1949-12.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.030g.ES01.pop.h.SST.1950-01_cat_1959-12.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.030g.ES01.pop.h.SST.1960-01_cat_1969-12.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.030g.ES01.pop.h.SST.1970-01_cat_1979-12.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.030g.ES01.pop.h.SST.1980-01_cat_1989-12.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.030g.ES01.pop.h.SST.1990-01_cat_1999-12.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040g.ES01.pop.h.TEMP.200001-200912.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040g.ES01.pop.h.TEMP.201001-201912.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040g.ES01.pop.h.TEMP.202001-202912.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040g.ES01.pop.h.TEMP.203001-203912.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040g.ES01.pop.h.TEMP.204001-204912.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040g.ES01.pop.h.TEMP.205001-205912.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040g.ES01.pop.h.TEMP.206001-206912.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040g.ES01.pop.h.TEMP.207001-207912.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040g.ES01.pop.h.TEMP.208001-208912.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
ncload b30.040g.ES01.pop.h.TEMP.209001-209912.nc TEMP
SSTg = cat(1,SSTg,squeeze(nanmean(reshape(squeeze(TEMP(:,1,latnh:end,:)),[12 10 104 320]))));
clearvars TEMP

ncload b30.030g.ES01.csim.h.strocnx_nh.1900-01_cat_1949-12.nc strocnx
ncload b30.030g.ES01.csim.h.strocny_nh.1900-01_cat_1949-12.nc strocny
rho = 1026; % kg/m3
[nt nlat nlong] = size(strocnx);
ustarg = squeeze(nanmean(reshape(sqrt(sqrt(strocnx.^2+strocny.^2)/rho),[12 nt/12 nlat nlong])));  
ncload b30.030g.ES01.csim.h.strocnx_nh.1950-01_cat_1999-12.nc strocnx
ncload b30.030g.ES01.csim.h.strocny_nh.1950-01_cat_1999-12.nc strocny
ustarg = cat(1,ustarg,squeeze(nanmean(reshape(sqrt(sqrt(strocnx(:,:,:).^2+strocny(:,:,:).^2)/rho),[12 nt/12 nlat nlong]))));
ncload b30.040g.ES01.csim.h.strocnx_nh.2000-01_cat_2049-12.nc strocnx
ncload b30.040g.ES01.csim.h.strocny_nh.2000-01_cat_2049-12.nc strocny
ustarg = cat(1,ustarg,squeeze(nanmean(reshape(sqrt(sqrt(strocnx(:,:,:).^2+strocny(:,:,:).^2)/rho),[12 nt/12 nlat nlong]))));
ncload b30.040g.ES01.csim.h.strocnx_nh.2050-01_cat_2099-12.nc strocnx
ncload b30.040g.ES01.csim.h.strocny_nh.2050-01_cat_2099-12.nc strocny
ustarg = cat(1,ustarg,squeeze(nanmean(reshape(sqrt(sqrt(strocnx(:,:,:).^2+strocny(:,:,:).^2)/rho),[12 nt/12 nlat nlong]))));
clearvars strocnx strocny lat1 lat2 latnh nt nlat nlong rho nz

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save SSTustar.mat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
load SSTustar.mat
x = (1900:2099);

index = find(ustarb == 0);
ustarb(index) = NaN;
ustarc(index) = NaN;
ustare(index) = NaN;
ustarf(index) = NaN;
ustarg(index) = NaN;

subplot(3,2,2)
[ax,h1,h2] = plotyy(x,squeeze(nanmean(nanmean(SSTb(:,latt1:latt2,long1:long2),3),2)),x,squeeze(nanmean(nanmean(ustarb(:,latt1:latt2,long1:long2),3),2)));
%ylabel(ax(1),'^\circ C') % left y-axis
%ylabel(ax(2),'m/s') % right y-axis
set(h1,'LineWidth',2)
%set(h2,'LineWidth',2)
hold on
area([2027 2028], [2 2],'FaceColor', 'k','Linestyle','none');
area([2027 2028], [-2 -2],'FaceColor', 'k','Linestyle','none');
area([2030 2031], [2 2],'FaceColor', 'k','Linestyle','none');
area([2030 2031], [-2 -2],'FaceColor', 'k','Linestyle','none');
title('b.ES01')
grid on
ylim(ax(1),[-2 0])
ylim(ax(2),[4 6]*10^-3)
set(ax(1),'YTick',[(-2:0.5:0)])

subplot(3,2,3)
[ax,h1,h2] = plotyy(x,squeeze(nanmean(nanmean(SSTc(:,latt1:latt2,long1:long2),3),2)),x,squeeze(nanmean(nanmean(ustarc(:,latt1:latt2,long1:long2),3),2)));
ylabel(ax(1),'^\circ C') % left y-axis
%ylabel(ax(2),'m/s') % right y-axis
set(h1,'LineWidth',2)
%set(h2,'LineWidth',2)
hold on
area([2032 2033], [15 15],'FaceColor', 'k','Linestyle','none');
area([2032 2033], [-15 -15],'FaceColor', 'k','Linestyle','none');
title('c')
grid on
ylim(ax(1),[-2 0])
ylim(ax(2),[4 6]*10^-3)
set(ax(1),'YTick',[(-2:0.5:0)])


subplot(3,2,4)
[ax,h1,h2] = plotyy(x,squeeze(nanmean(nanmean(SSTe(:,latt1:latt2,long1:long2),3),2)),x,squeeze(nanmean(nanmean(ustare(:,latt1:latt2,long1:long2),3),2)));
%ylabel(ax(1),'^\circ C') % left y-axis
ylabel(ax(2),'m/s') % right y-axis
set(h1,'LineWidth',2)
%set(h2,'LineWidth',2)
hold on
area([2032 2033], [15 15],'FaceColor', 'k','Linestyle','none');
area([2032 2033], [-15 -15],'FaceColor', 'k','Linestyle','none');
title('e')
grid on
ylim(ax(1),[-2 0])
ylim(ax(2),[4 6]*10^-3)
set(ax(1),'YTick',[(-2:0.5:0)])

subplot(3,2,5)
[ax,h1,h2] = plotyy(x,squeeze(nanmean(nanmean(SSTf(:,latt1:latt2,long1:long2),3),2)),x,squeeze(nanmean(nanmean(ustarf(:,latt1:latt2,long1:long2),3),2)));
%ylabel(ax(1),'^\circ C') % left y-axis
%ylabel(ax(2),'m/s') % right y-axis
set(h1,'LineWidth',2)
ylim(ax(2),[3.5 5]*10^-3)
set(ax(1),'Ytick',[-2 -1 0 1])
%set(h2,'LineWidth',2)
hold on
area([2013 2015], [15 15],'FaceColor', 'k','Linestyle','none');
area([2013 2015], [-15 -15],'FaceColor', 'k','Linestyle','none');
title('f.ES01')
grid on
ylim(ax(1),[-2 0])
ylim(ax(2),[4 6]*10^-3)
set(ax(1),'YTick',[(-2:0.5:0)])

subplot(3,2,6)
[ax,h1,h2] = plotyy(x,squeeze(nanmean(nanmean(SSTg(:,latt1:latt2,long1:long2),3),2)),x,squeeze(nanmean(nanmean(ustarg(:,latt1:latt2,long1:long2),3),2)));
%ylabel(ax(1),'^\circ C') % left y-axis
%ylabel(ax(2),'m/s') % right y-axis
set(h1,'LineWidth',2)
%set(h2,'LineWidth',2)
hold on
area([2044 2045], [15 15],'FaceColor', 'k','Linestyle','none');
area([2044 2045], [-15 -15],'FaceColor', 'k','Linestyle','none');
title('g.ES01')
grid on
ylim(ax(1),[-2 0])
ylim(ax(2),[4 6]*10^-3)
set(ax(1),'YTick',[(-2:0.5:0)])

%print('SSTustar','-djpeg')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
load SSTustar.mat

index = find(ustarb == 0);
ustarb(index) = NaN;
ustarc(index) = NaN;
ustare(index) = NaN;
ustarf(index) = NaN;
ustarg(index) = NaN;

x = (1900:2099);
b = polyfit(x(1:136)',squeeze(nanmean(nanmean(ustarb(1:136,latt1:latt2,long1:long2),3),2)),1)
c = polyfit(x(1:130)',squeeze(nanmean(nanmean(ustarc(1:130,latt1:latt2,long1:long2),3),2)),1)
e = polyfit(x(1:132)',squeeze(nanmean(nanmean(ustare(1:132,latt1:latt2,long1:long2),3),2)),1)
f = polyfit(x(1:132)',squeeze(nanmean(nanmean(ustarf(1:132,latt1:latt2,long1:long2),3),2)),1)
g = polyfit(x(1:145)',squeeze(nanmean(nanmean(ustarg(1:145,latt1:latt2,long1:long2),3),2)),1)
p = [b(1) c(1) e(1) f(1) g(1)];
mean(p)

b = polyfit(x(136:end)',squeeze(nanmean(nanmean(ustarb(136:end,latt1:latt2,long1:long2),3),2)),1)
c = polyfit(x(130:end)',squeeze(nanmean(nanmean(ustarc(130:end,latt1:latt2,long1:long2),3),2)),1)
e = polyfit(x(132:end)',squeeze(nanmean(nanmean(ustare(132:end,latt1:latt2,long1:long2),3),2)),1)
f = polyfit(x(132:end)',squeeze(nanmean(nanmean(ustarf(132:end,latt1:latt2,long1:long2),3),2)),1)
g = polyfit(x(145:end)',squeeze(nanmean(nanmean(ustarg(145:end,latt1:latt2,long1:long2),3),2)),1)
p = [b(1) c(1) e(1) f(1) g(1)];
mean(p)






x = (1900:2099);
b = polyfit(x(1:100)',squeeze(nanmean(nanmean(SSTb(1:100,latt1:latt2,long1:long2),3),2)),1)
c = polyfit(x(1:100)',squeeze(nanmean(nanmean(SSTc(1:100,latt1:latt2,long1:long2),3),2)),1)
e = polyfit(x(1:100)',squeeze(nanmean(nanmean(SSTe(1:100,latt1:latt2,long1:long2),3),2)),1)
f = polyfit(x(1:100)',squeeze(nanmean(nanmean(SSTf(1:100,latt1:latt2,long1:long2),3),2)),1)
g = polyfit(x(1:100)',squeeze(nanmean(nanmean(SSTg(1:100,latt1:latt2,long1:long2),3),2)),1)
p = [b(1) c(1) e(1) f(1) g(1)];
mean(p)

b = polyfit(x(100:136)',squeeze(nanmean(nanmean(SSTb(100:136,latt1:latt2,long1:long2),3),2)),1)
c = polyfit(x(100:130)',squeeze(nanmean(nanmean(SSTc(100:130,latt1:latt2,long1:long2),3),2)),1)
e = polyfit(x(100:132)',squeeze(nanmean(nanmean(SSTe(100:132,latt1:latt2,long1:long2),3),2)),1)
f = polyfit(x(100:132)',squeeze(nanmean(nanmean(SSTf(100:132,latt1:latt2,long1:long2),3),2)),1)
g = polyfit(x(100:145)',squeeze(nanmean(nanmean(SSTg(100:145,latt1:latt2,long1:long2),3),2)),1)
p = [b(1) c(1) e(1) f(1) g(1)];
mean(p)

b = polyfit(x(136:end)',squeeze(nanmean(nanmean(SSTb(136:end,latt1:latt2,long1:long2),3),2)),1)
c = polyfit(x(130:end)',squeeze(nanmean(nanmean(SSTc(130:end,latt1:latt2,long1:long2),3),2)),1)
e = polyfit(x(132:end)',squeeze(nanmean(nanmean(SSTe(132:end,latt1:latt2,long1:long2),3),2)),1)
f = polyfit(x(132:end)',squeeze(nanmean(nanmean(SSTf(132:end,latt1:latt2,long1:long2),3),2)),1)
g = polyfit(x(145:end)',squeeze(nanmean(nanmean(SSTg(145:end,latt1:latt2,long1:long2),3),2)),1)
p = [b(1) c(1) e(1) f(1) g(1)];
mean(p)

mean([squeeze(nanmean(nanmean(SSTb(136,latt1:latt2,long1:long2),3),2)) squeeze(nanmean(nanmean(SSTc(130,latt1:latt2,long1:long2),3),2)) squeeze(nanmean(nanmean(SSTe(132,latt1:latt2,long1:long2),3),2)) squeeze(nanmean(nanmean(SSTf(132,latt1:latt2,long1:long2),3),2)) squeeze(nanmean(nanmean(SSTg(145,latt1:latt2,long1:long2),3),2))])







