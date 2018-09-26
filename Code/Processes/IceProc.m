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

ncload b30.030a.csim.h.aice.1870-01_cat_1999-12.nc aice HTE HTN tarea
[nt nlat nlon] = size(aice);
A = repmat(tarea,[1 1 nt]);
A = permute(A,[3 1 2]);
aa = aice(:,lat1:lat2,long1:long2);
a = nansum(nansum(aice(9:12:end,lat1:lat2,long1:long2).*A(1:130,lat1:lat2,long1:long2)/10^14,2),3);
aF = aice(:,lat1fram:lat2fram,longfram);
aBA = aice(:,lat1barents:lat2barents,longbarents);
aBE = aice(:,latbering,long1bering:long2bering);
aC = aice(:,lat1CAA:lat2CAA,longCAA);
ncload b30.040a.csim.h.aice.2000-01_cat_2099-12.nc aice
aa = cat(1,aa,aice(:,lat1:lat2,long1:long2));
a = cat(1,a,nansum(nansum(aice(9:12:end,lat1:lat2,long1:long2).*A(1:100,lat1:lat2,long1:long2)/10^14,2),3));
aF = cat(1,aF,aice(:,lat1fram:lat2fram,longfram));
aBA = cat(1,aBA,aice(:,lat1barents:lat2barents,longbarents));
aBE = cat(1,aBE,aice(:,latbering,long1bering:long2bering));
aC = cat(1,aC,aice(:,lat1CAA:lat2CAA,longCAA));

ncload b30.030a.csim.h.frazil_nh.1900-01_cat_1949-12.nc frazil
[nt nlat nlon] = size(frazil);
af = squeeze(nansum(nansum(nansum(reshape(frazil(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.030a.csim.h.frazil_nh.1950-01_cat_1999-12.nc frazil
af = cat(1,af,squeeze(nansum(nansum(nansum(reshape(frazil(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040a.csim.h.frazil.2000-01_cat_2099-12.nc frazil
[nt nlat nlon] = size(frazil);
%af = cat(1,af,squeeze(nansum(nansum(nansum(reshape(frazil(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
af = cat(1,af,squeeze(nansum(nansum(nansum(reshape(frazil(9:end-4,lat1:lat2,long1:long2).*A(1:nt-12,lat1:lat2,long1:long2),[12 (n-1t/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030a.csim.h.growb_nh.1900-01_cat_1949-12.nc growb
[nt nlat nlon] = size(growb);
ag = squeeze(nansum(nansum(nansum(reshape(growb(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2).*aa(30*12+1:80*12,:,:)/100,[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.030a.csim.h.growb_nh.1950-01_cat_1999-12.nc growb
ag = cat(1,ag,squeeze(nansum(nansum(nansum(reshape(growb(:,latt1:latt2,long1:long2).*aa(80*12+1:130*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040a.csim.h.growb.2000-01_cat_2099-12.nc growb
[nt nlat nlon] = size(growb);
ag = cat(1,ag,squeeze(nansum(nansum(nansum(reshape(growb(:,lat1:lat2,long1:long2).*aa(130*12+1:230*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030a.csim.h.meltb_nh.1900-01_cat_1949-12.nc meltb
[nt nlat nlon] = size(meltb);
aMB = squeeze(nansum(nansum(nansum(reshape(meltb(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.030a.csim.h.meltb_nh.1950-01_cat_1999-12.nc meltb
aMB = cat(1,aMB,squeeze(nansum(nansum(nansum(reshape(meltb(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040a.csim.h.meltb.2000-01_cat_2099-12.nc meltb
[nt nlat nlon] = size(meltb);
aMB = cat(1,aMB,squeeze(nansum(nansum(nansum(reshape(meltb(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030a.csim.h.meltl_nh.1900-01_cat_1949-12.nc meltl
[nt nlat nlon] = size(meltl);
aML = squeeze(nansum(nansum(nansum(reshape(meltl(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.030a.csim.h.meltl_nh.1950-01_cat_1999-12.nc meltl
aML = cat(1,aML,squeeze(nansum(nansum(nansum(reshape(meltl(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040a.csim.h.meltl.2000-01_cat_2099-12.nc meltl
[nt nlat nlon] = size(meltl);
aML = cat(1,aML,squeeze(nansum(nansum(nansum(reshape(meltl(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030a.csim.h.meltt_nh.1900-01_cat_1949-12.nc meltt
[nt nlat nlon] = size(meltt);
aMT = squeeze(nansum(nansum(nansum(reshape(meltt(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.030a.csim.h.meltt_nh.1950-01_cat_1999-12.nc meltt
aMT = cat(1,aMT,squeeze(nansum(nansum(nansum(reshape(meltt(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040a.csim.h.meltt.2000-01_cat_2099-12.nc meltt
[nt nlat nlon] = size(meltt);
aMT = cat(1,aMT,squeeze(nansum(nansum(nansum(reshape(meltt(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

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

[nt nlat nlon] = size(aa);
HTEF = repmat(HTE(lat1fram:lat2fram,longfram),[1 1 nt]);
HTEF = permute(HTEF,[3 1 2]);
HTEBA = repmat(HTE(lat1barents:lat2barents,longbarents),[1 1 nt]);
HTEBA = permute(HTEBA,[3 1 2]);
HTEC = repmat(HTE(lat1CAA:lat2CAA,longCAA),[1 1 nt]);
HTEC = permute(HTEC,[3 1 2]);
HTNBE = repmat(HTN(latbering,long1bering:long2bering),[1 1 nt]);
HTNBE = permute(HTNBE,[3 1 2]); 

[nt n] = size(auF);
aFI = squeeze(nansum(nansum(reshape(auF/100.*aF(30*12+1:end,:)/100.*ahF.*HTEF(30*12+1:end,:),[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(auBA);
aBAI = squeeze(nansum(nansum(reshape(auBA/100.*aBA(30*12+1:end,:)/100.*ahBA.*HTEBA(30*12+1:end,:),[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(auC);
aCI = squeeze(nansum(nansum(reshape(auC/100.*aC(30*12+1:end,:)/100.*ahC.*HTEC(30*12+1:end,:),[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(avBE);
aBEI = squeeze(nansum(nansum(reshape(squeeze(avBE)/100.*aBE(30*12+1:end,:)/100.*squeeze(ahBE).*HTNBE(30*12+1:end,:),[12 nt/12 n]),3),1))*365/12*24*60*60;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% b.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030b.ES01.csim.h.aice.1870-01_cat_1999-12.nc aice HTE HTN tarea
[nt nlat nlon] = size(aice);
A = repmat(tarea,[1 1 nt]);
A = permute(A,[3 1 2]);
ba = aice(:,lat1:lat2,long1:long2);
b = nansum(nansum(aice(9:12:end,lat1:lat2,long1:long2).*A(1:130,lat1:lat2,long1:long2)/10^14,2),3);
bF = aice(:,lat1fram:lat2fram,longfram);
bBA = aice(:,lat1barents:lat2barents,longbarents);
bBE = aice(:,latbering,long1bering:long2bering);
bC = aice(:,lat1CAA:lat2CAA,longCAA);
ncload b30.040b.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
ba = cat(1,ba,aice(:,latt1:latt2,long1:long2));
b = cat(1,b,nansum(nansum(aice(9:12:end,latt1:latt2,long1:long2).*A(1:50,lat1:lat2,long1:long2)/10^14,2),3));
bF = cat(1,bF,aice(:,latt1fram:latt2fram,longfram));
bBA = cat(1,bBA,aice(:,latt1barents:latt2barents,longbarents));
bBE = cat(1,bBE,aice(:,lattbering,long1bering:long2bering));
bC = cat(1,bC,aice(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040b.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
ba = cat(1,ba,aice(:,latt1:latt2,long1:long2));
b = cat(1,b,nansum(nansum(aice(9:12:end,latt1:latt2,long1:long2).*A(1:50,lat1:lat2,long1:long2)/10^14,2),3));
bF = cat(1,bF,aice(:,latt1fram:latt2fram,longfram));
bBA = cat(1,bBA,aice(:,latt1barents:latt2barents,longbarents));
bBE = cat(1,bBE,aice(:,lattbering,long1bering:long2bering));
bC = cat(1,bC,aice(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030b.ES01.csim.h.frazil.1870-01_cat_1999-12.nc frazil
[nt nlat nlon] = size(frazil);
bf = squeeze(nansum(nansum(nansum(reshape(frazil(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.040b.ES01.csim.h.frazil_nh.2000-01_cat_2049-12.nc frazil
[nt nlat nlon] = size(frazil);
bf = cat(1,bf,squeeze(nansum(nansum(nansum(reshape(frazil(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040b.ES01.csim.h.frazil_nh.2050-01_cat_2099-12.nc frazil
bf = cat(1,bf,squeeze(nansum(nansum(nansum(reshape(frazil(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030b.ES01.csim.h.growb.1870-01_cat_1999-12.nc growb
[nt nlat nlon] = size(growb);
bg = squeeze(nansum(nansum(nansum(reshape(growb(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2).*ba(1:130*12,:,:)/100,[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.040b.ES01.csim.h.growb_nh.2000-01_cat_2049-12.nc growb
[nt nlat nlon] = size(growb);
bg = cat(1,bg,squeeze(nansum(nansum(nansum(reshape(growb(:,latt1:latt2,long1:long2).*ba(130*12+1:180*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040b.ES01.csim.h.growb_nh.2050-01_cat_2099-12.nc growb
bg = cat(1,bg,squeeze(nansum(nansum(nansum(reshape(growb(:,latt1:latt2,long1:long2).*ba(180*12+1:230*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030b.ES01.csim.h.meltb.1870-01_cat_1999-12.nc meltb
[nt nlat nlon] = size(meltb);
bMB = squeeze(nansum(nansum(nansum(reshape(meltb(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2).*ba(1:130*12,:,:)/100,[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.040b.ES01.csim.h.meltb_nh.2000-01_cat_2049-12.nc meltb
[nt nlat nlon] = size(meltb);
bMB = cat(1,bMB,squeeze(nansum(nansum(nansum(reshape(meltb(:,latt1:latt2,long1:long2).*ba(130*12+1:180*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040b.ES01.csim.h.meltb_nh.2050-01_cat_2099-12.nc meltb
bMB = cat(1,bMB,squeeze(nansum(nansum(nansum(reshape(meltb(:,latt1:latt2,long1:long2).*ba(180*12+1:230*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030b.ES01.csim.h.meltl.1870-01_cat_1999-12.nc meltl
[nt nlat nlon] = size(meltl);
bML = squeeze(nansum(nansum(nansum(reshape(meltl(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2).*ba(1:130*12,:,:)/100,[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.040b.ES01.csim.h.meltl_nh.2000-01_cat_2049-12.nc meltl
[nt nlat nlon] = size(meltl);
bML = cat(1,bML,squeeze(nansum(nansum(nansum(reshape(meltl(:,latt1:latt2,long1:long2).*ba(130*12+1:180*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040b.ES01.csim.h.meltl_nh.2050-01_cat_2099-12.nc meltl
bML = cat(1,bML,squeeze(nansum(nansum(nansum(reshape(meltl(:,latt1:latt2,long1:long2).*ba(180*12+1:230*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030b.ES01.csim.h.meltt.1870-01_cat_1999-12.nc meltt
[nt nlat nlon] = size(meltt);
bMT = squeeze(nansum(nansum(nansum(reshape(meltt(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2).*ba(1:130*12,:,:)/100,[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.040b.ES01.csim.h.meltt_nh.2000-01_cat_2049-12.nc meltt
[nt nlat nlon] = size(meltt);
bMT = cat(1,bMT,squeeze(nansum(nansum(nansum(reshape(meltt(:,latt1:latt2,long1:long2).*ba(130*12+1:180*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040b.ES01.csim.h.meltt_nh.2050-01_cat_2099-12.nc meltt
bMT = cat(1,bMT,squeeze(nansum(nansum(nansum(reshape(meltt(:,latt1:latt2,long1:long2).*ba(180*12+1:230*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030b.ES01.csim.h.hi.1870-01_cat_1999-12.nc hi 
bhF = hi(:,lat1fram:lat2fram,longfram);
bhBA = hi(:,lat1barents:lat2barents,longbarents);
bhBE = hi(:,latbering,long1bering:long2bering);
bhC = hi(:,lat1CAA:lat2CAA,longCAA);
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
buF = u(:,lat1fram:lat2fram,longfram);
buBA = u(:,lat1barents:lat2barents,longbarents);
buC = u(:,lat1CAA:lat2CAA,longCAA);
ncload b30.040b.ES01.csim.h.u_nh.2000-01_cat_2049-12.nc u
buF = cat(1,buF,u(:,latt1fram:latt2fram,longfram));
buBA = cat(1,buBA,u(:,latt1barents:latt2barents,longbarents));
buC = cat(1,buC,u(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040b.ES01.csim.h.u_nh.2050-01_cat_2099-12.nc u
buF = cat(1,buF,u(:,latt1fram:latt2fram,longfram));
buBA = cat(1,buBA,u(:,latt1barents:latt2barents,longbarents));
buC = cat(1,buC,u(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030b.ES01.csim.h.v.1870-01_cat_1999-12.nc v
bvBE = v(:,latbering,long1bering:long2bering);
ncload b30.040b.ES01.csim.h.v_nh.2000-01_cat_2049-12.nc v
bvBE = cat(1,bvBE,v(:,lattbering,long1bering:long2bering));
ncload b30.040b.ES01.csim.h.v_nh.2050-01_cat_2099-12.nc v
bvBE = cat(1,bvBE,v(:,lattbering,long1bering:long2bering));

[nt nlat nlon] = size(ba);
HTEF = repmat(HTE(lat1fram:lat2fram,longfram),[1 1 nt]);
HTEF = permute(HTEF,[3 1 2]);
HTEBA = repmat(HTE(lat1barents:lat2barents,longbarents),[1 1 nt]);
HTEBA = permute(HTEBA,[3 1 2]);
HTEC = repmat(HTE(lat1CAA:lat2CAA,longCAA),[1 1 nt]);
HTEC = permute(HTEC,[3 1 2]);
HTNBE = repmat(HTN(latbering,long1bering:long2bering),[1 1 nt]);
HTNBE = permute(HTNBE,[3 1 2]); 

[nt n] = size(buF);
bFI = squeeze(nansum(nansum(reshape(buF/100.*bF/100.*bhF.*HTEF,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(buBA);
bBAI = squeeze(nansum(nansum(reshape(buBA/100.*bBA/100.*bhBA.*HTEBA,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(buC);
bCI = squeeze(nansum(nansum(reshape(buC/100.*bC/100.*bhC.*HTEC,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(bvBE);
bBEI = squeeze(nansum(nansum(reshape(squeeze(bvBE)/100.*squeeze(bBE)/100.*squeeze(bhBE).*squeeze(HTNBE),[12 nt/12 n]),3),1))*365/12*24*60*60;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% c
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030c.csim.h.aice.1870-01_cat_1999-12.nc aice HTE HTN tarea
[nt nlat nlon] = size(aice);
A = repmat(tarea,[1 1 nt]);
A = permute(A,[3 1 2]);
ca = aice(:,lat1:lat2,long1:long2);
c = nansum(nansum(aice(9:12:end,lat1:lat2,long1:long2).*A(1:130,lat1:lat2,long1:long2)/10^14,2),3);
cF = aice(:,lat1fram:lat2fram,longfram);
cBA = aice(:,lat1barents:lat2barents,longbarents);
cBE = aice(:,latbering,long1bering:long2bering);
cC = aice(:,lat1CAA:lat2CAA,longCAA);
ncload b30.040c.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
ca = cat(1,ca,aice(:,latt1:latt2,long1:long2));
c = cat(1,c,nansum(nansum(aice(9:12:end,latt1:latt2,long1:long2).*A(1:50,lat1:lat2,long1:long2)/10^14,2),3));
cF = cat(1,cF,aice(:,latt1fram:latt2fram,longfram));
cBA = cat(1,cBA,aice(:,latt1barents:latt2barents,longbarents));
cBE = cat(1,cBE,aice(:,lattbering,long1bering:long2bering));
cC = cat(1,cC,aice(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040c.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
ca = cat(1,ca,aice(:,latt1:latt2,long1:long2));
c = cat(1,c,nansum(nansum(aice(9:12:end,latt1:latt2,long1:long2).*A(1:50,lat1:lat2,long1:long2)/10^14,2),3));
cF = cat(1,cF,aice(:,latt1fram:latt2fram,longfram));
cBA = cat(1,cBA,aice(:,latt1barents:latt2barents,longbarents));
cBE = cat(1,cBE,aice(:,lattbering,long1bering:long2bering));
cC = cat(1,cC,aice(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030c.csim.h.frazil_nh.1900-01_cat_1949-12.nc
[nt nlat nlon] = size(frazil);
cf = squeeze(nansum(nansum(nansum(reshape(frazil(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.030c.csim.h.frazil_nh.1950-01_cat_1999-12.nc
cf = cat(1,cf,squeeze(nansum(nansum(nansum(reshape(frazil(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040c.csim.h.frazil_nh.2000-01_cat_2049-12.nc
cf = cat(1,cf,squeeze(nansum(nansum(nansum(reshape(frazil(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040c.csim.h.frazil_nh.2050-01_cat_2099-12.nc
cf = cat(1,cf,squeeze(nansum(nansum(nansum(reshape(frazil(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030c.csim.h.growb_nh.1900-01_cat_1949-12.nc growb
[nt nlat nlon] = size(growb);
cg = squeeze(nansum(nansum(nansum(reshape(growb(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2).*ca(30*12+1:80*12,:,:)/100,[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.030c.csim.h.growb_nh.1950-01_cat_1999-12.nc growb
cg = cat(1,cg,squeeze(nansum(nansum(nansum(reshape(growb(:,latt1:latt2,long1:long2).*ca(80*12+1:130*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040c.csim.h.growb_nh.2000-01_cat_2049-12.nc growb
cg = cat(1,cg,squeeze(nansum(nansum(nansum(reshape(growb(:,latt1:latt2,long1:long2).*ca(130*12+1:180*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040c.csim.h.growb_nh.2050-01_cat_2099-12.nc growb
cg = cat(1,cg,squeeze(nansum(nansum(nansum(reshape(growb(:,latt1:latt2,long1:long2).*ca(180*12+1:230*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030c.csim.h.meltb_nh.1900-01_cat_1949-12.nc meltb
[nt nlat nlon] = size(meltb);
cMB = squeeze(nansum(nansum(nansum(reshape(meltb(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2).*ca(30*12+1:80*12,:,:)/100,[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.030c.csim.h.meltb_nh.1950-01_cat_1999-12.nc meltb
cMB = cat(1,cMB,squeeze(nansum(nansum(nansum(reshape(meltb(:,latt1:latt2,long1:long2).*ca(80*12+1:130*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040c.csim.h.meltb_nh.2000-01_cat_2049-12.nc meltb
cMB = cat(1,cMB,squeeze(nansum(nansum(nansum(reshape(meltb(:,latt1:latt2,long1:long2).*ca(130*12+1:180*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040c.csim.h.meltb_nh.2050-01_cat_2099-12.nc meltb
cMB = cat(1,cMB,squeeze(nansum(nansum(nansum(reshape(meltb(:,latt1:latt2,long1:long2).*ca(180*12+1:230*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030c.csim.h.meltl_nh.1900-01_cat_1949-12.nc meltl
[nt nlat nlon] = size(meltl);
cML = squeeze(nansum(nansum(nansum(reshape(meltl(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2).*ca(30*12+1:80*12,:,:)/100,[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.030c.csim.h.meltl_nh.1950-01_cat_1999-12.nc meltl
cML = cat(1,cML,squeeze(nansum(nansum(nansum(reshape(meltl(:,latt1:latt2,long1:long2).*ca(80*12+1:130*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040c.csim.h.meltl_nh.2000-01_cat_2049-12.nc meltl
cML = cat(1,cML,squeeze(nansum(nansum(nansum(reshape(meltl(:,latt1:latt2,long1:long2).*ca(130*12+1:180*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040c.csim.h.meltl_nh.2050-01_cat_2099-12.nc meltl
cML = cat(1,cML,squeeze(nansum(nansum(nansum(reshape(meltl(:,latt1:latt2,long1:long2).*ca(180*12+1:230*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030c.csim.h.meltt_nh.1900-01_cat_1949-12.nc meltt
[nt nlat nlon] = size(meltt);
cMT = squeeze(nansum(nansum(nansum(reshape(meltt(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2).*ca(30*12+1:80*12,:,:)/100,[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.030c.csim.h.meltt_nh.1950-01_cat_1999-12.nc meltt
cMT = cat(1,cMT,squeeze(nansum(nansum(nansum(reshape(meltt(:,latt1:latt2,long1:long2).*ca(80*12+1:130*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040c.csim.h.meltt_nh.2000-01_cat_2049-12.nc meltt
cMT = cat(1,cMT,squeeze(nansum(nansum(nansum(reshape(meltt(:,latt1:latt2,long1:long2).*ca(130*12+1:180*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040c.csim.h.meltt_nh.2050-01_cat_2099-12.nc meltt
cMT = cat(1,cMT,squeeze(nansum(nansum(nansum(reshape(meltt(:,latt1:latt2,long1:long2).*ca(180*12+1:230*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

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

[nt nlat nlon] = size(ca);
HTEF = repmat(HTE(latt1fram:latt2fram,longfram),[1 1 nt]);
HTEF = permute(HTEF,[3 1 2]);
HTEBA = repmat(HTE(latt1barents:latt2barents,longbarents),[1 1 nt]);
HTEBA = permute(HTEBA,[3 1 2]);
HTEC = repmat(HTE(latt1CAA:latt2CAA,longCAA),[1 1 nt]);
HTEC = permute(HTEC,[3 1 2]);
HTNBE = repmat(HTN(lattbering,long1bering:long2bering),[1 1 nt]);
HTNBE = permute(HTNBE,[3 1 2]); 

[nt n] = size(cuF);
cFI = squeeze(nansum(nansum(reshape(cuF/100.*cF(30*12+1:end,:,:)/100.*chF.*HTEF(30*12+1:end,:,:),[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(cuBA);
cBAI = squeeze(nansum(nansum(reshape(cuBA/100.*cBA(30*12+1:end,:,:)/100.*chBA.*HTEBA(30*12+1:end,:,:),[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(cuC);
cCI = squeeze(nansum(nansum(reshape(cuC/100.*cC(30*12+1:end,:,:)/100.*chC.*HTEC(30*12+1:end,:,:),[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(cvBE);
cBEI = squeeze(nansum(nansum(reshape(squeeze(cvBE)/100.*squeeze(cBE(30*12+1:end,:,:))/100.*squeeze(chBE).*squeeze(HTNBE(30*12+1:end,:,:)),[12 nt/12 n]),3),1))*365/12*24*60*60;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% e
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030e.csim.h.aice.1870-01_cat_1999-12.nc aice HTE HTN tarea
[nt nlat nlon] = size(aice);
A = repmat(tarea,[1 1 nt]);
A = permute(A,[3 1 2]);
ea = aice(:,lat1:lat2,long1:long2);
e = nansum(nansum(aice(9:12:end,lat1:lat2,long1:long2).*A(1:130,lat1:lat2,long1:long2)/10^14,2),3);
eF = aice(:,lat1fram:lat2fram,longfram);
eBA = aice(:,lat1barents:lat2barents,longbarents);
eBE = aice(:,latbering,long1bering:long2bering);
eC = aice(:,lat1CAA:lat2CAA,longCAA);
ncload b30.040e.csim.h.aice.2000-01_cat_2099-12.nc aice
ea = cat(1,ea,aice(:,lat1:lat2,long1:long2));
e = cat(1,e,nansum(nansum(aice(9:12:end,lat1:lat2,long1:long2).*A(1:100,lat1:lat2,long1:long2)/10^14,2),3));
eF = cat(1,eF,aice(:,lat1fram:lat2fram,longfram));
eBA = cat(1,eBA,aice(:,lat1barents:lat2barents,longbarents));
eBE = cat(1,eBE,aice(:,latbering,long1bering:long2bering));
eC = cat(1,eC,aice(:,lat1CAA:lat2CAA,longCAA));

ncload b30.030e.csim.h.frazil.1870-01_cat_1999-12.nc frazil
[nt nlat nlon] = size(frazil);
ef = squeeze(nansum(nansum(nansum(reshape(frazil(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.040e.csim.h.frazil.2000-01_cat_2099-12.nc frazil
[nt nlat nlon] = size(frazil);
ef = cat(1,ef,squeeze(nansum(nansum(nansum(reshape(frazil(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030e.csim.h.growb.1870-01_cat_1999-12.nc
[nt nlat nlon] = size(growb);
eg = squeeze(nansum(nansum(nansum(reshape(growb(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2).*ea(1:130*12,:,:)/100,[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.040e.csim.h.growb.2000-01_cat_2099-12.nc
[nt nlat nlon] = size(growb);
eg = cat(1,eg,squeeze(nansum(nansum(nansum(reshape(growb(:,lat1:lat2,long1:long2).*ea(130*12+1:230*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030e.csim.h.meltb.1870-01_cat_1999-12.nc meltb
[nt nlat nlon] = size(meltb);
eMB = squeeze(nansum(nansum(nansum(reshape(meltb(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2).*ea(1:130*12,:,:)/100,[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.040e.csim.h.meltb.2000-01_cat_2099-12.nc meltb
[nt nlat nlon] = size(meltb);
eMB = cat(1,eMB,squeeze(nansum(nansum(nansum(reshape(meltb(:,lat1:lat2,long1:long2).*ea(130*12+1:230*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030e.csim.h.meltl.1870-01_cat_1999-12.nc meltl
[nt nlat nlon] = size(meltl);
eML = squeeze(nansum(nansum(nansum(reshape(meltl(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2).*ea(1:130*12,:,:)/100,[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.040e.csim.h.meltl.2000-01_cat_2099-12.nc meltl
[nt nlat nlon] = size(meltl);
eML = cat(1,eML,squeeze(nansum(nansum(nansum(reshape(meltl(:,lat1:lat2,long1:long2).*ea(130*12+1:230*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030e.csim.h.meltt.1870-01_cat_1999-12.nc meltt
[nt nlat nlon] = size(meltt);
eMT = squeeze(nansum(nansum(nansum(reshape(meltt(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2).*ea(1:130*12,:,:)/100,[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.040e.csim.h.meltt.2000-01_cat_2099-12.nc meltt
[nt nlat nlon] = size(meltt);
eMT = cat(1,eMT,squeeze(nansum(nansum(nansum(reshape(meltt(:,lat1:lat2,long1:long2).*ea(130*12+1:230*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030e.csim.h.hi.1870-01_cat_1999-12.nc hi
ehF = hi(:,lat1fram:lat2fram,longfram);
ehBA = hi(:,lat1barents:lat2barents,longbarents);
ehBE = hi(:,latbering,long1bering:long2bering);
ehC = hi(:,lat1CAA:lat2CAA,longCAA);
ncload b30.040e.csim.h.hi.2000-01_cat_2099-12.nc hi
ehF = cat(1,ehF,hi(:,lat1fram:lat2fram,longfram));
ehBA = cat(1,ehBA,hi(:,lat1barents:lat2barents,longbarents));
ehBE = cat(1,ehBE,hi(:,latbering,long1bering:long2bering));
ehC = cat(1,ehC,hi(:,lat1CAA:lat2CAA,longCAA));

ncload b30.030e.csim.h.u.1870-01_cat_1999-12.nc u
euF = u(:,lat1fram:lat2fram,longfram);
euBA = u(:,lat1barents:lat2barents,longbarents);
euC = u(:,lat1CAA:lat2CAA,longCAA);
ncload b30.040e.csim.h.u.2000-01_cat_2099-12.nc u
euF = cat(1,euF,u(:,lat1fram:lat2fram,longfram));
euBA = cat(1,euBA,u(:,lat1barents:lat2barents,longbarents));
euC = cat(1,euC,u(:,lat1CAA:lat2CAA,longCAA));
ncload b30.030e.csim.h.v.1870-01_cat_1999-12.nc v
evBE = v(:,latbering,long1bering:long2bering);
ncload b30.040e.csim.h.v.2000-01_cat_2099-12.nc v
evBE = cat(1,evBE,v(:,latbering,long1bering:long2bering));

[nt nlat nlon] = size(ea);
HTEF = repmat(HTE(latt1fram:latt2fram,longfram),[1 1 nt]);
HTEF = permute(HTEF,[3 1 2]);
HTEBA = repmat(HTE(latt1barents:latt2barents,longbarents),[1 1 nt]);
HTEBA = permute(HTEBA,[3 1 2]);
HTEC = repmat(HTE(latt1CAA:latt2CAA,longCAA),[1 1 nt]);
HTEC = permute(HTEC,[3 1 2]);
HTNBE = repmat(HTN(lattbering,long1bering:long2bering),[1 1 nt]);
HTNBE = permute(HTNBE,[3 1 2]); 

[nt n] = size(euF);
eFI = squeeze(nansum(nansum(reshape(euF/100.*eF/100.*ehF.*HTEF,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(euBA);
eBAI = squeeze(nansum(nansum(reshape(euBA/100.*eBA/100.*ehBA.*HTEBA,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(euC);
eCI = squeeze(nansum(nansum(reshape(euC/100.*eC/100.*ehC.*HTEC,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(evBE);
eBEI = squeeze(nansum(nansum(reshape(squeeze(evBE)/100.*squeeze(eBE)/100.*squeeze(ehBE).*squeeze(HTNBE),[12 nt/12 n]),3),1))*365/12*24*60*60;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% f.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030f.ES01.csim.h.aice.1870-01_cat_1999-12.nc aice HTE HTN tarea
[nt nlat nlon] = size(aice);
A = repmat(tarea,[1 1 nt]);
A = permute(A,[3 1 2]);
BA = aice(:,lat1:lat2,long1:long2);
f = nansum(nansum(aice(9:12:end,lat1:lat2,long1:long2).*A(1:130,lat1:lat2,long1:long2)/10^14,2),3);
fF = aice(:,lat1fram:lat2fram,longfram);
fBA = aice(:,lat1barents:lat2barents,longbarents);
fBE = aice(:,latbering,long1bering:long2bering);
fC = aice(:,lat1CAA:lat2CAA,longCAA);
ncload b30.040f.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
BA = cat(1,BA,aice(:,latt1:latt2,long1:long2));
f = cat(1,f,nansum(nansum(aice(9:12:end,latt1:latt2,long1:long2).*A(1:50,lat1:lat2,long1:long2)/10^14,2),3));
fF = cat(1,fF,aice(:,latt1fram:latt2fram,longfram));
fBA = cat(1,fBA,aice(:,latt1barents:latt2barents,longbarents));
fBE = cat(1,fBE,aice(:,lattbering,long1bering:long2bering));
fC = cat(1,fC,aice(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040f.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
BA = cat(1,BA,aice(:,latt1:latt2,long1:long2));
f = cat(1,f,nansum(nansum(aice(9:12:end,latt1:latt2,long1:long2).*A(1:50,lat1:lat2,long1:long2)/10^14,2),3));
fF = cat(1,fF,aice(:,latt1fram:latt2fram,longfram));
fBA = cat(1,fBA,aice(:,latt1barents:latt2barents,longbarents));
fBE = cat(1,fBE,aice(:,lattbering,long1bering:long2bering));
fC = cat(1,fC,aice(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030f.ES01.csim.h.frazil.1870-01_cat_1999-12.nc frazil
[nt nlat nlon] = size(frazil);
ff = squeeze(nansum(nansum(nansum(reshape(frazil(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.040f.ES01.csim.h.frazil_nh.2000-01_cat_2049-12.nc frazil
[nt nlat nlon] = size(frazil);
ff = cat(1,ff,squeeze(nansum(nansum(nansum(reshape(frazil(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040f.ES01.csim.h.frazil_nh.2050-01_cat_2099-12.nc frazil
ff = cat(1,ff,squeeze(nansum(nansum(nansum(reshape(frazil(:,latt1:latt2,long1:long2).*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030f.ES01.csim.h.growb.1870-01_cat_1999-12.nc growb
[nt nlat nlon] = size(growb);
fg = squeeze(nansum(nansum(nansum(reshape(growb(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2).*BA(1:130*12,:,:)/100,[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.040f.ES01.csim.h.growb_nh.2000-01_cat_2049-12.nc growb
[nt nlat nlon] = size(growb);
fg = cat(1,fg,squeeze(nansum(nansum(nansum(reshape(growb(:,latt1:latt2,long1:long2).*BA(130*12+1:180*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040f.ES01.csim.h.growb_nh.2050-01_cat_2099-12.nc growb
fg = cat(1,fg,squeeze(nansum(nansum(nansum(reshape(growb(:,latt1:latt2,long1:long2).*BA(180*12+1:230*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030f.ES01.csim.h.meltb.1870-01_cat_1999-12.nc meltb
[nt nlat nlon] = size(meltb);
fMB = squeeze(nansum(nansum(nansum(reshape(meltb(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2).*BA(1:130*12,:,:)/100,[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.040f.ES01.csim.h.meltb_nh.2000-01_cat_2049-12.nc meltb
[nt nlat nlon] = size(meltb);
fMB = cat(1,fMB,squeeze(nansum(nansum(nansum(reshape(meltb(:,latt1:latt2,long1:long2).*BA(130*12+1:180*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040f.ES01.csim.h.meltb_nh.2050-01_cat_2099-12.nc meltb
fMB = cat(1,fMB,squeeze(nansum(nansum(nansum(reshape(meltb(:,latt1:latt2,long1:long2).*BA(180*12+1:230*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030f.ES01.csim.h.meltl.1870-01_cat_1999-12.nc meltl
[nt nlat nlon] = size(meltl);
fML = squeeze(nansum(nansum(nansum(reshape(meltl(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2).*BA(1:130*12,:,:)/100,[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.040f.ES01.csim.h.meltl_nh.2000-01_cat_2049-12.nc meltl
[nt nlat nlon] = size(meltl);
fML = cat(1,fML,squeeze(nansum(nansum(nansum(reshape(meltl(:,latt1:latt2,long1:long2).*BA(130*12+1:180*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040f.ES01.csim.h.meltl_nh.2050-01_cat_2099-12.nc meltl
fML = cat(1,fML,squeeze(nansum(nansum(nansum(reshape(meltl(:,latt1:latt2,long1:long2).*BA(180*12+1:230*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030f.ES01.csim.h.meltt.1870-01_cat_1999-12.nc meltt
[nt nlat nlon] = size(meltt);
fMT = squeeze(nansum(nansum(nansum(reshape(meltt(:,lat1:lat2,long1:long2).*A(1:nt,lat1:lat2,long1:long2).*BA(1:130*12,:,:)/100,[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.040f.ES01.csim.h.meltt_nh.2000-01_cat_2049-12.nc meltt
[nt nlat nlon] = size(meltt);
fMT = cat(1,fMT,squeeze(nansum(nansum(nansum(reshape(meltt(:,latt1:latt2,long1:long2).*BA(130*12+1:180*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040f.ES01.csim.h.meltt_nh.2050-01_cat_2099-12.nc meltt
fMT = cat(1,fMT,squeeze(nansum(nansum(nansum(reshape(meltt(:,latt1:latt2,long1:long2).*BA(180*12+1:230*12,:,:)/100.*A(1:nt,lat1:lat2,long1:long2),[12 nt/12 lat2-lat1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030f.ES01.csim.h.hi.1870-01_cat_1999-12.nc hi 
fhF = hi(:,lat1fram:lat2fram,longfram);
fhBA = hi(:,lat1barents:lat2barents,longbarents);
fhBE = hi(:,latbering,long1bering:long2bering);
fhC = hi(:,lat1CAA:lat2CAA,longCAA);
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
fuF = u(:,lat1fram:lat2fram,longfram);
fuBA = u(:,lat1barents:lat2barents,longbarents);
fuC = u(:,lat1CAA:lat2CAA,longCAA);
ncload b30.040f.ES01.csim.h.u_nh.2000-01_cat_2049-12.nc u
fuF = cat(1,fuF,u(:,latt1fram:latt2fram,longfram));
fuBA = cat(1,fuBA,u(:,latt1barents:latt2barents,longbarents));
fuC = cat(1,fuC,u(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040f.ES01.csim.h.u_nh.2050-01_cat_2099-12.nc u
fuF = cat(1,fuF,u(:,latt1fram:latt2fram,longfram));
fuBA = cat(1,fuBA,u(:,latt1barents:latt2barents,longbarents));
fuC = cat(1,fuC,u(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030f.ES01.csim.h.v.1870-01_cat_1999-12.nc v
fvBE = v(:,latbering,long1bering:long2bering);
ncload b30.040f.ES01.csim.h.v_nh.2000-01_cat_2049-12.nc v
fvBE = cat(1,fvBE,v(:,lattbering,long1bering:long2bering));
ncload b30.040f.ES01.csim.h.v_nh.2050-01_cat_2099-12.nc v
fvBE = cat(1,fvBE,v(:,lattbering,long1bering:long2bering));

[nt nlat nlon] = size(BA);
HTEF = repmat(HTE(lat1fram:lat2fram,longfram),[1 1 nt]);
HTEF = permute(HTEF,[3 1 2]);
HTEBA = repmat(HTE(lat1barents:lat2barents,longbarents),[1 1 nt]);
HTEBA = permute(HTEBA,[3 1 2]);
HTEC = repmat(HTE(lat1CAA:lat2CAA,longCAA),[1 1 nt]);
HTEC = permute(HTEC,[3 1 2]);
HTNBE = repmat(HTN(latbering,long1bering:long2bering),[1 1 nt]);
HTNBE = permute(HTNBE,[3 1 2]); 

[nt n] = size(fuF);
fFI = squeeze(nansum(nansum(reshape(fuF/100.*fF/100.*fhF.*HTEF,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(fuBA);
fBAI = squeeze(nansum(nansum(reshape(fuBA/100.*fBA/100.*fhBA.*HTEBA,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(fuC);
fCI = squeeze(nansum(nansum(reshape(fuC/100.*fC/100.*fhC.*HTEC,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(fvBE);
fBEI = squeeze(nansum(nansum(reshape(squeeze(fvBE)/100.*squeeze(fBE)/100.*squeeze(fhBE).*squeeze(HTNBE),[12 nt/12 n]),3),1))*365/12*24*60*60;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% g.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030g.ES01.csim.h.aice_nh.1900-01_cat_1949-12.nc aice HTE HTN tarea
[nt nlat nlon] = size(aice);
A = repmat(tarea,[1 1 nt]);
A = permute(A,[3 1 2]);
ga = aice(:,latt1:latt2,long1:long2);
g = nansum(nansum(aice(9:12:end,latt1:latt2,long1:long2).*A(1:nt/12,latt1:latt2,long1:long2)/10^14,2),3);
gF = aice(:,latt1fram:latt2fram,longfram);
gBA = aice(:,latt1barents:latt2barents,longbarents);
gBE = aice(:,lattbering,long1bering:long2bering);
gC = aice(:,latt1CAA:latt2CAA,longCAA);
ncload b30.030g.ES01.csim.h.aice_nh.1950-01_cat_1999-12.nc aice
ga = cat(1,ga,aice(:,latt1:latt2,long1:long2));
g = cat(1,g,nansum(nansum(aice(9:12:end,latt1:latt2,long1:long2).*A(1:50,latt1:latt2,long1:long2)/10^14,2),3));
gF = cat(1,gF,aice(:,latt1fram:latt2fram,longfram));
gBA = cat(1,gBA,aice(:,latt1barents:latt2barents,longbarents));
gBE = cat(1,gBE,aice(:,lattbering,long1bering:long2bering));
gC = cat(1,gC,aice(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040g.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
ga = cat(1,ga,aice(:,latt1:latt2,long1:long2));
g = cat(1,g,nansum(nansum(aice(9:12:end,latt1:latt2,long1:long2).*A(1:50,latt1:latt2,long1:long2)/10^14,2),3));
gF = cat(1,gF,aice(:,latt1fram:latt2fram,longfram));
gBA = cat(1,gBA,aice(:,latt1barents:latt2barents,longbarents));
gBE = cat(1,gBE,aice(:,lattbering,long1bering:long2bering));
gC = cat(1,gC,aice(:,latt1CAA:latt2CAA,longCAA));
ncload b30.040g.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
ga = cat(1,ga,aice(:,latt1:latt2,long1:long2));
g = cat(1,g,nansum(nansum(aice(9:12:end,latt1:latt2,long1:long2).*A(1:50,latt1:latt2,long1:long2)/10^14,2),3));
gF = cat(1,gF,aice(:,latt1fram:latt2fram,longfram));
gBA = cat(1,gBA,aice(:,latt1barents:latt2barents,longbarents));
gBE = cat(1,gBE,aice(:,lattbering,long1bering:long2bering));
gC = cat(1,gC,aice(:,latt1CAA:latt2CAA,longCAA));

ncload b30.030g.ES01.csim.h.frazil_nh.1900-01_cat_1949-12.nc
[nt nlat nlon] = size(frazil);
gf = squeeze(nansum(nansum(nansum(reshape(frazil(:,latt1:latt2,long1:long2).*A(1:nt,latt1:latt2,long1:long2),[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.030g.ES01.csim.h.frazil_nh.1950-01_cat_1999-12.nc
gf = cat(1,gf,squeeze(nansum(nansum(nansum(reshape(frazil(:,latt1:latt2,long1:long2).*A(1:nt,latt1:latt2,long1:long2),[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040g.ES01.csim.h.frazil_nh.2000-01_cat_2049-12.nc
gf = cat(1,gf,squeeze(nansum(nansum(nansum(reshape(frazil(:,latt1:latt2,long1:long2).*A(1:nt,latt1:latt2,long1:long2),[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040g.ES01.csim.h.frazil_nh.2050-01_cat_2099-12.nc
gf = cat(1,gf,squeeze(nansum(nansum(nansum(reshape(frazil(:,latt1:latt2,long1:long2).*A(1:nt,latt1:latt2,long1:long2),[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030g.ES01.csim.h.growb_nh.1900-01_cat_1949-12.nc growb
[nt nlat nlon] = size(growb);
gg = squeeze(nansum(nansum(nansum(reshape(growb(:,latt1:latt2,long1:long2).*A(1:nt,latt1:latt2,long1:long2).*ga(1:50*12,:,:)/100,[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.030g.ES01.csim.h.growb_nh.1950-01_cat_1999-12.nc growb
gg = cat(1,gg,squeeze(nansum(nansum(nansum(reshape(growb(:,latt1:latt2,long1:long2).*ga(50*12+1:100*12,:,:)/100.*A(1:nt,latt1:latt2,long1:long2),[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040g.ES01.csim.h.growb_nh.2000-01_cat_2049-12.nc growb
gg = cat(1,gg,squeeze(nansum(nansum(nansum(reshape(growb(:,latt1:latt2,long1:long2).*ga(100*12+1:150*12,:,:)/100.*A(1:nt,latt1:latt2,long1:long2),[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040g.ES01.csim.h.growb_nh.2050-01_cat_2099-12.nc growb
gg = cat(1,gg,squeeze(nansum(nansum(nansum(reshape(growb(:,latt1:latt2,long1:long2).*ga(150*12+1:200*12,:,:)/100.*A(1:nt,latt1:latt2,long1:long2),[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030g.ES01.csim.h.meltb_nh.1900-01_cat_1949-12.nc meltb
[nt nlat nlon] = size(meltb);
gMB = squeeze(nansum(nansum(nansum(reshape(meltb(:,latt1:latt2,long1:long2).*A(1:nt,latt1:latt2,long1:long2).*ga(1:50*12,:,:)/100,[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.030g.ES01.csim.h.meltb_nh.1950-01_cat_1999-12.nc meltb
gMB = cat(1,gMB,squeeze(nansum(nansum(nansum(reshape(meltb(:,latt1:latt2,long1:long2).*ga(50*12+1:100*12,:,:)/100.*A(1:nt,latt1:latt2,long1:long2),[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040g.ES01.csim.h.meltb_nh.2000-01_cat_2049-12.nc meltb
gMB = cat(1,gMB,squeeze(nansum(nansum(nansum(reshape(meltb(:,latt1:latt2,long1:long2).*ga(100*12+1:150*12,:,:)/100.*A(1:nt,latt1:latt2,long1:long2),[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040g.ES01.csim.h.meltb_nh.2050-01_cat_2099-12.nc meltb
gMB = cat(1,gMB,squeeze(nansum(nansum(nansum(reshape(meltb(:,latt1:latt2,long1:long2).*ga(150*12+1:200*12,:,:)/100.*A(1:nt,latt1:latt2,long1:long2),[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030g.ES01.csim.h.meltl_nh.1900-01_cat_1949-12.nc meltl
[nt nlat nlon] = size(meltl);
gML = squeeze(nansum(nansum(nansum(reshape(meltl(:,latt1:latt2,long1:long2).*A(1:nt,latt1:latt2,long1:long2).*ga(1:50*12,:,:)/100,[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.030g.ES01.csim.h.meltl_nh.1950-01_cat_1999-12.nc meltl
gML = cat(1,gML,squeeze(nansum(nansum(nansum(reshape(meltl(:,latt1:latt2,long1:long2).*ga(50*12+1:100*12,:,:)/100.*A(1:nt,latt1:latt2,long1:long2),[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040g.ES01.csim.h.meltl_nh.2000-01_cat_2049-12.nc meltl
gML = cat(1,gML,squeeze(nansum(nansum(nansum(reshape(meltl(:,latt1:latt2,long1:long2).*ga(100*12+1:150*12,:,:)/100.*A(1:nt,latt1:latt2,long1:long2),[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040g.ES01.csim.h.meltl_nh.2050-01_cat_2099-12.nc meltl
gML = cat(1,gML,squeeze(nansum(nansum(nansum(reshape(meltl(:,latt1:latt2,long1:long2).*ga(150*12+1:200*12,:,:)/100.*A(1:nt,latt1:latt2,long1:long2),[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

ncload b30.030g.ES01.csim.h.meltt_nh.1900-01_cat_1949-12.nc meltt
[nt nlat nlon] = size(meltt);
gMT = squeeze(nansum(nansum(nansum(reshape(meltt(:,latt1:latt2,long1:long2).*A(1:nt,latt1:latt2,long1:long2).*ga(1:50*12,:,:)/100,[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)';
ncload b30.030g.ES01.csim.h.meltt_nh.1950-01_cat_1999-12.nc meltt
gMT = cat(1,gMT,squeeze(nansum(nansum(nansum(reshape(meltt(:,latt1:latt2,long1:long2).*ga(50*12+1:100*12,:,:)/100.*A(1:nt,latt1:latt2,long1:long2),[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040g.ES01.csim.h.meltt_nh.2000-01_cat_2049-12.nc meltt
gMT = cat(1,gMT,squeeze(nansum(nansum(nansum(reshape(meltt(:,latt1:latt2,long1:long2).*ga(100*12+1:150*12,:,:)/100.*A(1:nt,latt1:latt2,long1:long2),[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)');
ncload b30.040g.ES01.csim.h.meltt_nh.2050-01_cat_2099-12.nc meltt
gMT = cat(1,gMT,squeeze(nansum(nansum(nansum(reshape(meltt(:,latt1:latt2,long1:long2).*ga(150*12+1:200*12,:,:)/100.*A(1:nt,latt1:latt2,long1:long2),[12 nt/12 latt2-latt1+1 long2-long1+1 ])/100,4),3),1)*365/12)');

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

[nt nlat nlon] = size(ga);
HTEF = repmat(HTE(latt1fram:latt2fram,longfram),[1 1 nt]);
HTEF = permute(HTEF,[3 1 2]);
HTEBA = repmat(HTE(latt1barents:latt2barents,longbarents),[1 1 nt]);
HTEBA = permute(HTEBA,[3 1 2]);
HTEC = repmat(HTE(latt1CAA:latt2CAA,longCAA),[1 1 nt]);
HTEC = permute(HTEC,[3 1 2]);
HTNBE = repmat(HTN(lattbering,long1bering:long2bering),[1 1 nt]);
HTNBE = permute(HTNBE,[3 1 2]); 

[nt n] = size(guF);
gFI = squeeze(nansum(nansum(reshape(guF/100.*gF/100.*ghF.*HTEF,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(guBA);
gBAI = squeeze(nansum(nansum(reshape(guBA/100.*gBA/100.*ghBA.*HTEBA,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(guC);
gCI = squeeze(nansum(nansum(reshape(guC/100.*gC/100.*ghC.*HTEC,[12 nt/12 n]),3),1))*365/12*24*60*60;

[nt n] = size(gvBE);
gBEI = squeeze(nansum(nansum(reshape(squeeze(gvBE)/100.*squeeze(gBE)/100.*squeeze(ghBE).*squeeze(HTNBE),[12 nt/12 n]),3),1))*365/12*24*60*60;

save IceProc.mat

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Graph

clear
load IceProc.mat

x1 = (1900:2099);
x2 = (1870:2099);

subplot(3,2,1)
area([2035 2043], [15^12 15^12],'FaceColor', [.7 .7 .7],'Linestyle','none');
hold on
plot(x1,ag+af,x1,aMB+aML+aMT,x1,-(aFI+aBAI+aCI+aBEI))
title('a')
xlim([1900 2100])
ylim([0 1.5]*10^13)

subplot(3,2,2)
area([2025 2034], [15^12 15^12],'FaceColor', [.7 .7 .7],'Linestyle','none');
hold on
plot(x2,bg+bf,x2,bMB+bML+bMT,x2,-(bFI+bBAI+bCI+bBEI))
title('b.ES01')
xlim([1900 2100])
ylim([0 1.5]*10^13)

subplot(3,2,3)
area([2031 2035], [15^12 15^12],'FaceColor', [.7 .7 .7],'Linestyle','none');
hold on
plot(x1,cg+cf,x1,cMB+cML+cMT,x1,-(cFI+cBAI+cCI+cBEI))
title('c')
xlim([1900 2100])
ylim([0 1.5]*10^13)

subplot(3,2,4)
plot(x2,eg+ef,x2,eMB+eML+eMT,x2,-(eFI+eBAI+eCI+eBEI))
title('e')
xlim([1900 2100])
ylim([0 1.5]*10^13)

subplot(3,2,5)
area([2012 2017], [15^12 15^12],'FaceColor', [.7 .7 .7],'Linestyle','none');
hold on
area([2044 2049], [15^12 15^12],'FaceColor', [.7 .7 .7],'Linestyle','none');
plot(x2,fg+ff,x2,fMB+fML+fMT,x2,-(fFI+fBAI+fCI+fBEI))
title('f.ES01')
xlim([1900 2100])
ylim([0 1.5]*10^13)

subplot(3,2,6)
area([2000 2006], [15^12 15^12],'FaceColor', [.7 .7 .7],'Linestyle','none');
hold on
area([2025 2032], [15^12 15^12],'FaceColor', [.7 .7 .7],'Linestyle','none');
area([2042 2048], [15^12 15^12],'FaceColor', [.7 .7 .7],'Linestyle','none');
plot(x1,gg+gf,x1,gMB+gML+gMT,x1,-(gFI+gBAI+gCI+gBEI))
title('g.ES01')
xlim([1900 2100])
ylim([0 1.5]*10^13)

print('IceProc','-djpeg')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
load IceProc.mat

x1 = (1900:2099);
x2 = (1870:2099);

subplot(3,2,1)
area([2035 2043], [15^12 15^12],'FaceColor', [.7 .7 .7],'Linestyle','none');
hold on
plot(x1,ag,x1,af)
title('a')
xlim([1900 2100])
ylim([0 1.5]*10^13)

subplot(3,2,2)
area([2025 2034], [15^12 15^12],'FaceColor', [.7 .7 .7],'Linestyle','none');
hold on
plot(x2,bg,x2,bf)
title('b.ES01')
xlim([1900 2100])
ylim([0 1.5]*10^13)

subplot(3,2,3)
area([2031 2035], [15^12 15^12],'FaceColor', [.7 .7 .7],'Linestyle','none');
hold on
plot(x1,cg,x1,cf)
title('c')
xlim([1900 2100])
ylim([0 1.5]*10^13)

subplot(3,2,4)
plot(x2,eg,x2,ef)
title('e')
xlim([1900 2100])
ylim([0 1.5]*10^13)

subplot(3,2,5)
area([2012 2017], [15^12 15^12],'FaceColor', [.7 .7 .7],'Linestyle','none');
hold on
area([2044 2049], [15^12 15^12],'FaceColor', [.7 .7 .7],'Linestyle','none');
plot(x2,fg,x2,ff)
title('f.ES01')
xlim([1900 2100])
ylim([0 1.5]*10^13)

subplot(3,2,6)
area([2000 2006], [15^12 15^12],'FaceColor', [.7 .7 .7],'Linestyle','none');
hold on
area([2025 2032], [15^12 15^12],'FaceColor', [.7 .7 .7],'Linestyle','none');
area([2042 2048], [15^12 15^12],'FaceColor', [.7 .7 .7],'Linestyle','none');
plot(x1,gg,x1,gf)
title('g.ES01')
xlim([1900 2100])
ylim([0 1.5]*10^13)

print('FrazBasal','-djpeg')




