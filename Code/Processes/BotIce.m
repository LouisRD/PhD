clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;
latnh = 281;

rho_w = 4.1/3.996;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030a.csim.h.Fhnet.1870-01_cat_1999-12.nc Fhnet
foia = Fhnet(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.Fhnet.2000-01_cat_2099-12.nc Fhnet
foia = cat(1,foia,Fhnet(:,lat1:lat2,long1:long2));
ncload b30.030a.csim.h.strocnx.1870-01_cat_1999-12.nc strocnx 
ncload b30.030a.csim.h.strocny.1870-01_cat_1999-12.nc strocny
ua = sqrt(sqrt(strocnx(1+30*12:end,lat1:lat2,long1:long2).^2+strocny(1+30*12:end,lat1:lat2,long1:long2).^2)/rho_w);
ncload b30.040a.csim.h.strocnx.2000-01_cat_2099-12.nc strocnx
ncload b30.040a.csim.h.strocny.2000-01_cat_2099-12.nc strocny
ua = cat(1,ua,sqrt(sqrt(strocnx(:,lat1:lat2,long1:long2).^2+strocny(:,lat1:lat2,long1:long2).^2)/rho_w));

clearvars Fhnet strocnx strocny

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% b.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030b.ES01.csim.h.Fhnet.1870-01_cat_1999-12.nc Fhnet
foib = Fhnet(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.Fhnet_nh.2000-01_cat_2049-12.nc Fhnet
foib = cat(1,foib,Fhnet(:,latt1:latt2,long1:long2));
ncload b30.040b.ES01.csim.h.Fhnet_nh.2050-01_cat_2099-12.nc Fhnet
foib = cat(1,foib,Fhnet(:,latt1:latt2,long1:long2));

ncload b30.030b.ES01.csim.h.strocnx.1870-01_cat_1999-12.nc strocnx
ncload b30.030b.ES01.csim.h.strocny.1870-01_cat_1999-12.nc strocny
ub = sqrt(sqrt(strocnx(1+30*12:end,lat1:lat2,long1:long2).^2+strocny(1+30*12:end,lat1:lat2,long1:long2).^2)/rho_w);
ncload b30.040b.ES01.csim.h.strocnx_nh.2000-01_cat_2049-12.nc strocnx
ncload b30.040b.ES01.csim.h.strocny_nh.2000-01_cat_2049-12.nc strocny
ub = cat(1,ub,sqrt(sqrt(strocnx(:,latt1:latt2,long1:long2).^2+strocny(:,latt1:latt2,long1:long2).^2)/rho_w));
ncload b30.040b.ES01.csim.h.strocnx_nh.2050-01_cat_2099-12.nc strocnx
ncload b30.040b.ES01.csim.h.strocny_nh.2050-01_cat_2099-12.nc strocny
ub = cat(1,ub,sqrt(sqrt(strocnx(:,latt1:latt2,long1:long2).^2+strocny(:,latt1:latt2,long1:long2).^2)/rho_w));

clearvars Fhnet strocnx strocny

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% c
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030c.csim.h.Fhnet.1870-01_cat_1999-12.nc Fhnet
foic = Fhnet(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040c.csim.h.Fhnet_nh.2000-01_cat_2049-12.nc Fhnet
foic = cat(1,foic,Fhnet(:,latt1:latt2,long1:long2));
ncload b30.040c.csim.h.Fhnet_nh.2050-01_cat_2099-12.nc Fhnet
foic = cat(1,foic,Fhnet(:,latt1:latt2,long1:long2));

ncload b30.030c.csim.h.strocnx.1870-01_cat_1999-12.nc strocnx
ncload b30.030c.csim.h.strocny.1870-01_cat_1999-12.nc strocny
uc = sqrt(sqrt(strocnx(1+30*12:end,lat1:lat2,long1:long2).^2+strocny(1+30*12:end,lat1:lat2,long1:long2).^2)/rho_w);
ncload b30.040c.csim.h.strocnx_nh.2000-01_cat_2049-12.nc strocnx
ncload b30.040c.csim.h.strocny_nh.2000-01_cat_2049-12.nc strocny
uc = cat(1,uc,sqrt(sqrt(strocnx(:,latt1:latt2,long1:long2).^2+strocny(:,latt1:latt2,long1:long2).^2)/rho_w));
ncload b30.040c.csim.h.strocnx_nh.2050-01_cat_2099-12.nc strocnx
ncload b30.040c.csim.h.strocny_nh.2050-01_cat_2099-12.nc strocny
uc = cat(1,uc,sqrt(sqrt(strocnx(:,latt1:latt2,long1:long2).^2+strocny(:,latt1:latt2,long1:long2).^2)/rho_w));

clearvars Fhnet strocnx strocny

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% e
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030e.csim.h.Fhnet.1870-01_cat_1999-12.nc Fhnet
foie = Fhnet(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.Fhnet.2000-01_cat_2099-12.nc Fhnet
foie = cat(1,foie,Fhnet(:,lat1:lat2,long1:long2));

ncload b30.030e.csim.h.strocnx.1870-01_cat_1999-12.nc strocnx
ncload b30.030e.csim.h.strocny.1870-01_cat_1999-12.nc strocny
ue = sqrt(sqrt(strocnx(1+30*12:end,lat1:lat2,long1:long2).^2+strocny(1+30*12:end,lat1:lat2,long1:long2).^2)/rho_w);
ncload b30.040e.csim.h.strocnx.2000-01_cat_2099-12.nc strocnx
ncload b30.040e.csim.h.strocny.2000-01_cat_2099-12.nc strocny
ue = cat(1,ue,sqrt(sqrt(strocnx(:,lat1:lat2,long1:long2).^2+strocny(:,lat1:lat2,long1:long2).^2)/rho_w));

clearvars Fhnet strocnx strocny

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% f.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030f.ES01.csim.h.Fhnet.1870-01_cat_1999-12.nc Fhnet
foif = Fhnet(1+30*12:end,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.Fhnet_nh.2000-01_cat_2049-12.nc Fhnet
foif = cat(1,foif,Fhnet(:,latt1:latt2,long1:long2));
ncload b30.040f.ES01.csim.h.Fhnet_nh.2050-01_cat_2099-12.nc Fhnet
foif = cat(1,foif,Fhnet(:,latt1:latt2,long1:long2));


ncload b30.030f.ES01.csim.h.strocnx.1870-01_cat_1999-12.nc strocnx
ncload b30.030f.ES01.csim.h.strocny.1870-01_cat_1999-12.nc strocny
uf = sqrt(sqrt(strocnx(1+30*12:end,lat1:lat2,long1:long2).^2+strocny(1+30*12:end,lat1:lat2,long1:long2).^2)/rho_w);
ncload b30.040f.ES01.csim.h.strocnx_nh.2000-01_cat_2049-12.nc strocnx
ncload b30.040f.ES01.csim.h.strocny_nh.2000-01_cat_2049-12.nc strocny
uf = cat(1,uf,sqrt(sqrt(strocnx(:,latt1:latt2,long1:long2).^2+strocny(:,latt1:latt2,long1:long2).^2)/rho_w));
ncload b30.040f.ES01.csim.h.strocnx_nh.2050-01_cat_2099-12.nc strocnx
ncload b30.040f.ES01.csim.h.strocny_nh.2050-01_cat_2099-12.nc strocny
uf = cat(1,uf,sqrt(sqrt(strocnx(:,latt1:latt2,long1:long2).^2+strocny(:,latt1:latt2,long1:long2).^2)/rho_w));

clearvars Fhnet strocnx strocny

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% g.ES01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ncload b30.030g.ES01.csim.h.Fhnet_nh.1900-01_cat_1949-12.nc Fhnet
foig = Fhnet(:,latt1:latt2,long1:long2);
ncload b30.030g.ES01.csim.h.Fhnet_nh.1950-01_cat_1999-12.nc Fhnet
foig = cat(1,foig,Fhnet(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.Fhnet_nh.2000-01_cat_2049-12.nc Fhnet
foig = cat(1,foig,Fhnet(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.Fhnet_nh.2050-01_cat_2099-12.nc Fhnet
foig = cat(1,foig,Fhnet(:,latt1:latt2,long1:long2));

ncload b30.030g.ES01.csim.h.strocnx_nh.1900-01_cat_1949-12.nc strocnx
ncload b30.030g.ES01.csim.h.strocny_nh.1900-01_cat_1949-12.nc strocny
ug = sqrt(sqrt(strocnx(:,latt1:latt2,long1:long2).^2+strocny(:,latt1:latt2,long1:long2).^2)/rho_w);
ncload b30.030g.ES01.csim.h.strocnx_nh.1950-01_cat_1999-12.nc strocnx
ncload b30.030g.ES01.csim.h.strocny_nh.1950-01_cat_1999-12.nc strocny
ug = cat(1,ug,sqrt(sqrt(strocnx(:,latt1:latt2,long1:long2).^2+strocny(:,latt1:latt2,long1:long2).^2)/rho_w));
ncload b30.040g.ES01.csim.h.strocnx_nh.2000-01_cat_2049-12.nc strocnx
ncload b30.040g.ES01.csim.h.strocny_nh.2000-01_cat_2049-12.nc strocny
ug = cat(1,ug,sqrt(sqrt(strocnx(:,latt1:latt2,long1:long2).^2+strocny(:,latt1:latt2,long1:long2).^2)/rho_w));
ncload b30.040g.ES01.csim.h.strocnx_nh.2050-01_cat_2099-12.nc strocnx
ncload b30.040g.ES01.csim.h.strocny_nh.2050-01_cat_2099-12.nc strocny
ug = cat(1,ug,sqrt(sqrt(strocnx(:,latt1:latt2,long1:long2).^2+strocny(:,latt1:latt2,long1:long2).^2)/rho_w));

clearvars Fhnet strocnx strocny

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save BotIce.mat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%













