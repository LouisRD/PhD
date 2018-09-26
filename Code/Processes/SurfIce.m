%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ice Surface fluxes: Fswdn, Flwdn, Flwout, albsni, aice
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ncload b30.030a.csim.h.aice.1870-01_cat_1999-12.nc aice
%aa = aice(1+30*12:end,lat1:lat2,long1:long2);
%ncload b30.040a.csim.h.aice.2000-01_cat_2099-12.nc aice
%aa = cat(1,aa,aice(:,lat1:lat2,long1:long2));

%ncload b30.030a.csim.h.albsni.1870-01_cat_1999-12.nc albsni
%alba = albsni(1+30*12:end,lat1:lat2,long1:long2);
%ncload b30.040a.csim.h.albsni.2000-01_cat_2099-12.nc albsni
%alba = cat(1,alba,albsni(:,lat1:lat2,long1:long2));

ncload b30.030a.csim.h.Flwdn.1870-01_cat_1999-12.nc Flwdn
lwda = Flwdn(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Flwdn.2000-01_cat_2099-12.nc Flwdn
lwda = cat(1,lwda,Flwdn(:,lat1:lat2,long1:long2));

ncload b30.030a.csim.h.Flwout.1870-01_cat_1999-12.nc Flwout
lwoa = Flwout(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Flwout.2000-01_cat_2099-12.nc Flwout
lwoa = cat(1,lwoa,Flwout(:,lat1:lat2,long1:long2));

ncload b30.030a.csim.h.Fswdn.1870-01_cat_1999-12.nc Fswdn
swa = Fswdn(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Fswdn.2000-01_cat_2099-12.nc Fswdn
swa = cat(1,swa,Fswdn(:,lat1:lat2,long1:long2));

ncload b30.030a.csim.h.Flat.1870-01_cat_1999-12.nc Flat
lata = Flat(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Flat.2000-01_cat_2099-12.nc Flat
lata = cat(1,lata,Flat(:,lat1:lat2,long1:long2));

ncload b30.030a.csim.h.Fsens.1870-01_cat_1999-12.nc Fsens
sena = Fsens(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Fsens.2000-01_cat_2099-12.nc Fsens
sena = cat(1,sena,Fsens(:,lat1:lat2,long1:long2));

ncload b30.030a.csim.h.Fswabs.1870-01_cat_1999-12.nc Fswabs
swaa = Fswabs(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Fswabs.2000-01_cat_2099-12.nc Fswabs
swaa = cat(1,swaa,Fswabs(:,lat1:lat2,long1:long2));
%%%%%%%
ncload b30.030a.csim.h.Flwdn_aice.1870-01_cat_1999-12.nc Flwdn
lwdaA = Flwdn(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Flwdn_aice.2000-01_cat_2099-12.nc Flwdn
lwdaA = cat(1,lwdaA,Flwdn(:,lat1:lat2,long1:long2));

ncload b30.030a.csim.h.Flwout_aice.1870-01_cat_1999-12.nc Flwout
lwoaA = Flwout(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Flwout_aice.2000-01_cat_2099-12.nc Flwout
lwoaA = cat(1,lwoaA,Flwout(:,lat1:lat2,long1:long2));

ncload b30.030a.csim.h.Fswdn_aice.1870-01_cat_1999-12.nc Fswdn
swaA = Fswdn(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Fswdn_aice.2000-01_cat_2099-12.nc Fswdn
swaA = cat(1,swaA,Fswdn(:,lat1:lat2,long1:long2));

ncload b30.030a.csim.h.Flat_aice.1870-01_cat_1999-12.nc Flat
lataA = Flat(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Flat_aice.2000-01_cat_2099-12.nc Flat
lataA = cat(1,lataA,Flat(:,lat1:lat2,long1:long2));

ncload b30.030a.csim.h.Fsens_aice.1870-01_cat_1999-12.nc Fsens
senaA = Fsens(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Fsens_aice.2000-01_cat_2099-12.nc Fsens
senaA = cat(1,senaA,Fsens(:,lat1:lat2,long1:long2));

ncload b30.030a.csim.h.Fswabs_aice.1870-01_cat_1999-12.nc Fswabs
swaaA = Fswabs(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Fswabs_aice.2000-01_cat_2099-12.nc Fswabs
swaaA = cat(1,swaaA,Fswabs(:,lat1:lat2,long1:long2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% b.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ncload b30.030b.ES01.csim.h.aice_nh.1900-01_cat_1949-12.nc aice
ab = aice(:,latt1:latt2,long1:long2);
ncload b30.030b.ES01.csim.h.aice_nh.1950-01_cat_1999-12.nc aice
ab = cat(1,ab,aice(:,latt1:latt2,long1:long2));
ncload b30.040b.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
ab = cat(1,ab,aice(:,latt1:latt2,long1:long2));
ncload b30.040b.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
ab = cat(1,ab,aice(:,latt1:latt2,long1:long2));

ncload b30.030b.ES01.csim.h.albsni.1870-01_cat_1999-12.nc albsni
albb = albsni(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.albsni_nh.2000-01_cat_2049-12.nc albsni
albb = cat(1,albb,albsni(:,latt1:latt2,long1:long2));
ncload b30.040b.ES01.csim.h.albsni_nh.2050-01_cat_2099-12.nc albsni
albb = cat(1,albb,albsni(:,latt1:latt2,long1:long2));

ncload b30.030b.ES01.csim.h.Flwdn.1870-01_cat_1999-12.nc Flwdn
lwdb = Flwdn(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.Flwdn_nh.2000-01_cat_2049-12.nc Flwdn
lwdb = cat(1,lwdb,Flwdn(:,latt1:latt2,long1:long2));
ncload b30.040b.ES01.csim.h.Flwdn_nh.2050-01_cat_2099-12.nc Flwdn
lwdb = cat(1,lwdb,Flwdn(:,latt1:latt2,long1:long2));

ncload b30.030b.ES01.csim.h.Flwout.1870-01_cat_1999-12.nc Flwout
lwob = Flwout(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.Flwout_nh.2000-01_cat_2049-12.nc Flwout
lwob = cat(1,lwob,Flwout(:,latt1:latt2,long1:long2));
ncload b30.040b.ES01.csim.h.Flwout_nh.2050-01_cat_2099-12.nc Flwout
lwob = cat(1,lwob,Flwout(:,latt1:latt2,long1:long2));

ncload b30.030b.ES01.csim.h.Fswdn.1870-01_cat_1999-12.nc Fswdn
swb = Fswdn(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.Fswdn_nh.2000-01_cat_2049-12.nc Fswdn
swb = cat(1,swb,Fswdn(:,latt1:latt2,long1:long2));
ncload b30.040b.ES01.csim.h.Fswdn_nh.2050-01_cat_2099-12.nc Fswdn
swb = cat(1,swb,Fswdn(:,latt1:latt2,long1:long2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% c
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ncload b30.030c.csim.h.aice_nh.1900-01_cat_1949-12.nc aice
ac = aice(:,latt1:latt2,long1:long2);
ncload b30.030c.csim.h.aice_nh.1950-01_cat_1999-12.nc aice
ac = cat(1,ac,aice(:,latt1:latt2,long1:long2));
ncload b30.040c.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
ac = cat(1,ac,aice(:,latt1:latt2,long1:long2));
ncload b30.040c.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
ac = cat(1,ac,aice(:,latt1:latt2,long1:long2));

ncload b30.030c.csim.h.albsni.1870-01_cat_1999-12.nc albsni
albc = albsni(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040c.csim.h.albsni_nh.2000-01_cat_2049-12.nc albsni
albc = cat(1,albc,albsni(:,latt1:latt2,long1:long2));
ncload b30.040c.csim.h.albsni_nh.2050-01_cat_2099-12.nc albsni
albc = cat(1,albc,albsni(:,latt1:latt2,long1:long2));

ncload b30.030c.csim.h.Flwdn.1870-01_cat_1999-12.nc Flwdn
lwdc = Flwdn(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040c.csim.h.Flwdn_nh.2000-01_cat_2049-12.nc Flwdn
lwdc = cat(1,lwdc,Flwdn(:,latt1:latt2,long1:long2));
ncload b30.040c.csim.h.Flwdn_nh.2050-01_cat_2099-12.nc Flwdn
lwdc = cat(1,lwdc,Flwdn(:,latt1:latt2,long1:long2));

ncload b30.030c.csim.h.Flwout.1870-01_cat_1999-12.nc Flwout
lwoc = Flwout(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040c.csim.h.Flwout_nh.2000-01_cat_2049-12.nc Flwout
lwoc = cat(1,lwoc,Flwout(:,latt1:latt2,long1:long2));
ncload b30.040c.csim.h.Flwout_nh.2050-01_cat_2099-12.nc Flwout
lwoc = cat(1,lwoc,Flwout(:,latt1:latt2,long1:long2));

ncload b30.030c.csim.h.Fswdn.1870-01_cat_1999-12.nc Fswdn
swc = Fswdn(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040c.csim.h.Fswdn_nh.2000-01_cat_2049-12.nc Fswdn
swc = cat(1,swc,Fswdn(:,latt1:latt2,long1:long2));
ncload b30.040c.csim.h.Fswdn_nh.2050-01_cat_2099-12.nc Fswdn
swc = cat(1,swc,Fswdn(:,latt1:latt2,long1:long2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% e
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ncload b30.030e.csim.h.aice.1870-01_cat_1999-12.nc aice
ae = aice(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.aice.2000-01_cat_2099-12.nc aice
ae = cat(1,ae,aice(:,lat1:lat2,long1:long2));

ncload b30.030e.csim.h.albsni.1870-01_cat_1999-12.nc albsni
albe = albsni(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.albsni.2000-01_cat_2099-12.nc albsni
albe = cat(1,albe,albsni(:,lat1:lat2,long1:long2));

ncload b30.030e.csim.h.Flwdn.1870-01_cat_1999-12.nc Flwdn
lwde = Flwdn(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.Flwdn.2000-01_cat_2099-12.nc Flwdn
lwde = cat(1,lwde,Flwdn(:,lat1:lat2,long1:long2));

ncload b30.030e.csim.h.Flwout.1870-01_cat_1999-12.nc Flwout
lwoe = Flwout(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.Flwout.2000-01_cat_2099-12.nc Flwout
lwoe = cat(1,lwoe,Flwout(:,lat1:lat2,long1:long2));

ncload b30.030e.csim.h.Fswdn.1870-01_cat_1999-12.nc Fswdn
swe = Fswdn(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.Fswdn.2000-01_cat_2099-12.nc Fswdn
swe = cat(1,swe,Fswdn(:,lat1:lat2,long1:long2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% f.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ncload b30.030f.ES01.csim.h.aice.1870-01_cat_1999-12.nc aice
af = aice(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
af = cat(1,af,aice(:,latt1:latt2,long1:long2));
ncload b30.040f.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
af = cat(1,af,aice(:,latt1:latt2,long1:long2));

ncload b30.030f.ES01.csim.h.albsni.1870-01_cat_1999-12.nc albsni
albf = albsni(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.albsni_nh.2000-01_cat_2049-12.nc albsni
albf = cat(1,albf,albsni(:,latt1:latt2,long1:long2));
ncload b30.040f.ES01.csim.h.albsni_nh.2050-01_cat_2099-12.nc albsni
albf = cat(1,albf,albsni(:,latt1:latt2,long1:long2));

ncload b30.030f.ES01.csim.h.Flwdn.1870-01_cat_1999-12.nc Flwdn
lwdf = Flwdn(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.Flwdn_nh.2000-01_cat_2049-12.nc Flwdn
lwdf = cat(1,lwdf,Flwdn(:,latt1:latt2,long1:long2));
ncload b30.040f.ES01.csim.h.Flwdn_nh.2050-01_cat_2099-12.nc Flwdn
lwdf = cat(1,lwdf,Flwdn(:,latt1:latt2,long1:long2));

ncload b30.030f.ES01.csim.h.Flwout.1870-01_cat_1999-12.nc Flwout
lwof = Flwout(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.Flwout_nh.2000-01_cat_2049-12.nc Flwout
lwof = cat(1,lwof,Flwout(:,latt1:latt2,long1:long2));
ncload b30.040f.ES01.csim.h.Flwout_nh.2050-01_cat_2099-12.nc Flwout
lwof = cat(1,lwof,Flwout(:,latt1:latt2,long1:long2));

ncload b30.030f.ES01.csim.h.Fswdn.1870-01_cat_1999-12.nc Fswdn
swf = Fswdn(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.Fswdn_nh.2000-01_cat_2049-12.nc Fswdn
swf = cat(1,swf,Fswdn(:,latt1:latt2,long1:long2));
ncload b30.040f.ES01.csim.h.Fswdn_nh.2050-01_cat_2099-12.nc Fswdn
swf = cat(1,swf,Fswdn(:,latt1:latt2,long1:long2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% g.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ncload b30.030g.ES01.csim.h.aice_nh.1900-01_cat_1949-12.nc aice
ag = aice(:,latt1:latt2,long1:long2);
ncload b30.030g.ES01.csim.h.aice_nh.1950-01_cat_1999-12.nc aice
ag = cat(1,ag,aice(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
ag = cat(1,ag,aice(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
ag = cat(1,ag,aice(:,latt1:latt2,long1:long2));

ncload b30.030g.ES01.csim.h.albsni_nh.1900-01_cat_1949-12.nc albsni
albg = albsni(:,latt1:latt2,long1:long2);
ncload b30.030g.ES01.csim.h.albsni_nh.1950-01_cat_1999-12.nc albsni
albg = cat(1,albg,albsni(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.albsni_nh.2000-01_cat_2049-12.nc albsni
albg = cat(1,albg,albsni(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.albsni_nh.2050-01_cat_2099-12.nc albsni
albg = cat(1,albg,albsni(:,latt1:latt2,long1:long2));

ncload b30.030g.ES01.csim.h.Flwdn_nh.1900-01_cat_1949-12.nc Flwdn
lwdg = Flwdn(:,latt1:latt2,long1:long2);
ncload b30.030g.ES01.csim.h.Flwdn_nh.1950-01_cat_1999-12.nc Flwdn
lwdg = cat(1,lwdg,Flwdn(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.Flwdn_nh.2000-01_cat_2049-12.nc Flwdn
lwdg = cat(1,lwdg,Flwdn(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.Flwdn_nh.2050-01_cat_2099-12.nc Flwdn
lwdg = cat(1,lwdg,Flwdn(:,latt1:latt2,long1:long2));

ncload b30.030g.ES01.csim.h.Flwout_nh.1900-01_cat_1949-12.nc Flwout
lwog = Flwout(:,latt1:latt2,long1:long2);
ncload b30.030g.ES01.csim.h.Flwout_nh.1950-01_cat_1999-12.nc Flwout
lwog = cat(1,lwog,Flwout(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.Flwout_nh.2000-01_cat_2049-12.nc Flwout
lwog = cat(1,lwog,Flwout(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.Flwout_nh.2050-01_cat_2099-12.nc Flwout
lwog = cat(1,lwog,Flwout(:,latt1:latt2,long1:long2));

ncload b30.030g.ES01.csim.h.Fswdn_nh.1900-01_cat_1949-12.nc Fswdn
swg = Fswdn(:,latt1:latt2,long1:long2);
ncload b30.030g.ES01.csim.h.Fswdn_nh.1950-01_cat_1999-12.nc Fswdn
swg = cat(1,swg,Fswdn(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.Fswdn_nh.2000-01_cat_2049-12.nc Fswdn
swg = cat(1,swg,Fswdn(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.Fswdn_nh.2050-01_cat_2099-12.nc Fswdn
swg = cat(1,swg,Fswdn(:,latt1:latt2,long1:long2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clearvars Flwdn Flwout Fswdn aice albsni 
save SurfIce.mat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
