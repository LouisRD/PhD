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

ncload b30.030a.csim.h.aice.1870-01_cat_1999-12.nc aice HTE HTN
aF = aice(30*12+1:end,lat1fram:lat2fram,longfram);
aBA = aice(30*12+1:end,lat1barents:lat2barents,longbarents);
aBE = aice(30*12+1:end,latbering,long1bering:long2bering);
aC = aice(30*12+1:end,lat1CAA:lat2CAA,longCAA);
ncload b30.040a.csim.h.aice.2000-01_cat_2099-12.nc aice
aF = cat(1,aF,aice(:,lat1fram:lat2fram,longfram));
aBA = cat(1,aBA,aice(:,lat1barents:lat2barents,longbarents));
aBE = cat(1,aBE,aice(:,latbering,long1bering:long2bering));
aC = cat(1,aC,aice(:,lat1CAA:lat2CAA,longCAA));

ncload b30.030a.csim.h.frazil_nh.1900-01_cat_1949-12.nc frazil tarea
tmp = frazil;
ncload b30.030a.csim.h.frazil_nh.1950-01_cat_1999-12.nc frazil
tmp = cat(1,tmp,frazil);
ncload b30.040a.csim.h.frazil.2000-01_cat_2099-12.nc frazil
tmp = cat(1,tmp,frazil(:,end-103:end,:));
[nt nlat nlon] = size(tmp);
A = repmat(tarea,[1 1 nt/12]);
A = permute(A,[3 1 2]);
af = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030a.csim.h.growb_nh.1900-01_cat_1949-12.nc growb
tmp = growb;
ncload b30.030a.csim.h.growb_nh.1950-01_cat_1999-12.nc growb
tmp = cat(1,tmp,growb);
ncload b30.040a.csim.h.growb.2000-01_cat_2099-12.nc growb
tmp = cat(1,tmp,growb(:,end-103:end,:));
ag = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030a.csim.h.meltl_nh.1900-01_cat_1949-12.nc meltl
tmp = meltl;
ncload b30.030a.csim.h.meltl_nh.1950-01_cat_1999-12.nc meltl
tmp = cat(1,tmp,meltl);
ncload b30.040a.csim.h.meltl.2000-01_cat_2099-12.nc meltl
tmp = cat(1,tmp,meltl(:,end-103:end,:));
aML = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030a.csim.h.meltt_nh.1900-01_cat_1949-12.nc meltt
tmp = meltt;
ncload b30.030a.csim.h.meltt_nh.1950-01_cat_1999-12.nc meltt
tmp = cat(1,tmp,meltt);
ncload b30.040a.csim.h.meltt.2000-01_cat_2099-12.nc meltt
tmp = cat(1,tmp,meltt(:,end-103:end,:));
aMT = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030a.csim.h.meltb_nh.1900-01_cat_1949-12.nc meltb
tmp = meltb;
ncload b30.030a.csim.h.meltb_nh.1950-01_cat_1999-12.nc meltb
tmp = cat(1,tmp,meltb);
ncload b30.040a.csim.h.meltb.2000-01_cat_2099-12.nc meltb
tmp = cat(1,tmp,meltb(:,end-103:end,:));
aMB = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030a.csim.h.hi_nh.1900-01_cat_1949-12.nc
ahF = hi(:,latt1fram:latt2fram,longfram);
ahBA = hi(:,latt1barents:latt2barents,longbarents);
ahBE = hi(:,lattbering,long1bering:long2bering);
ahC = hi(:,latt1CAA:latt2CAA,longCAA);
ncload b30.030a.csim.h.hi_nh.1950-01_cat_1999-12.nc
ahF = cat(1,ahF,hi(:,latt1fram:latt2fram,longfram));
ahBA = cat(1,ahBA,hi(:,latt1barents:latt2barents,longbarents));
ahBE = cat(1,ahBE,hi(:,lattbering,long1bering:long2bering));
ahC = cat(1,ahC,hi(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040a.csim.h.hi.2000-01_cat_2099-12.nc
ahF = cat(1,ahF,hi(:,lat1fram:lat2fram,longfram));
ahBA = cat(1,ahBA,hi(:,lat1barents:lat2barents,longbarents));
ahBE = cat(1,ahBE,hi(:,latbering,long1bering:long2bering));
ahC = cat(1,ahC,hi(:,lat1CAA:lat2CAA,longCAA));

ncload b30.030a.csim.h.u_nh.1900-01_cat_1949-12.nc u
auF = u(:,latt1fram:latt2fram,longfram);
auBA = u(:,latt1barents:latt2barents,longbarents);
auC = u(:,latt1CAA:latt2CAA,longCAA);
ncload b30.030a.csim.h.u_nh.1950-01_cat_1999-12.nc u
auF = cat(1,auF,u(:,latt1fram:latt2fram,longfram));
auBA = cat(1,auBA,u(:,latt1barents:latt2barents,longbarents));
auC = cat(1,auC,u(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040a.csim.h.u.2000-01_cat_2099-12.nc u
auF = cat(1,auF,u(:,lat1fram:lat2fram,longfram));
auBA = cat(1,auBA,u(:,lat1barents:lat2barents,longbarents));
auC = cat(1,auC,u(:,lat1CAA:lat2CAA,longCAA));

ncload b30.030a.csim.h.v_nh.1900-01_cat_1949-12.nc v
avBE = v(:,lattbering,long1bering:long2bering);
ncload b30.030a.csim.h.v_nh.1950-01_cat_1999-12.nc v
avBE = cat(1,avBE,v(:,lattbering,long1bering:long2bering));
ncload b30.040a.csim.h.v.2000-01_cat_2099-12.nc v
avBE = cat(1,avBE,v(:,latbering,long1bering:long2bering));

[nt nlat nlon] = size(aF);
HTEF = repmat(HTE(lat1fram:lat2fram,longfram),[1 1 nt]);
HTEF = permute(HTEF,[3 1 2]);
HTEBA = repmat(HTE(lat1barents:lat2barents,longbarents),[1 1 nt]);
HTEBA = permute(HTEBA,[3 1 2]);
HTEC = repmat(HTE(lat1CAA:lat2CAA,longCAA),[1 1 nt]);
HTEC = permute(HTEC,[3 1 2]);
HTNBE = repmat(HTN(latbering,long1bering:long2bering),[1 1 nt]);
HTNBE = permute(HTNBE,[3 1 2]); 

[nt n] = size(auF);
aFI = squeeze(nansum(nansum(reshape(auF(9:end-4,:)/100.*aF(9:end-4,:)/100.*ahF(9:end-4,:).*HTEF(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(auBA);
aBAI = squeeze(nansum(nansum(reshape(auBA(9:end-4,:)/100.*aBA(9:end-4,:)/100.*ahBA(9:end-4,:).*HTEBA(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(auC);
aCI = squeeze(nansum(nansum(reshape(auC(9:end-4,:)/100.*aC(9:end-4,:)/100.*ahC(9:end-4,:).*HTEC(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(avBE);
aBEI = squeeze(nansum(nansum(reshape(squeeze(avBE(9:end-4,:))/100.*aBE(9:end-4,:)/100.*squeeze(ahBE(9:end-4,:)).*HTNBE(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% b.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030b.ES01.csim.h.aice.1870-01_cat_1999-12.nc aice HTE HTN
bF = aice(30*12+1:end,lat1fram:lat2fram,longfram);
bBA = aice(30*12+1:end,lat1barents:lat2barents,longbarents);
bBE = aice(30*12+1:end,latbering,long1bering:long2bering);
bC = aice(30*12+1:end,lat1CAA:lat2CAA,longCAA);
ncload b30.040b.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
bF = cat(1,bF,aice(:,latt1fram:latt2fram,longfram));
bBA = cat(1,bBA,aice(:,latt1barents:latt2barents,longbarents));
bBE = cat(1,bBE,aice(:,lattbering,long1bering:long2bering));
bC = cat(1,bC,aice(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040b.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
bF = cat(1,bF,aice(:,latt1fram:latt2fram,longfram));
bBA = cat(1,bBA,aice(:,latt1barents:latt2barents,longbarents));
bBE = cat(1,bBE,aice(:,lattbering,long1bering:long2bering));
bC = cat(1,bC,aice(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030b.ES01.csim.h.frazil.1870-01_cat_1999-12.nc frazil
tmp = frazil(30*12+1:end,end-103:end,:);
ncload b30.040b.ES01.csim.h.frazil_nh.2000-01_cat_2049-12.nc frazil
tmp = cat(1,tmp,frazil);
ncload b30.040b.ES01.csim.h.frazil_nh.2050-01_cat_2099-12.nc frazil
tmp = cat(1,tmp,frazil);
bf = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030b.ES01.csim.h.growb.1870-01_cat_1999-12.nc growb
tmp = growb(30*12+1:end,end-103:end,:);
ncload b30.040b.ES01.csim.h.growb_nh.2000-01_cat_2049-12.nc growb
tmp = cat(1,tmp,growb);
ncload b30.040b.ES01.csim.h.growb_nh.2050-01_cat_2099-12.nc growb
tmp = cat(1,tmp,growb);
bg = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030b.ES01.csim.h.meltl.1870-01_cat_1999-12.nc meltl
tmp = meltl(30*12+1:end,end-103:end,:);
ncload b30.040b.ES01.csim.h.meltl_nh.2000-01_cat_2049-12.nc meltl
tmp = cat(1,tmp,meltl);
ncload b30.040b.ES01.csim.h.meltl_nh.2050-01_cat_2099-12.nc meltl
tmp = cat(1,tmp,meltl);
bML = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030b.ES01.csim.h.meltt.1870-01_cat_1999-12.nc meltt
tmp = meltt(30*12+1:end,end-103:end,:);
ncload b30.040b.ES01.csim.h.meltt_nh.2000-01_cat_2049-12.nc meltt
tmp = cat(1,tmp,meltt);
ncload b30.040b.ES01.csim.h.meltt_nh.2050-01_cat_2099-12.nc meltt
tmp = cat(1,tmp,meltt);
bMT = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030b.ES01.csim.h.meltb.1870-01_cat_1999-12.nc meltb
tmp = meltb(30*12+1:end,end-103:end,:);
ncload b30.040b.ES01.csim.h.meltb_nh.2000-01_cat_2049-12.nc meltb
tmp = cat(1,tmp,meltb);
ncload b30.040b.ES01.csim.h.meltb_nh.2050-01_cat_2099-12.nc meltb
tmp = cat(1,tmp,meltb);
bMB = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

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

[nt nlat nlon] = size(bF);
HTEF = repmat(HTE(lat1fram:lat2fram,longfram),[1 1 nt]);
HTEF = permute(HTEF,[3 1 2]);
HTEBA = repmat(HTE(lat1barents:lat2barents,longbarents),[1 1 nt]);
HTEBA = permute(HTEBA,[3 1 2]);
HTEC = repmat(HTE(lat1CAA:lat2CAA,longCAA),[1 1 nt]);
HTEC = permute(HTEC,[3 1 2]);
HTNBE = repmat(HTN(latbering,long1bering:long2bering),[1 1 nt]);
HTNBE = permute(HTNBE,[3 1 2]); 

[nt n] = size(buF);
bFI = squeeze(nansum(nansum(reshape(buF(9:end-4,:)/100.*bF(9:end-4,:)/100.*bhF(9:end-4,:).*HTEF(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(buBA);
bBAI = squeeze(nansum(nansum(reshape(buBA(9:end-4,:)/100.*bBA(9:end-4,:)/100.*bhBA(9:end-4,:).*HTEBA(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(buC);
bCI = squeeze(nansum(nansum(reshape(buC(9:end-4,:)/100.*bC(9:end-4,:)/100.*bhC(9:end-4,:).*HTEC(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(bvBE);
bBEI = squeeze(nansum(nansum(reshape(squeeze(bvBE(9:end-4,:))/100.*bBE(9:end-4,:)/100.*squeeze(bhBE(9:end-4,:)).*HTNBE(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% c
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030c.csim.h.aice.1870-01_cat_1999-12.nc aice HTE HTN 
cF = aice(30*12+1:end,lat1fram:lat2fram,longfram);
cBA = aice(30*12+1:end,lat1barents:lat2barents,longbarents);
cBE = aice(30*12+1:end,latbering,long1bering:long2bering);
cC = aice(30*12+1:end,lat1CAA:lat2CAA,longCAA);
ncload b30.040c.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
cF = cat(1,cF,aice(:,latt1fram:latt2fram,longfram));
cBA = cat(1,cBA,aice(:,latt1barents:latt2barents,longbarents));
cBE = cat(1,cBE,aice(:,lattbering,long1bering:long2bering));
cC = cat(1,cC,aice(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040c.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
cF = cat(1,cF,aice(:,latt1fram:latt2fram,longfram));
cBA = cat(1,cBA,aice(:,latt1barents:latt2barents,longbarents));
cBE = cat(1,cBE,aice(:,lattbering,long1bering:long2bering));
cC = cat(1,cC,aice(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030c.csim.h.frazil_nh.1900-01_cat_1949-12.nc frazil
tmp = frazil;
ncload b30.030c.csim.h.frazil_nh.1950-01_cat_1999-12.nc frazil
tmp = cat(1,tmp,frazil);
ncload b30.040c.csim.h.frazil_nh.2000-01_cat_2049-12.nc frazil
tmp = cat(1,tmp,frazil);
ncload b30.040c.csim.h.frazil_nh.2050-01_cat_2099-12.nc frazil
tmp = cat(1,tmp,frazil);
cf = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030c.csim.h.growb_nh.1900-01_cat_1949-12.nc growb
tmp = growb;
ncload b30.030c.csim.h.growb_nh.1950-01_cat_1999-12.nc growb
tmp = cat(1,tmp,growb);
ncload b30.040c.csim.h.growb_nh.2000-01_cat_2049-12.nc growb
tmp = cat(1,tmp,growb);
ncload b30.040c.csim.h.growb_nh.2050-01_cat_2099-12.nc growb
tmp = cat(1,tmp,growb);
cg = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030c.csim.h.meltl_nh.1900-01_cat_1949-12.nc meltl
tmp = meltl;
ncload b30.030c.csim.h.meltl_nh.1950-01_cat_1999-12.nc meltl
tmp = cat(1,tmp,meltl);
ncload b30.040c.csim.h.meltl_nh.2000-01_cat_2049-12.nc meltl
tmp = cat(1,tmp,meltl);
ncload b30.040c.csim.h.meltl_nh.2050-01_cat_2099-12.nc meltl
tmp = cat(1,tmp,meltl);
cML = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030c.csim.h.meltt_nh.1900-01_cat_1949-12.nc meltt
tmp = meltt;
ncload b30.030c.csim.h.meltt_nh.1950-01_cat_1999-12.nc meltt
tmp = cat(1,tmp,meltt);
ncload b30.040c.csim.h.meltt_nh.2000-01_cat_2049-12.nc meltt
tmp = cat(1,tmp,meltt);
ncload b30.040c.csim.h.meltt_nh.2050-01_cat_2099-12.nc meltt
tmp = cat(1,tmp,meltt);
cMT = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030c.csim.h.meltb_nh.1900-01_cat_1949-12.nc meltb
tmp = meltb;
ncload b30.030c.csim.h.meltb_nh.1950-01_cat_1999-12.nc meltb
tmp = cat(1,tmp,meltb);
ncload b30.040c.csim.h.meltb_nh.2000-01_cat_2049-12.nc meltb
tmp = cat(1,tmp,meltb);
ncload b30.040c.csim.h.meltb_nh.2050-01_cat_2099-12.nc meltb
tmp = cat(1,tmp,meltb);
cMB = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

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

[nt nlat nlon] = size(cF);
HTEF = repmat(HTE(latt1fram:latt2fram,longfram),[1 1 nt]);
HTEF = permute(HTEF,[3 1 2]);
HTEBA = repmat(HTE(latt1barents:latt2barents,longbarents),[1 1 nt]);
HTEBA = permute(HTEBA,[3 1 2]);
HTEC = repmat(HTE(latt1CAA:latt2CAA,longCAA),[1 1 nt]);
HTEC = permute(HTEC,[3 1 2]);
HTNBE = repmat(HTN(lattbering,long1bering:long2bering),[1 1 nt]);
HTNBE = permute(HTNBE,[3 1 2]); 

[nt n] = size(cuF);
cFI = squeeze(nansum(nansum(reshape(cuF(9:end-4,:)/100.*cF(9:end-4,:)/100.*chF(9:end-4,:).*HTEF(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(cuBA);
cBAI = squeeze(nansum(nansum(reshape(cuBA(9:end-4,:)/100.*cBA(9:end-4,:)/100.*chBA(9:end-4,:).*HTEBA(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(cuC);
cCI = squeeze(nansum(nansum(reshape(cuC(9:end-4,:)/100.*cC(9:end-4,:)/100.*chC(9:end-4,:).*HTEC(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(cvBE);
cBEI = squeeze(nansum(nansum(reshape(squeeze(cvBE(9:end-4,:))/100.*cBE(9:end-4,:)/100.*squeeze(chBE(9:end-4,:)).*HTNBE(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% e
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030e.csim.h.aice.1870-01_cat_1999-12.nc aice HTE HTN tarea
eF = aice(30*12+1:end,lat1fram:lat2fram,longfram);
eBA = aice(30*12+1:end,lat1barents:lat2barents,longbarents);
eBE = aice(30*12+1:end,latbering,long1bering:long2bering);
eC = aice(30*12+1:end,lat1CAA:lat2CAA,longCAA);
ncload b30.040e.csim.h.aice.2000-01_cat_2099-12.nc aice
eF = cat(1,eF,aice(:,lat1fram:lat2fram,longfram));
eBA = cat(1,eBA,aice(:,lat1barents:lat2barents,longbarents));
eBE = cat(1,eBE,aice(:,latbering,long1bering:long2bering));
eC = cat(1,eC,aice(:,lat1CAA:lat2CAA,longCAA));

ncload b30.030e.csim.h.frazil.1870-01_cat_1999-12.nc frazil
tmp = frazil(30*12+1:end,end-103:end,:);
ncload b30.040e.csim.h.frazil.2000-01_cat_2099-12.nc frazil
tmp = cat(1,tmp,frazil(:,end-103:end,:));
ef = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030e.csim.h.growb.1870-01_cat_1999-12.nc growb
tmp = growb(30*12+1:end,end-103:end,:);
ncload b30.040e.csim.h.growb.2000-01_cat_2099-12.nc growb
tmp = cat(1,tmp,growb(:,end-103:end,:));
eg = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030e.csim.h.meltl.1870-01_cat_1999-12.nc meltl
tmp = meltl(30*12+1:end,end-103:end,:);
ncload b30.040e.csim.h.meltl.2000-01_cat_2099-12.nc meltl
tmp = cat(1,tmp,meltl(:,end-103:end,:));
eML = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030e.csim.h.meltt.1870-01_cat_1999-12.nc meltt
tmp = meltt(30*12+1:end,end-103:end,:);
ncload b30.040e.csim.h.meltt.2000-01_cat_2099-12.nc meltt
tmp = cat(1,tmp,meltt(:,end-103:end,:));
eMT = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030e.csim.h.meltb.1870-01_cat_1999-12.nc meltb
tmp = meltb(30*12+1:end,end-103:end,:);
ncload b30.040e.csim.h.meltb.2000-01_cat_2099-12.nc meltb
tmp = cat(1,tmp,meltb(:,end-103:end,:));
eMB = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

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

[nt nlat nlon] = size(eF);
HTEF = repmat(HTE(latt1fram:latt2fram,longfram),[1 1 nt]);
HTEF = permute(HTEF,[3 1 2]);
HTEBA = repmat(HTE(latt1barents:latt2barents,longbarents),[1 1 nt]);
HTEBA = permute(HTEBA,[3 1 2]);
HTEC = repmat(HTE(latt1CAA:latt2CAA,longCAA),[1 1 nt]);
HTEC = permute(HTEC,[3 1 2]);
HTNBE = repmat(HTN(lattbering,long1bering:long2bering),[1 1 nt]);
HTNBE = permute(HTNBE,[3 1 2]); 

[nt n] = size(euF);
eFI = squeeze(nansum(nansum(reshape(euF(9:end-4,:)/100.*eF(9:end-4,:)/100.*ehF(9:end-4,:).*HTEF(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(euBA);
eBAI = squeeze(nansum(nansum(reshape(euBA(9:end-4,:)/100.*eBA(9:end-4,:)/100.*ehBA(9:end-4,:).*HTEBA(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(euC);
eCI = squeeze(nansum(nansum(reshape(euC(9:end-4,:)/100.*eC(9:end-4,:)/100.*ehC(9:end-4,:).*HTEC(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(evBE);
eBEI = squeeze(nansum(nansum(reshape(squeeze(evBE(9:end-4,:))/100.*eBE(9:end-4,:)/100.*squeeze(ehBE(9:end-4,:)).*HTNBE(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% f.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030f.ES01.csim.h.aice.1870-01_cat_1999-12.nc aice HTE HTN 
fF = aice(30*12+1:end,lat1fram:lat2fram,longfram);
fBA = aice(30*12+1:end,lat1barents:lat2barents,longbarents);
fBE = aice(30*12+1:end,latbering,long1bering:long2bering);
fC = aice(30*12+1:end,lat1CAA:lat2CAA,longCAA);
ncload b30.040f.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
fF = cat(1,fF,aice(:,latt1fram:latt2fram,longfram));
fBA = cat(1,fBA,aice(:,latt1barents:latt2barents,longbarents));
fBE = cat(1,fBE,aice(:,lattbering,long1bering:long2bering));
fC = cat(1,fC,aice(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040f.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
fF = cat(1,fF,aice(:,latt1fram:latt2fram,longfram));
fBA = cat(1,fBA,aice(:,latt1barents:latt2barents,longbarents));
fBE = cat(1,fBE,aice(:,lattbering,long1bering:long2bering));
fC = cat(1,fC,aice(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030f.ES01.csim.h.frazil.1870-01_cat_1999-12.nc frazil
tmp = frazil(30*12+1:end,end-103:end,:);
ncload b30.040f.ES01.csim.h.frazil_nh.2000-01_cat_2049-12.nc frazil
tmp = cat(1,tmp,frazil);
ncload b30.040f.ES01.csim.h.frazil_nh.2050-01_cat_2099-12.nc frazil
tmp = cat(1,tmp,frazil);
ff = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030f.ES01.csim.h.growb.1870-01_cat_1999-12.nc growb
tmp = growb(30*12+1:end,end-103:end,:);
ncload b30.040f.ES01.csim.h.growb_nh.2000-01_cat_2049-12.nc growb
tmp = cat(1,tmp,growb);
ncload b30.040f.ES01.csim.h.growb_nh.2050-01_cat_2099-12.nc growb
tmp = cat(1,tmp,growb);
fg = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030f.ES01.csim.h.meltl.1870-01_cat_1999-12.nc meltl
tmp = meltl(30*12+1:end,end-103:end,:);
ncload b30.040f.ES01.csim.h.meltl_nh.2000-01_cat_2049-12.nc meltl
tmp = cat(1,tmp,meltl);
ncload b30.040f.ES01.csim.h.meltl_nh.2050-01_cat_2099-12.nc meltl
tmp = cat(1,tmp,meltl);
fML = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030f.ES01.csim.h.meltt.1870-01_cat_1999-12.nc meltt
tmp = meltt(30*12+1:end,end-103:end,:);
ncload b30.040f.ES01.csim.h.meltt_nh.2000-01_cat_2049-12.nc meltt
tmp = cat(1,tmp,meltt);
ncload b30.040f.ES01.csim.h.meltt_nh.2050-01_cat_2099-12.nc meltt
tmp = cat(1,tmp,meltt);
fMT = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030f.ES01.csim.h.meltb.1870-01_cat_1999-12.nc meltb
tmp = meltb(30*12+1:end,end-103:end,:);
ncload b30.040f.ES01.csim.h.meltb_nh.2000-01_cat_2049-12.nc meltb
tmp = cat(1,tmp,meltb);
ncload b30.040f.ES01.csim.h.meltb_nh.2050-01_cat_2099-12.nc meltb
tmp = cat(1,tmp,meltb);
fMB = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

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
fFI = squeeze(nansum(nansum(reshape(fuF(9:end-4,:)/100.*fF(9:end-4,:)/100.*fhF(9:end-4,:).*HTEF(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(fuBA);
fBAI = squeeze(nansum(nansum(reshape(fuBA(9:end-4,:)/100.*fBA(9:end-4,:)/100.*fhBA(9:end-4,:).*HTEBA(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(fuC);
fCI = squeeze(nansum(nansum(reshape(fuC(9:end-4,:)/100.*fC(9:end-4,:)/100.*fhC(9:end-4,:).*HTEC(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(fvBE);
fBEI = squeeze(nansum(nansum(reshape(squeeze(fvBE(9:end-4,:))/100.*fBE(9:end-4,:)/100.*squeeze(fhBE(9:end-4,:)).*HTNBE(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% g.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030g.ES01.csim.h.aice_nh.1900-01_cat_1949-12.nc aice HTE HTN 
gF = aice(:,latt1fram:latt2fram,longfram);
gBA = aice(:,latt1barents:latt2barents,longbarents);
gBE = aice(:,lattbering,long1bering:long2bering);
gC = aice(:,latt1CAA:latt2CAA,longCAA);
ncload b30.030g.ES01.csim.h.aice_nh.1950-01_cat_1999-12.nc aice
gF = cat(1,gF,aice(:,latt1fram:latt2fram,longfram));
gBA = cat(1,gBA,aice(:,latt1barents:latt2barents,longbarents));
gBE = cat(1,gBE,aice(:,lattbering,long1bering:long2bering));
gC = cat(1,gC,aice(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040g.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
gF = cat(1,gF,aice(:,latt1fram:latt2fram,longfram));
gBA = cat(1,gBA,aice(:,latt1barents:latt2barents,longbarents));
gBE = cat(1,gBE,aice(:,lattbering,long1bering:long2bering));
gC = cat(1,gC,aice(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040g.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
gF = cat(1,gF,aice(:,latt1fram:latt2fram,longfram));
gBA = cat(1,gBA,aice(:,latt1barents:latt2barents,longbarents));
gBE = cat(1,gBE,aice(:,lattbering,long1bering:long2bering));
gC = cat(1,gC,aice(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030g.ES01.csim.h.frazil_nh.1900-01_cat_1949-12.nc frazil
tmp = frazil;
ncload b30.030g.ES01.csim.h.frazil_nh.1950-01_cat_1999-12.nc frazil
tmp = cat(1,tmp,frazil);
ncload b30.040g.ES01.csim.h.frazil_nh.2000-01_cat_2049-12.nc frazil
tmp = cat(1,tmp,frazil);
ncload b30.040g.ES01.csim.h.frazil_nh.2050-01_cat_2099-12.nc frazil
tmp = cat(1,tmp,frazil);
gf = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030g.ES01.csim.h.growb_nh.1900-01_cat_1949-12.nc growb
tmp = growb;
ncload b30.030g.ES01.csim.h.growb_nh.1950-01_cat_1999-12.nc growb
tmp = cat(1,tmp,growb);
ncload b30.040g.ES01.csim.h.growb_nh.2000-01_cat_2049-12.nc growb
tmp = cat(1,tmp,growb);
ncload b30.040g.ES01.csim.h.growb_nh.2050-01_cat_2099-12.nc growb
tmp = cat(1,tmp,growb);
gg = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030g.ES01.csim.h.meltl_nh.1900-01_cat_1949-12.nc meltl
tmp = meltl;
ncload b30.030g.ES01.csim.h.meltl_nh.1950-01_cat_1999-12.nc meltl
tmp = cat(1,tmp,meltl);
ncload b30.040g.ES01.csim.h.meltl_nh.2000-01_cat_2049-12.nc meltl
tmp = cat(1,tmp,meltl);
ncload b30.040g.ES01.csim.h.meltl_nh.2050-01_cat_2099-12.nc meltl
tmp = cat(1,tmp,meltl);
gML = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030g.ES01.csim.h.meltt_nh.1900-01_cat_1949-12.nc meltt
tmp = meltt;
ncload b30.030g.ES01.csim.h.meltt_nh.1950-01_cat_1999-12.nc meltt
tmp = cat(1,tmp,meltt);
ncload b30.040g.ES01.csim.h.meltt_nh.2000-01_cat_2049-12.nc meltt
tmp = cat(1,tmp,meltt);
ncload b30.040g.ES01.csim.h.meltt_nh.2050-01_cat_2099-12.nc meltt
tmp = cat(1,tmp,meltt);
gMT = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

ncload b30.030g.ES01.csim.h.meltb_nh.1900-01_cat_1949-12.nc meltb
tmp = meltb;
ncload b30.030g.ES01.csim.h.meltb_nh.1950-01_cat_1999-12.nc meltb
tmp = cat(1,tmp,meltb);
ncload b30.040g.ES01.csim.h.meltb_nh.2000-01_cat_2049-12.nc meltb
tmp = cat(1,tmp,meltb);
ncload b30.040g.ES01.csim.h.meltb_nh.2050-01_cat_2099-12.nc meltb
tmp = cat(1,tmp,meltb);
gMB = nansum(nansum(squeeze(nansum(reshape(tmp(9:end-4,latt1:latt2,long1:long2)/100,[12 nt/12-1 lat2-lat1+1 long2-long1+1]),1)).*A(1:nt/12-1,latt1:latt2,long1:long2),3),2)/12*365;

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
gFI = squeeze(nansum(nansum(reshape(guF(9:end-4,:)/100.*gF(9:end-4,:)/100.*ghF(9:end-4,:).*HTEF(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(guBA);
gBAI = squeeze(nansum(nansum(reshape(guBA(9:end-4,:)/100.*gBA(9:end-4,:)/100.*ghBA(9:end-4,:).*HTEBA(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(guC);
gCI = squeeze(nansum(nansum(reshape(guC(9:end-4,:)/100.*gC(9:end-4,:)/100.*ghC(9:end-4,:).*HTEC(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(gvBE);
gBEI = squeeze(nansum(nansum(reshape(squeeze(gvBE(9:end-4,:))/100.*gBE(9:end-4,:)/100.*squeeze(ghBE(9:end-4,:)).*HTNBE(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;


save IceProc.mat


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load IceProc.mat

[nt n] = size(auF);
aFI2 = squeeze(nansum(nansum(reshape(auF(9:end-4,:)/100.*ahF(9:end-4,:).*HTEF(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(auBA);
aBAI2 = squeeze(nansum(nansum(reshape(auBA(9:end-4,:)/100.*ahBA(9:end-4,:).*HTEBA(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(auC);
aCI2 = squeeze(nansum(nansum(reshape(auC(9:end-4,:)/100.*ahC(9:end-4,:).*HTEC(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(avBE);
aBEI2 = squeeze(nansum(nansum(reshape(squeeze(avBE(9:end-4,:))/100.*squeeze(ahBE(9:end-4,:)).*HTNBE(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(buF);
bFI2 = squeeze(nansum(nansum(reshape(buF(9:end-4,:)/100.*bhF(9:end-4,:).*HTEF(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(buBA);
bBAI2 = squeeze(nansum(nansum(reshape(buBA(9:end-4,:)/100.*bhBA(9:end-4,:).*HTEBA(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(buC);
bCI2 = squeeze(nansum(nansum(reshape(buC(9:end-4,:)/100.*bhC(9:end-4,:).*HTEC(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(bvBE);
bBEI2 = squeeze(nansum(nansum(reshape(squeeze(bvBE(9:end-4,:))/100.*squeeze(bhBE(9:end-4,:)).*HTNBE(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(cuF);
cFI2 = squeeze(nansum(nansum(reshape(cuF(9:end-4,:)/100.*chF(9:end-4,:).*HTEF(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(cuBA);
cBAI2 = squeeze(nansum(nansum(reshape(cuBA(9:end-4,:)/100.*chBA(9:end-4,:).*HTEBA(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(cuC);
cCI2 = squeeze(nansum(nansum(reshape(cuC(9:end-4,:)/100.*chC(9:end-4,:).*HTEC(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(cvBE);
cBEI2 = squeeze(nansum(nansum(reshape(squeeze(cvBE(9:end-4,:))/100.*squeeze(chBE(9:end-4,:)).*HTNBE(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(euF);
eFI2 = squeeze(nansum(nansum(reshape(euF(9:end-4,:)/100.*ehF(9:end-4,:).*HTEF(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(euBA);
eBAI2 = squeeze(nansum(nansum(reshape(euBA(9:end-4,:)/100.*ehBA(9:end-4,:).*HTEBA(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(euC);
eCI2 = squeeze(nansum(nansum(reshape(euC(9:end-4,:)/100.*ehC(9:end-4,:).*HTEC(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(evBE);
eBEI2 = squeeze(nansum(nansum(reshape(squeeze(evBE(9:end-4,:))/100.*squeeze(ehBE(9:end-4,:)).*HTNBE(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;


[nt n] = size(fuF);
fFI2 = squeeze(nansum(nansum(reshape(fuF(9:end-4,:)/100.*fhF(9:end-4,:).*HTEF(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(fuBA);
fBAI2 = squeeze(nansum(nansum(reshape(fuBA(9:end-4,:)/100.*fhBA(9:end-4,:).*HTEBA(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(fuC);
fCI2 = squeeze(nansum(nansum(reshape(fuC(9:end-4,:)/100.*fhC(9:end-4,:).*HTEC(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(fvBE);
fBEI2 = squeeze(nansum(nansum(reshape(squeeze(fvBE(9:end-4,:))/100.*squeeze(fhBE(9:end-4,:)).*HTNBE(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

[nt n] = size(guF);
gFI2 = squeeze(nansum(nansum(reshape(guF(9:end-4,:)/100.*ghF(9:end-4,:).*HTEF(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(guBA);
gBAI2 = squeeze(nansum(nansum(reshape(guBA(9:end-4,:)/100.*ghBA(9:end-4,:).*HTEBA(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(guC);
gCI2 = squeeze(nansum(nansum(reshape(guC(9:end-4,:)/100.*ghC(9:end-4,:).*HTEC(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;
[nt n] = size(gvBE);
gBEI2 = squeeze(nansum(nansum(reshape(squeeze(gvBE(9:end-4,:))/100.*squeeze(ghBE(9:end-4,:)).*HTNBE(9:end-4,:),[12 nt/12-1 n]),3),1))*365/12*24*60*60;

save IceProc.mat

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Graph

clear
load IceProc.mat

x = (1900:2098);

subplot(3,2,1)
area([2036 2037], [15 15]*10^12,'FaceColor', 'k','Linestyle','none');
hold on
plot(x,(ag+af),x,(aMB+aML+aMT),x,-(aFI2+aBAI2-aCI2+aBEI2))
title('a')
xlim([1900 2100])
ylim([0 1.5]*10^13)

subplot(3,2,2)
area([2027 2028], [15 15]*10^12,'FaceColor', 'k','Linestyle','none');
hold on
area([2030 2031], [15 15]*10^12,'FaceColor', 'k','Linestyle','none');
plot(x,(bg+bf),x,(bMB+bML+bMT),x,-(bFI2+bBAI2-bCI2+bBEI2))
title('b.ES01')
xlim([1900 2100])
ylim([0 1.5]*10^13)

subplot(3,2,3)
area([2032 2033], [15 15]*10^12,'FaceColor', 'k','Linestyle','none');
hold on
plot(x,(cg+cf),x,(cMB+cML+cMT),x,-(cFI2+cBAI2-cCI2+cBEI2))
title('c')
xlim([1900 2100])
ylim([0 1.5]*10^13)
ylabel('m^3/year')

subplot(3,2,4)
area([2032 2033], [15 15]*10^12,'FaceColor', 'k','Linestyle','none');
hold on
plot(x,(eg+ef),x,(eMB+eML+eMT),x,-(eFI2+eBAI2-eCI2+eBEI2))
title('e')
xlim([1900 2100])
ylim([0 1.5]*10^13)

subplot(3,2,5)
area([2013 2015], [15 15]*10^12,'FaceColor', 'k','Linestyle','none');
hold on
plot(x,(fg+ff),x,(fMB+fML+fMT),x,-(fFI2+fBAI2-fCI2+fBEI2))
title('f.ES01')
xlim([1900 2100])
ylim([0 1.5]*10^13)

subplot(3,2,6)
area([2044 2045], [15 15]*10^12,'FaceColor', 'k','Linestyle','none');
hold on
plot(x,(gg+gf),x,(gMB+gML+gMT),x,-(gFI2+gBAI2-gCI2+gBEI2))
title('g.ES01')
xlim([1900 2100])
ylim([0 1.5]*10^13)

print('IceProc2','-djpeg')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
load IceProc.mat

x = (1900:2098);

subplot(3,2,1)
area([2036 2037], [15 15]*10^12,'FaceColor', 'k','Linestyle','none');
hold on
plot(x,aMB,x,aML,x,aMT)
title('a')
xlim([1900 2100])
ylim([0 7]*10^12)

subplot(3,2,2)
area([2027 2028], [15 15]*10^12,'FaceColor', 'k','Linestyle','none');
hold on
area([2030 2031], [15 15]*10^12,'FaceColor', 'k','Linestyle','none');
plot(x,bMB,x,bML,x,bMT)
title('b.ES01')
xlim([1900 2100])
ylim([0 7]*10^12)

subplot(3,2,3)
area([2032 2033], [15 15]*10^12,'FaceColor', 'k','Linestyle','none');
hold on
plot(x,cMB,x,cML,x,cMT)
title('c')
xlim([1900 2100])
ylim([0 7]*10^12)
ylabel('m^3/year')

subplot(3,2,4)
area([2032 2033], [15 15]*10^12,'FaceColor', 'k','Linestyle','none');
hold on
plot(x,eMB,x,eML,x,eMT)
title('e')
xlim([1900 2100])
ylim([0 7]*10^12)

subplot(3,2,5)
area([2013 2015], [15 15]*10^12,'FaceColor', 'k','Linestyle','none');
hold on
plot(x,fMB,x,fML,x,fMT)
title('f.ES01')
xlim([1900 2100])
ylim([0 7]*10^12)

subplot(3,2,6)
area([2044 2045], [15 15]*10^12,'FaceColor', 'k','Linestyle','none');
hold on
plot(x,gMB,x,gML,x,gMT)
title('g.ES01')
xlim([1900 2100])
ylim([0 7]*10^12)

print('Melt','-djpeg')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
load IceProc.mat

mean([mean(af(1:100)+ag(1:100)) mean(bf(1:100)+bg(1:100)) mean(cf(1:100)+cg(1:100)) mean(ef(1:100)+eg(1:100)) mean(ff(1:100)+fg(1:100)) mean(gf(1:100)+gg(1:100))])

tmp = [af+ag bf+bg cf+cg ef+eg ff+fg gf+gg]';
var = max((max(tmp)-min(tmp))/2)

tmp = [aMB+aML+aMT bMB+bML+bMT cMB+cML+cMT eMB+eML+eMT fMB+fML+fMT gMB+gML+gMT];
tmp = tmp(1:100,:);
x = (1900:1999);
pa = polyfit(x,tmp(:,1)',1);
pb = polyfit(x,tmp(:,2)',1);
pc = polyfit(x,tmp(:,3)',1);
pe = polyfit(x,tmp(:,4)',1);
pf = polyfit(x,tmp(:,5)',1);
pg = polyfit(x,tmp(:,6)',1);

mean([pa(1) pb(1) pc(1) pe(1) pf(1) pg(1)])
max([pa(1) pb(1) pc(1) pe(1) pf(1) pg(1)])/2-min([pa(1) pb(1) pc(1) pe(1) pf(1) pg(1)])/2

mean(squeeze(tmp(1,:)))
mean(squeeze(tmp(end,:)))


tmp1 = [af+ag bf+bg cf+cg ef+eg ff+fg gf+gg]';
tmp2 = [aMB+aML+aMT bMB+bML+bMT cMB+cML+cMT eMB+eML+eMT fMB+fML+fMT gMB+gML+gMT]';
mean(tmp1(:,end)/2+tmp2(:,end)/2)
mean(tmp1(:,end)/2-tmp2(:,end)/2)



tmpf = [af bf cf ef ff gf]';
tmpg = [ag bg cg eg fg gg]';
mean(mean(tmpf))
mean(mean(tmpg))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
load IceProc.mat

MB = [aMB bMB cMB eMB fMB gMB];
ML = [aML bML cML eML fML gML];
MT = [aMT bMT cMT eMT fMT gMT];

x = (1901:2099);
nanmean(nanmean(ML))
pa = polyfit(x,ML(:,1)',1);
pb = polyfit(x,ML(:,2)',1);
pc = polyfit(x,ML(:,3)',1);
pe = polyfit(x,ML(:,4)',1);
pf = polyfit(x,ML(:,5)',1);
pg = polyfit(x,ML(:,6)',1);
mean([pa(1) pb(1) pc(1) pe(1) pf(1) pg(1)])

x = (1900:1999);
pa = polyfit(x,MT(1:100,1)',1);
pb = polyfit(x,MT(1:100,2)',1);
pc = polyfit(x,MT(1:100,3)',1);
pe = polyfit(x,MT(1:100,4)',1);
pf = polyfit(x,MT(1:100,5)',1);
pg = polyfit(x,MT(1:100,6)',1);
mean([pa(1) pb(1) pc(1) pe(1) pf(1) pg(1)])

pa = polyfit(x,MB(1:100,1)',1);
pb = polyfit(x,MB(1:100,2)',1);
pc = polyfit(x,MB(1:100,3)',1);
pe = polyfit(x,MB(1:100,4)',1);
pf = polyfit(x,MB(1:100,5)',1);
pg = polyfit(x,MB(1:100,6)',1);
mean([pa(1) pb(1) pc(1) pe(1) pf(1) pg(1)])


mean(MB(1,:))
mean(MT(1,:))
(MB(136,1)+MB(130,2)+MB(132,3)+MB(132,4)+MB(115,5)+MB(144,6))/6
(MT(136,1)+MT(127,2)+MT(132,3)+MT(132,4)+MT(113,5)+MT(144,6))/6











