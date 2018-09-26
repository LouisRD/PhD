%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ice Surface fluxes: Fswdn, Flwdn, Flwout, Flat, Fsens
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

ncload b30.030a.csim.h.Fswabs.1870-01_cat_1999-12.nc Fswabs
swAa = Fswabs(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Fswabs.2000-01_cat_2099-12.nc Fswabs
swAa = cat(1,swAa,Fswabs(:,lat1:lat2,long1:long2));

ncload b30.030a.csim.h.Flat.1870-01_cat_1999-12.nc Flat
lata = Flat(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Flat.2000-01_cat_2099-12.nc Flat
lata = cat(1,lata,Flat(:,lat1:lat2,long1:long2));

ncload b30.030a.csim.h.Fsens.1870-01_cat_1999-12.nc Fsens
sena = Fsens(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Fsens.2000-01_cat_2099-12.nc Fsens
sena = cat(1,sena,Fsens(:,lat1:lat2,long1:long2));

clearvars Flwdn Flwout Fswdn Flat Fsens Fswabs


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% b.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

ncload b30.030b.ES01.csim.h.Fswabs.1870-01_cat_1999-12.nc Fswabs
swAb = Fswabs(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.Fswabs_nh.2000-01_cat_2049-12.nc Fswabs
swAb = cat(1,swAb,Fswabs(:,latt1:latt2,long1:long2));
ncload b30.040b.ES01.csim.h.Fswabs_nh.2050-01_cat_2099-12.nc Fswabs
swAb = cat(1,swAb,Fswabs(:,latt1:latt2,long1:long2));

ncload b30.030b.ES01.csim.h.Flat.1870-01_cat_1999-12.nc Flat
latb = Flat(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.Flat_nh.2000-01_cat_2049-12.nc Flat
latb = cat(1,latb,Flat(:,latt1:latt2,long1:long2));
ncload b30.040b.ES01.csim.h.Flat_nh.2050-01_cat_2099-12.nc Flat
latb = cat(1,latb,Flat(:,latt1:latt2,long1:long2));

ncload b30.030b.ES01.csim.h.Fsens.1870-01_cat_1999-12.nc Fsens
senb = Fsens(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.Fsens_nh.2000-01_cat_2049-12.nc Fsens
senb = cat(1,senb,Fsens(:,latt1:latt2,long1:long2));
ncload b30.040b.ES01.csim.h.Fsens_nh.2050-01_cat_2099-12.nc Fsens
senb = cat(1,senb,Fsens(:,latt1:latt2,long1:long2));

clearvars Flwdn Flwout Fswdn Flat Fsens Fswabs

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% c
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

ncload b30.030c.csim.h.Fswabs.1870-01_cat_1999-12.nc Fswabs
swAc = Fswabs(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040c.csim.h.Fswabs_nh.2000-01_cat_2049-12.nc Fswabs
swAc = cat(1,swAc,Fswabs(:,latt1:latt2,long1:long2));
ncload b30.040c.csim.h.Fswabs_nh.2050-01_cat_2099-12.nc Fswabs
swAc = cat(1,swAc,Fswabs(:,latt1:latt2,long1:long2));

ncload b30.030c.csim.h.Flat.1870-01_cat_1999-12.nc Flat
latc = Flat(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040c.csim.h.Flat_nh.2000-01_cat_2049-12.nc Flat
latc = cat(1,latc,Flat(:,latt1:latt2,long1:long2));
ncload b30.040c.csim.h.Flat_nh.2050-01_cat_2099-12.nc Flat
latc = cat(1,latc,Flat(:,latt1:latt2,long1:long2));

ncload b30.030c.csim.h.Fsens.1870-01_cat_1999-12.nc Fsens
senc = Fsens(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040c.csim.h.Fsens_nh.2000-01_cat_2049-12.nc Fsens
senc = cat(1,senc,Fsens(:,latt1:latt2,long1:long2));
ncload b30.040c.csim.h.Fsens_nh.2050-01_cat_2099-12.nc Fsens
senc = cat(1,senc,Fsens(:,latt1:latt2,long1:long2));

clearvars Flwdn Flwout Fswdn Flat Fsens Fswabs


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% e
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

ncload b30.030e.csim.h.Fswabs.1870-01_cat_1999-12.nc Fswabs
swAe = Fswabs(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.Fswabs.2000-01_cat_2099-12.nc Fswabs
swAe = cat(1,swAe,Fswabs(:,lat1:lat2,long1:long2));

ncload b30.030e.csim.h.Flat.1870-01_cat_1999-12.nc Flat
late = Flat(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.Flat.2000-01_cat_2099-12.nc Flat
late = cat(1,late,Flat(:,lat1:lat2,long1:long2));

ncload b30.030e.csim.h.Fsens.1870-01_cat_1999-12.nc Fsens
sene = Fsens(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.Fsens.2000-01_cat_2099-12.nc Fsens
sene = cat(1,sene,Fsens(:,lat1:lat2,long1:long2));

clearvars Flwdn Flwout Fswdn Flat Fsens Fswabs


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% f.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

ncload b30.030f.ES01.csim.h.Fswabs.1870-01_cat_1999-12.nc Fswabs
swAf = Fswabs(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.Fswabs_nh.2000-01_cat_2049-12.nc Fswabs
swAf = cat(1,swAf,Fswabs(:,latt1:latt2,long1:long2));
ncload b30.040f.ES01.csim.h.Fswabs_nh.2050-01_cat_2099-12.nc Fswabs
swAf = cat(1,swAf,Fswabs(:,latt1:latt2,long1:long2));

ncload b30.030f.ES01.csim.h.Flat.1870-01_cat_1999-12.nc Flat
latf = Flat(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.Flat_nh.2000-01_cat_2049-12.nc Flat
latf = cat(1,latf,Flat(:,latt1:latt2,long1:long2));
ncload b30.040f.ES01.csim.h.Flat_nh.2050-01_cat_2099-12.nc Flat
latf = cat(1,latf,Flat(:,latt1:latt2,long1:long2));

ncload b30.030f.ES01.csim.h.Fsens.1870-01_cat_1999-12.nc Fsens
senf = Fsens(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.Fsens_nh.2000-01_cat_2049-12.nc Fsens
senf = cat(1,senf,Fsens(:,latt1:latt2,long1:long2));
ncload b30.040f.ES01.csim.h.Fsens_nh.2050-01_cat_2099-12.nc Fsens
senf = cat(1,senf,Fsens(:,latt1:latt2,long1:long2));

clearvars Flwdn Flwout Fswdn Flat Fsens Fswabs


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% g.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

ncload b30.030g.ES01.csim.h.Fswabs_nh.1900-01_cat_1949-12.nc Fswabs
swAg = Fswabs(:,latt1:latt2,long1:long2);
ncload b30.030g.ES01.csim.h.Fswabs_nh.1950-01_cat_1999-12.nc Fswabs
swAg = cat(1,swAg,Fswabs(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.Fswabs_nh.2000-01_cat_2049-12.nc Fswabs
swAg = cat(1,swAg,Fswabs(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.Fswabs_nh.2050-01_cat_2099-12.nc Fswabs
swAg = cat(1,swAg,Fswabs(:,latt1:latt2,long1:long2));

ncload b30.030g.ES01.csim.h.Flat_nh.1900-01_cat_1949-12.nc Flat
latg = Flat(:,latt1:latt2,long1:long2);
ncload b30.030g.ES01.csim.h.Flat_nh.1950-01_cat_1999-12.nc Flat
latg = cat(1,latg,Flat(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.Flat_nh.2000-01_cat_2049-12.nc Flat
latg = cat(1,latg,Flat(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.Flat_nh.2050-01_cat_2099-12.nc Flat
latg = cat(1,latg,Flat(:,latt1:latt2,long1:long2));

ncload b30.030g.ES01.csim.h.Fsens_nh.1900-01_cat_1949-12.nc Fsens
seng = Fsens(:,latt1:latt2,long1:long2);
ncload b30.030g.ES01.csim.h.Fsens_nh.1950-01_cat_1999-12.nc Fsens
seng = cat(1,seng,Fsens(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.Fsens_nh.2000-01_cat_2049-12.nc Fsens
seng = cat(1,seng,Fsens(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.Fsens_nh.2050-01_cat_2099-12.nc Fsens
seng = cat(1,seng,Fsens(:,latt1:latt2,long1:long2));

clearvars Flwdn Flwout Fswdn Flat Fsens Fswabs


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save SurfIce.mat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




cd /CCSM/csm/b30.030a/ice/proc/tseries/monthly
get b30.030a.csim.h.Fswabs.1870-01_cat_1999-12.nc 
cd /CCSM/csm/b30.040a/ice/proc/tseries/monthly
get b30.040a.csim.h.Fswabs.2000-01_cat_2099-12.nc 

cd /CCSM/csm/b30.030b.ES01/ice/proc/tseries/monthly
get b30.030b.ES01.csim.h.Fswabs.1870-01_cat_1999-12.nc
cd /CCSM/csm/b30.040b.ES01/ice/proc/tseries/monthly
get b30.040b.ES01.csim.h.Fswabs_nh.2000-01_cat_2049-12.nc
get b30.040b.ES01.csim.h.Fswabs_nh.2050-01_cat_2099-12.nc

cd /CCSM/csm/b30.030c/ice/proc/tseries/monthly
get b30.030c.csim.h.Fswabs.1870-01_cat_1999-12.nc
cd /CCSM/csm/b30.040c/ice/proc/tseries/monthly
get b30.040c.csim.h.Fswabs_nh.2000-01_cat_2049-12.nc
get b30.040c.csim.h.Fswabs_nh.2050-01_cat_2099-12.nc

cd /CCSM/csm/b30.030e/ice/proc/tseries/monthly
get b30.030e.csim.h.Fswabs.1870-01_cat_1999-12.nc
cd /CCSM/csm/b30.040e/ice/proc/tseries/monthly
get b30.040e.csim.h.Fswabs.2000-01_cat_2099-12.nc 

cd /CCSM/csm/b30.030f.ES01/ice/proc/tseries/monthly
get b30.030f.ES01.csim.h.Fswabs.1870-01_cat_1999-12.nc
cd /CCSM/csm/b30.040f.ES01/ice/proc/tseries/monthly
get b30.040f.ES01.csim.h.Fswabs_nh.2000-01_cat_2049-12.nc
get b30.040f.ES01.csim.h.Fswabs_nh.2050-01_cat_2099-12.nc

cd /CCSM/csm/b30.030g.ES01/ice/proc/tseries/monthly
get b30.030g.ES01.csim.h.Fswabs_nh.1900-01_cat_1949-12.nc
get b30.030g.ES01.csim.h.Fswabs_nh.1950-01_cat_1999-12.nc
cd /CCSM/csm/b30.040g.ES01/ice/proc/tseries/monthly
get b30.040g.ES01.csim.h.Fswabs_nh.2000-01_cat_2049-12.nc
get b30.040g.ES01.csim.h.Fswabs_nh.2050-01_cat_2099-12.nc



clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

ncload b30.030a.csim.h.Fswabs.1870-01_cat_1999-12.nc Fswabs
swaa = Fswabs(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Fswabs.2000-01_cat_2099-12.nc Fswabs
swaa = cat(1,swaa,Fswabs(:,lat1:lat2,long1:long2));

ncload b30.030b.ES01.csim.h.Fswabs.1870-01_cat_1999-12.nc Fswabs
swab = Fswabs(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.Fswabs_nh.2000-01_cat_2049-12.nc Fswabs
swab = cat(1,swab,Fswabs(:,latt1:latt2,long1:long2));
ncload b30.040b.ES01.csim.h.Fswabs_nh.2050-01_cat_2099-12.nc Fswabs
swab = cat(1,swab,Fswabs(:,latt1:latt2,long1:long2));

ncload b30.030c.csim.h.Fswabs.1870-01_cat_1999-12.nc Fswabs
swac = Fswabs(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040c.csim.h.Fswabs_nh.2000-01_cat_2049-12.nc Fswabs
swac = cat(1,swac,Fswabs(:,latt1:latt2,long1:long2));
ncload b30.040c.csim.h.Fswabs_nh.2050-01_cat_2099-12.nc Fswabs
swac = cat(1,swac,Fswabs(:,latt1:latt2,long1:long2));

ncload b30.030e.csim.h.Fswabs.1870-01_cat_1999-12.nc Fswabs
swae = Fswabs(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.Fswabs.2000-01_cat_2099-12.nc Fswabs
swae = cat(1,swae,Fswabs(:,lat1:lat2,long1:long2));

ncload b30.030f.ES01.csim.h.Fswabs.1870-01_cat_1999-12.nc Fswabs
swaf = Fswabs(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.Fswabs_nh.2000-01_cat_2049-12.nc Fswabs
swaf = cat(1,swaf,Fswabs(:,latt1:latt2,long1:long2));
ncload b30.040f.ES01.csim.h.Fswabs_nh.2050-01_cat_2099-12.nc Fswabs
swaf = cat(1,swaf,Fswabs(:,latt1:latt2,long1:long2));

ncload b30.030g.ES01.csim.h.Fswabs_nh.1900-01_cat_1949-12.nc Fswabs
swag = Fswabs(:,latt1:latt2,long1:long2);
ncload b30.030g.ES01.csim.h.Fswabs_nh.1950-01_cat_1999-12.nc Fswabs
swag = cat(1,swag,Fswabs(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.Fswabs_nh.2000-01_cat_2049-12.nc Fswabs
swag = cat(1,swag,Fswabs(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.Fswabs_nh.2050-01_cat_2099-12.nc Fswabs
swag = cat(1,swag,Fswabs(:,latt1:latt2,long1:long2));

[nt nlat nlong] = size(swag);

swaay = nanmean(nanmean(nanmean(reshape(swaa,[12 nt/12 nlat nlong]),4),3),1);
swaby = nanmean(nanmean(nanmean(reshape(swab,[12 nt/12 nlat nlong]),4),3),1);
swacy = nanmean(nanmean(nanmean(reshape(swac,[12 nt/12 nlat nlong]),4),3),1);
swaey = nanmean(nanmean(nanmean(reshape(swae,[12 nt/12 nlat nlong]),4),3),1);
swafy = nanmean(nanmean(nanmean(reshape(swaf,[12 nt/12 nlat nlong]),4),3),1);
swagy = nanmean(nanmean(nanmean(reshape(swag,[12 nt/12 nlat nlong]),4),3),1);

swa =[swaay' swaby' swacy' swaey' swafy' swagy'];

x = (1900:2099);
t = {'a','b.ES01','c','e','f.ES01','g.ES01'};
ry = [2036 2027 2032 2032 2013 2044];
ryb = 2030;
Mx = 30;
Mn = 22;

for i=1:6
	subplot(2,3,i)
	plot(x,swa(:,i))
	hold on
	area([ry(i) ry(i)+1], [Mx Mx],'FaceColor', 'k','Linestyle','none');
	grid on
	ylim([22 30])
end
subplot(2,3,2)
area([ryb ryb+1], [Mx Mx],'FaceColor', 'k','Linestyle','none');






%%%%%%%%%%%%%%%%


clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;


ncload b30.030a.csim.h.Fhnet.1870-01_cat_1999-12.nc Fhnet
neta = Fhnet(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Fhnet.2000-01_cat_2099-12.nc Fhnet
neta = cat(1,neta,Fhnet(:,lat1:lat2,long1:long2));

[nt nlat nlong] = size(neta);
netya = nanmean(nanmean(nanmean(reshape(neta,[12 nt/12 nlat nlong]),4),3),1);

x=(1900:2099);
plot(x,netya)





ncload b30.030a.csim.h.Fswthru.1870-01_cat_1999-12.nc Fswthru
swta = Fswthru(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Fswthru.2000-01_cat_2099-12.nc Fswthru
swta = cat(1,swta,Fswthru(:,lat1:lat2,long1:long2));
[nt nlat nlong] = size(swta);

swtya = nanmean(nanmean(nanmean(reshape(swta,[12 nt/12 nlat nlong]),4),3),1);

x=(1900:2099);
plot(x,swtya)


ncload b30.030a.csim.h.albsni.1870-01_cat_1999-12.nc albsni
alb = albsni(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.albsni.2000-01_cat_2099-12.nc albsni
alb = cat(1,alb,albsni(:,lat1:lat2,long1:long2));
[nt nlat nlong] = size(alb);


alby = nanmean(nanmean(nanmean(reshape(alb,[12 nt/12 nlat nlong]),4),3),1);

x=(1900:2099);
plot(x,alby)



