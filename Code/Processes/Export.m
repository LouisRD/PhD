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
latt1fram = 90;
latt2fram = 104;
longfram = 100;

lat1barents = 334;
lat2barents = 369;
latt1barents = 54;
latt2barents = 89;
longbarents = 100;

latbering = 333;
lattbering = 53;
long1bering = 199;
long2bering = 202;

lat1CAA = 333;
lat2CAA = 384;
latt1CAA = 53;
latt2CAA = 104;
longCAA = 230;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030a.csim.h.hi_nh.1900-01_cat_1949-12.nc hi
ahF = hi(:,latt1fram:latt2fram,longfram);
ahBA = hi(:,latt1barents:latt2barents,longbarents);
ahBE = hi(:,lattbering,long1bering:long2bering);
ahC = hi(:,latt1CAA:latt2CAA,longCAA);
ncload b30.030a.csim.h.hi_nh.1950-01_cat_1999-12.nc hi
ahF = cat(1,ahF,hi(:,latt1fram:latt2fram,longfram));
ahBA = cat(1,ahBA,hi(:,latt1barents:latt2barents,longbarents));
ahBE = cat(1,ahBE,hi(:,lattbering,long1bering:long2bering));
ahC = cat(1,ahC,hi(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040a.csim.h.hi.2000-01_cat_2099-12.nc hi HTE HTN
ahF = cat(1,ahF,hi(:,lat1fram:lat2fram,longfram));
ahBA = cat(1,ahBA,hi(:,lat1barents:lat2barents,longbarents));
ahBE = cat(1,ahBE,hi(:,latbering,long1bering:long2bering));
ahC = cat(1,ahC,hi(:,lat1CAA:lat2CAA,longCAA));

ncload b30.030a.csim.h.u.1870-01_cat_1999-12.nc u
auF = u(30*12+1:end,lat1fram:lat2fram,longfram);
auBA = u(30*12+1:end,lat1barents:lat2barents,longbarents);
auC = u(30*12+1:end,lat1CAA:lat2CAA,longCAA);
ncload b30.040a.csim.h.u.2000-01_cat_2099-12.nc u
auF = cat(1,auF,u(:,lat1fram:lat2fram,longfram));
auBA = cat(1,auBA,u(:,lat1barents:lat2barents,longbarents));
auC = cat(1,auC,u(:,lat1CAA:lat2CAA,longCAA));

ncload b30.030a.csim.h.v.1870-01_cat_1999-12.nc v            
avBE = v(30*12+1:end,latbering,long1bering:long2bering);
ncload b30.040a.csim.h.v.2000-01_cat_2099-12.nc v
avBE = cat(1,avBE,v(:,latbering,long1bering:long2bering));

[nt nlat nlon] = size(ahF);
HTEF = repmat(HTE(lat1fram:lat2fram,longfram),[1 1 nt]);
HTEF = permute(HTEF,[3 1 2]);
HTEBA = repmat(HTE(lat1barents:lat2barents,longbarents),[1 1 nt]);
HTEBA = permute(HTEBA,[3 1 2]);
HTEC = repmat(HTE(lat1CAA:lat2CAA,longCAA),[1 1 nt]);
HTEC = permute(HTEC,[3 1 2]);
HTNBE = repmat(HTN(latbering,long1bering:long2bering),[1 1 nt]);
HTNBE = permute(HTNBE,[3 1 2]); 

[nt n] = size(auF);
aFI = squeeze(nansum(nansum(reshape(auF/100.*ahF.*HTEF,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(auBA);
aBAI = squeeze(nansum(nansum(reshape(auBA/100.*ahBA.*HTEBA,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(auC);
aCI = squeeze(nansum(nansum(reshape(auC/100.*ahC.*HTEC,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(avBE);
aBEI = squeeze(nansum(nansum(reshape(squeeze(avBE)/100.*squeeze(ahBE).*squeeze(HTNBE),[12 nt/12 n]),3),1))*365/12*24*60*60;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% b.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030b.ES01.csim.h.hi.1870-01_cat_1999-12.nc hi 
bhF = hi(30*12+1:end,lat1fram:lat2fram,longfram);
bhBA = hi(30*12+1:end,lat1barents:lat2barents,longbarents);
bhBE = hi(30*12+1:end,latbering,long1bering:long2bering);
bhC = hi(30*12+1:end,lat1CAA:lat2CAA,longCAA);
ncload b30.040b.ES01.csim.h.hi_nh.2000-01_cat_2049-12.nc hi 
bhF = cat(1,bhF,hi(:,latt1fram:latt2fram,longfram));
bhBA = cat(1,bhBA,hi(:,latt1barents:latt2barents,longbarents));
bhBE = cat(1,bhBE,hi(:,lattbering,long1bering:long2bering));
bhC = cat(1,bhC,hi(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040b.ES01.csim.h.hi_nh.2050-01_cat_2099-12.nc hi
bhF = cat(1,bhF,hi(:,latt1fram:latt2fram,longfram));
bhBA = cat(1,bhBA,hi(:,latt1barents:latt2barents,longbarents));
bhBE = cat(1,bhBE,hi(:,lattbering,long1bering:long2bering));
bhC = cat(1,bhC,hi(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030b.ES01.csim.h.u.1870-01_cat_1999-12.nc u
buF = u(30*12+1:end,lat1fram:lat2fram,longfram);
buBA = u(30*12+1:end,lat1barents:lat2barents,longbarents);
buC = u(30*12+1:end,lat1CAA:lat2CAA,longCAA);
ncload b30.040b.ES01.csim.h.u_nh.2000-01_cat_2049-12.nc u
buF = cat(1,buF,u(:,latt1fram:latt2fram,longfram));
buBA = cat(1,buBA,u(:,latt1barents:latt2barents,longbarents));
buC = cat(1,buC,u(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040b.ES01.csim.h.u_nh.2050-01_cat_2099-12.nc u
buF = cat(1,buF,u(:,latt1fram:latt2fram,longfram));
buBA = cat(1,buBA,u(:,latt1barents:latt2barents,longbarents));
buC = cat(1,buC,u(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030b.ES01.csim.h.v.1870-01_cat_1999-12.nc v
bvBE = v(30*12+1:end,latbering,long1bering:long2bering);
ncload b30.040b.ES01.csim.h.v_nh.2000-01_cat_2049-12.nc v
bvBE = cat(1,bvBE,v(:,lattbering,long1bering:long2bering));
ncload b30.040b.ES01.csim.h.v_nh.2050-01_cat_2099-12.nc v
bvBE = cat(1,bvBE,v(:,lattbering,long1bering:long2bering));

[nt n] = size(buF);
bFI = squeeze(nansum(nansum(reshape(buF/100.*bhF.*HTEF,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(buBA);
bBAI = squeeze(nansum(nansum(reshape(buBA/100.*bhBA.*HTEBA,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(buC);
bCI = squeeze(nansum(nansum(reshape(buC/100.*bhC.*HTEC,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(bvBE);
bBEI = squeeze(nansum(nansum(reshape(squeeze(bvBE)/100.*squeeze(bhBE).*squeeze(HTNBE),[12 nt/12 n]),3),1))*365/12*24*60*60;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% c
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030c.csim.h.hi_nh.1900-01_cat_1949-12.nc hi
chF = hi(:,latt1fram:latt2fram,longfram);
chBA = hi(:,latt1barents:latt2barents,longbarents);
chBE = hi(:,lattbering,long1bering:long2bering);
chC = hi(:,latt1CAA:latt2CAA,longCAA);
ncload b30.030c.csim.h.hi_nh.1950-01_cat_1999-12.nc hi
chF = cat(1,chF,hi(:,latt1fram:latt2fram,longfram));
chBA = cat(1,chBA,hi(:,latt1barents:latt2barents,longbarents));
chBE = cat(1,chBE,hi(:,lattbering,long1bering:long2bering));
chC = cat(1,chC,hi(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040c.csim.h.hi_nh.2000-01_cat_2049-12.nc hi
chF = cat(1,chF,hi(:,latt1fram:latt2fram,longfram));
chBA = cat(1,chBA,hi(:,latt1barents:latt2barents,longbarents));
chBE = cat(1,chBE,hi(:,lattbering,long1bering:long2bering));
chC = cat(1,chC,hi(:,latt1CAA:latt2CAA,longCAA));
ncload  b30.040c.csim.h.hi_nh.2050-01_cat_2099-12.nc hi
chF = cat(1,chF,hi(:,latt1fram:latt2fram,longfram));
chBA = cat(1,chBA,hi(:,latt1barents:latt2barents,longbarents));
chBE = cat(1,chBE,hi(:,lattbering,long1bering:long2bering));
chC = cat(1,chC,hi(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030c.csim.h.u_nh.1900-01_cat_1949-12.nc u
cuF = u(:,latt1fram:latt2fram,longfram);
cuBA = u(:,latt1barents:latt2barents,longbarents);
cuC = u(:,latt1CAA:latt2CAA,longCAA);
ncload b30.030c.csim.h.u_nh.1950-01_cat_1999-12.nc u
cuF = cat(1,cuF,u(:,latt1fram:latt2fram,longfram));
cuBA = cat(1,cuBA,u(:,latt1barents:latt2barents,longbarents));
cuC = cat(1,cuC,u(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040c.csim.h.u_nh.2000-01_cat_2049-12.nc u
cuF = cat(1,cuF,u(:,latt1fram:latt2fram,longfram));
cuBA = cat(1,cuBA,u(:,latt1barents:latt2barents,longbarents));
cuC = cat(1,cuC,u(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040c.csim.h.u_nh.2050-01_cat_2099-12.nc u
cuF = cat(1,cuF,u(:,latt1fram:latt2fram,longfram));
cuBA = cat(1,cuBA,u(:,latt1barents:latt2barents,longbarents));
cuC = cat(1,cuC,u(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030c.csim.h.v_nh.1900-01_cat_1949-12.nc v
cvBE = v(:,lattbering,long1bering:long2bering);
ncload b30.030c.csim.h.v_nh.1950-01_cat_1999-12.nc v
cvBE = cat(1,cvBE,v(:,lattbering,long1bering:long2bering));
ncload b30.040c.csim.h.v_nh.2000-01_cat_2049-12.nc v
cvBE = cat(1,cvBE,v(:,lattbering,long1bering:long2bering));
ncload b30.040c.csim.h.v_nh.2050-01_cat_2099-12.nc v
cvBE = cat(1,cvBE,v(:,lattbering,long1bering:long2bering));

[nt n] = size(cuF);
cFI = squeeze(nansum(nansum(reshape(cuF/100.*chF.*HTEF,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(cuBA);
cBAI = squeeze(nansum(nansum(reshape(cuBA/100.*chBA.*HTEBA,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(cuC);
cCI = squeeze(nansum(nansum(reshape(cuC/100.*chC.*HTEC,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(cvBE);
cBEI = squeeze(nansum(nansum(reshape(squeeze(cvBE)/100.*squeeze(chBE).*squeeze(HTNBE),[12 nt/12 n]),3),1))*365/12*24*60*60;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% e
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030e.csim.h.hi.1870-01_cat_1999-12.nc hi
ehF = hi(30*12+1:end,lat1fram:lat2fram,longfram);
ehBA = hi(30*12+1:end,lat1barents:lat2barents,longbarents);
ehBE = hi(30*12+1:end,latbering,long1bering:long2bering);
ehC = hi(30*12+1:end,lat1CAA:lat2CAA,longCAA);
ncload b30.040e.csim.h.hi.2000-01_cat_2099-12.nc hi
ehF = cat(1,ehF,hi(:,lat1fram:lat2fram,longfram));
ehBA = cat(1,ehBA,hi(:,lat1barents:lat2barents,longbarents));
ehBE = cat(1,ehBE,hi(:,latbering,long1bering:long2bering));
ehC = cat(1,ehC,hi(:,lat1CAA:lat2CAA,longCAA));

ncload b30.030e.csim.h.u.1870-01_cat_1999-12.nc u
euF = u(30*12+1:end,lat1fram:lat2fram,longfram);
euBA = u(30*12+1:end,lat1barents:lat2barents,longbarents);
euC = u(30*12+1:end,lat1CAA:lat2CAA,longCAA);
ncload b30.040e.csim.h.u.2000-01_cat_2099-12.nc u
euF = cat(1,euF,u(:,lat1fram:lat2fram,longfram));
euBA = cat(1,euBA,u(:,lat1barents:lat2barents,longbarents));
euC = cat(1,euC,u(:,lat1CAA:lat2CAA,longCAA));

ncload b30.030e.csim.h.v.1870-01_cat_1999-12.nc v
evBE = v(30*12+1:end,latbering,long1bering:long2bering);
ncload b30.040e.csim.h.v.2000-01_cat_2099-12.nc v
evBE = cat(1,evBE,v(:,latbering,long1bering:long2bering));

[nt n] = size(euF);
eFI = squeeze(nansum(nansum(reshape(euF/100.*ehF.*HTEF,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(euBA);
eBAI = squeeze(nansum(nansum(reshape(euBA/100.*ehBA.*HTEBA,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(euC);
eCI = squeeze(nansum(nansum(reshape(euC/100.*ehC.*HTEC,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(evBE);
eBEI = squeeze(nansum(nansum(reshape(squeeze(evBE)/100.*squeeze(ehBE).*squeeze(HTNBE),[12 nt/12 n]),3),1))*365/12*24*60*60;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% f.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030f.ES01.csim.h.hi.1870-01_cat_1999-12.nc hi 
fhF = hi(30*12+1:end,lat1fram:lat2fram,longfram);
fhBA = hi(30*12+1:end,lat1barents:lat2barents,longbarents);
fhBE = hi(30*12+1:end,latbering,long1bering:long2bering);
fhC = hi(30*12+1:end,lat1CAA:lat2CAA,longCAA);
ncload b30.040f.ES01.csim.h.hi_nh.2000-01_cat_2049-12.nc hi 
fhF = cat(1,fhF,hi(:,latt1fram:latt2fram,longfram));
fhBA = cat(1,fhBA,hi(:,latt1barents:latt2barents,longbarents));
fhBE = cat(1,fhBE,hi(:,lattbering,long1bering:long2bering));
fhC = cat(1,fhC,hi(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040f.ES01.csim.h.hi_nh.2050-01_cat_2099-12.nc hi
fhF = cat(1,fhF,hi(:,latt1fram:latt2fram,longfram));
fhBA = cat(1,fhBA,hi(:,latt1barents:latt2barents,longbarents));
fhBE = cat(1,fhBE,hi(:,lattbering,long1bering:long2bering));
fhC = cat(1,fhC,hi(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030f.ES01.csim.h.u.1870-01_cat_1999-12.nc u
fuF = u(30*12+1:end,lat1fram:lat2fram,longfram);
fuBA = u(30*12+1:end,lat1barents:lat2barents,longbarents);
fuC = u(30*12+1:end,lat1CAA:lat2CAA,longCAA);
ncload b30.040f.ES01.csim.h.u_nh.2000-01_cat_2049-12.nc u
fuF = cat(1,fuF,u(:,latt1fram:latt2fram,longfram));
fuBA = cat(1,fuBA,u(:,latt1barents:latt2barents,longbarents));
fuC = cat(1,fuC,u(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040f.ES01.csim.h.u_nh.2050-01_cat_2099-12.nc u
fuF = cat(1,fuF,u(:,latt1fram:latt2fram,longfram));
fuBA = cat(1,fuBA,u(:,latt1barents:latt2barents,longbarents));
fuC = cat(1,fuC,u(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030f.ES01.csim.h.v.1870-01_cat_1999-12.nc v
fvBE = v(30*12+1:end,latbering,long1bering:long2bering);
ncload b30.040f.ES01.csim.h.v_nh.2000-01_cat_2049-12.nc v
fvBE = cat(1,fvBE,v(:,lattbering,long1bering:long2bering));
ncload b30.040f.ES01.csim.h.v_nh.2050-01_cat_2099-12.nc v
fvBE = cat(1,fvBE,v(:,lattbering,long1bering:long2bering));

[nt nlat nlon] = size(fF);
HTEF = repmat(HTE(lat1fram:lat2fram,longfram),[1 1 nt]);
HTEF = permute(HTEF,[3 1 2]);
HTEBA = repmat(HTE(lat1barents:lat2barents,longbarents),[1 1 nt]);
HTEBA = permute(HTEBA,[3 1 2]);
HTEC = repmat(HTE(lat1CAA:lat2CAA,longCAA),[1 1 nt]);
HTEC = permute(HTEC,[3 1 2]);
HTNBE = repmat(HTN(latbering,long1bering:long2bering),[1 1 nt]);
HTNBE = permute(HTNBE,[3 1 2]); 

[nt n] = size(fuF);
fFI = squeeze(nansum(nansum(reshape(fuF/100.*fhF.*HTEF,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(fuBA);
fBAI = squeeze(nansum(nansum(reshape(fuBA/100.*fhBA.*HTEBA,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(fuC);
fCI = squeeze(nansum(nansum(reshape(fuC/100.*fhC.*HTEC,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(fvBE);
fBEI = squeeze(nansum(nansum(reshape(squeeze(fvBE)/100.*squeeze(fhBE).*squeeze(HTNBE),[12 nt/12 n]),3),1))*365/12*24*60*60;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% g.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030g.ES01.csim.h.hi_nh.1900-01_cat_1949-12.nc hi
ghF = hi(:,latt1fram:latt2fram,longfram);
ghBA = hi(:,latt1barents:latt2barents,longbarents);
ghBE = hi(:,lattbering,long1bering:long2bering);
ghC = hi(:,latt1CAA:latt2CAA,longCAA);
ncload b30.030g.ES01.csim.h.hi_nh.1950-01_cat_1999-12.nc hi
ghF = cat(1,ghF,hi(:,latt1fram:latt2fram,longfram));
ghBA = cat(1,ghBA,hi(:,latt1barents:latt2barents,longbarents));
ghBE = cat(1,ghBE,hi(:,lattbering,long1bering:long2bering));
ghC = cat(1,ghC,hi(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040g.ES01.csim.h.hi_nh.2000-01_cat_2049-12.nc hi
ghF = cat(1,ghF,hi(:,latt1fram:latt2fram,longfram));
ghBA = cat(1,ghBA,hi(:,latt1barents:latt2barents,longbarents));
ghBE = cat(1,ghBE,hi(:,lattbering,long1bering:long2bering));
ghC = cat(1,ghC,hi(:,latt1CAA:latt2CAA,longCAA));
ncload  b30.040g.ES01.csim.h.hi_nh.2050-01_cat_2099-12.nc hi
ghF = cat(1,ghF,hi(:,latt1fram:latt2fram,longfram));
ghBA = cat(1,ghBA,hi(:,latt1barents:latt2barents,longbarents));
ghBE = cat(1,ghBE,hi(:,lattbering,long1bering:long2bering));
ghC = cat(1,ghC,hi(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030g.ES01.csim.h.u_nh.1900-01_cat_1949-12.nc u
guF = u(:,latt1fram:latt2fram,longfram);
guBA = u(:,latt1barents:latt2barents,longbarents);
guC = u(:,latt1CAA:latt2CAA,longCAA);
ncload b30.030g.ES01.csim.h.u_nh.1950-01_cat_1999-12.nc u
guF = cat(1,guF,u(:,latt1fram:latt2fram,longfram));
guBA = cat(1,guBA,u(:,latt1barents:latt2barents,longbarents));
guC = cat(1,guC,u(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040g.ES01.csim.h.u_nh.2000-01_cat_2049-12.nc u
guF = cat(1,guF,u(:,latt1fram:latt2fram,longfram));
guBA = cat(1,guBA,u(:,latt1barents:latt2barents,longbarents));
guC = cat(1,guC,u(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040g.ES01.csim.h.u_nh.2050-01_cat_2099-12.nc u
guF = cat(1,guF,u(:,latt1fram:latt2fram,longfram));
guBA = cat(1,guBA,u(:,latt1barents:latt2barents,longbarents));
guC = cat(1,guC,u(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030g.ES01.csim.h.v_nh.1900-01_cat_1949-12.nc v
gvBE = v(:,lattbering,long1bering:long2bering);
ncload b30.030g.ES01.csim.h.v_nh.1950-01_cat_1999-12.nc v
gvBE = cat(1,gvBE,v(:,lattbering,long1bering:long2bering));
ncload b30.040g.ES01.csim.h.v_nh.2000-01_cat_2049-12.nc v
gvBE = cat(1,gvBE,v(:,lattbering,long1bering:long2bering));
ncload b30.040g.ES01.csim.h.v_nh.2050-01_cat_2099-12.nc v
gvBE = cat(1,gvBE,v(:,lattbering,long1bering:long2bering));

[nt nlat nlon] = size(gF);
HTEF = repmat(HTE(latt1fram:latt2fram,longfram),[1 1 nt]);
HTEF = permute(HTEF,[3 1 2]);
HTEBA = repmat(HTE(latt1barents:latt2barents,longbarents),[1 1 nt]);
HTEBA = permute(HTEBA,[3 1 2]);
HTEC = repmat(HTE(latt1CAA:latt2CAA,longCAA),[1 1 nt]);
HTEC = permute(HTEC,[3 1 2]);
HTNBE = repmat(HTN(lattbering,long1bering:long2bering),[1 1 nt]);
HTNBE = permute(HTNBE,[3 1 2]); 

[nt n] = size(guF);
gFI = squeeze(nansum(nansum(reshape(guF/100.*ghF.*HTEF,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(guBA);
gBAI = squeeze(nansum(nansum(reshape(guBA/100.*ghBA.*HTEBA,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(guC);
gCI = squeeze(nansum(nansum(reshape(guC/100.*ghC.*HTEC,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(gvBE);
gBEI = squeeze(nansum(nansum(reshape(squeeze(gvBE)/100.*squeeze(ghBE).*squeeze(HTNBE),[12 nt/12 n]),3),1))*365/12*24*60*60;

save Export.mat

