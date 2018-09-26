clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;
nAlat = lat2-lat1+1;
nAlong = long2-long1+1;

%%%%%%%%%%%%%% GRID %%%%%%%%%%%%%%
ncload b30.030a.csim.h.daidtt.1870-01_cat_1999-12.nc tarea
nt = 100*12;
[nlat nlong] = size(tarea);
TA = repmat(tarea,[1 1 nt]);
TA = permute(TA,[3 1 2]);
m = [31 28 31 30 31 30 31 31 30 31 30 31]';
m = repmat(m,[1 nt/6 nlat nlong]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% DYNAMIC aice %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%% a %%%%%%%%%%%%%%
ncload b30.030a.csim.h.daidtd.1870-01_cat_1999-12.nc daidtd 
daidtd = daidtd(30*12+1:end,lat1:lat2,long1:long2);
da = daidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.daidtd.2000-01_cat_2099-12.nc daidtd  
da = cat(1,da,daidtd(:,lat1:lat2,long1:long2).*TA(:,lat1:lat2,long1:long2));
da = reshape(da,[12 2*nt/12 nAlat nAlong]).*m(:,:,lat1:lat2,long1:long2);
YdadtDa = squeeze(nansum(nansum(nansum(da,4),3),1));
ncload b30.030a.csim.h.aice.1870-01_cat_1999-12.nc aice
a = aice(30*12+1:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.aice.2000-01_cat_2099-12.nc aice
a = cat(1,a,aice(:,lat1:lat2,long1:long2));
indexa = find(a(9+12*131,:,:)>15 & a(9+12*141,:,:)<15);
YdadtDaR = squeeze(nansum(nansum(nansum(da(:,:,indexa),4),3),1));
clearvars da a
%%%%%%%%%%%%%% b.ES01 %%%%%%%%%%%%%%
ncload b30.030b.ES01.csim.h.daidtd.1870-01_cat_1999-12.nc daidtd
daidtd = daidtd(30*12+1:end,lat1:lat2,long1:long2);
db = daidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.daidtd_nh.2000-01_cat_2049-12.nc daidtd
db = cat(1,db,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040b.ES01.csim.h.daidtd_nh.2050-01_cat_2099-12.nc daidtd
db = cat(1,db,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
db = reshape(db,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
YdadtDb = squeeze(nansum(nansum(nansum(db,4),3),1));
ncload b30.030b.ES01.csim.h.aice.1870-01_cat_1999-12.nc aice
b = aice(30*12+1:end,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
b = cat(1,b,aice(:,latt1:latt2,long1:long2));
ncload b30.040b.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
b = cat(1,b,aice(:,latt1:latt2,long1:long2));
indexb = find(b(9+12*122,:,:)>15 & b(9+12*135,:,:)<15);
YdadtDbR = squeeze(nansum(nansum(nansum(db(:,:,indexb),4),3),1));
clearvars db b
%%%%%%%%%%%%%% c %%%%%%%%%%%%%%
ncload b30.030c.csim.h.daidtd.1870-01_cat_1999-12.nc daidtd
daidtd = daidtd(30*12+1:end,lat1:lat2,long1:long2);
dc = daidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.daidtd_nh.2000-01_cat_2049-12.nc daidtd
dc = cat(1,dc,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040b.ES01.csim.h.daidtd_nh.2050-01_cat_2099-12.nc daidtd
dc = cat(1,dc,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
dc = reshape(dc,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
YdadtDc = squeeze(nansum(nansum(nansum(dc,4),3),1));
ncload b30.030c.csim.h.aice.1870-01_cat_1999-12.nc aice
c = aice(30*12+1:end,end-103:end,:);
ncload b30.040c.csim.h.aice_nh.2000-01_cat_2049-12.nc aice tarea
c = cat(1,c,aice);
ncload b30.040c.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
c = cat(1,c,aice);
c = c(:,latt1:latt2,long1:long2);
indexc = find(c(9+12*127,:,:)>15 & c(9+12*137,:,:)<15);
YdadtDcR = squeeze(nansum(nansum(nansum(dc(:,:,indexc),4),3),1));
clearvars dc c
%%%%%%%%%%%%%% e %%%%%%%%%%%%%%
ncload b30.030e.csim.h.daidtd.1870-01_cat_1999-12.nc daidtd 
daidtd = daidtd(30*12+1:end,lat1:lat2,long1:long2);
de = daidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.daidtd.2000-01_cat_2099-12.nc daidtd  
de = cat(1,de,daidtd(:,lat1:lat2,long1:long2).*TA(:,lat1:lat2,long1:long2));
de = reshape(de,[12 2*nt/12 nAlat nAlong]).*m(:,:,lat1:lat2,long1:long2);
YdadtDe = squeeze(nansum(nansum(nansum(de,4),3),1));
ncload b30.030e.csim.h.aice.1870-01_cat_1999-12.nc aice tarea
e = aice(30*12+1:end,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.aice.2000-01_cat_2099-12.nc aice
e = cat(1,e,aice(:,lat1:lat2,long1:long2));
indexe = find(e(9+12*127,:,:)>15 & e(9+12*148,:,:)<15);
YdadtDeR = squeeze(nansum(nansum(nansum(de(:,:,indexe),4),3),1));
clearvars de e
%%%%%%%%%%%%%% f.ES01 %%%%%%%%%%%%%%
ncload b30.030f.ES01.csim.h.daidtd.1870-01_cat_1999-12.nc daidtd
daidtd = daidtd(30*12+1:end,lat1:lat2,long1:long2);
df = daidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.daidtd_nh.2000-01_cat_2049-12.nc daidtd
df = cat(1,df,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040f.ES01.csim.h.daidtd_nh.2050-01_cat_2099-12.nc daidtd
df = cat(1,df,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
df = reshape(df,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
YdadtDf = squeeze(nansum(nansum(nansum(df,4),3),1));
ncload b30.030f.ES01.csim.h.aice.1870-01_cat_1999-12.nc aice
f = aice(30*12+1:end,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice tarea
f = cat(1,f,aice(:,latt1:latt2,long1:long2));
ncload b30.040f.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
f = cat(1,f,aice(:,latt1:latt2,long1:long2));
indexf = find(f(9+12*130,:,:)>15 & f(9+12*150,:,:)<15);
YdadtDfR = squeeze(nansum(nansum(nansum(df(:,:,indexf),4),3),1));
clearvars df f
%%%%%%%%%%%%%% g.ES01 %%%%%%%%%%%%%%
ncload b30.030g.ES01.csim.h.daidtd_nh.1900-01_cat_1949-12.nc daidtd
dg = daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2);
ncload b30.030g.ES01.csim.h.daidtd_nh.1950-01_cat_1999-12.nc daidtd
dg = cat(1,dg,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040g.ES01.csim.h.daidtd_nh.2000-01_cat_2049-12.nc daidtd
dg = cat(1,dg,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040g.ES01.csim.h.daidtd_nh.2050-01_cat_2099-12.nc daidtd  
dg = cat(1,dg,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
dg = reshape(dg,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
YdadtDg = squeeze(nansum(nansum(nansum(dg,4),3),1));
ncload b30.030g.ES01.csim.h.aice_nh.1900-01_cat_1949-12.nc aice tarea
g = aice(:,latt1:latt2,long1:long2);
ncload b30.030g.ES01.csim.h.aice_nh.1950-01_cat_1999-12.nc aice
g = cat(1,g,aice(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
g = cat(1,g,aice(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
g = cat(1,g,aice(:,latt1:latt2,long1:long2));
indexg = find(g(9+12*129,:,:)>15 & g(9+12*149,:,:)<15);
YdadtDgR = squeeze(nansum(nansum(nansum(dg(:,:,indexg),4),3),1));
clearvars dg g aice

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% THERMO aice %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%% a %%%%%%%%%%%%%%
ncload b30.030a.csim.h.daidtt.1870-01_cat_1999-12.nc daidtt 
daidtt = daidtt(30*12+1:end,lat1:lat2,long1:long2);
ta = daidtt.*TA(:,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.daidtt.2000-01_cat_2099-12.nc daidtt  
ta = cat(1,ta,daidtt(:,lat1:lat2,long1:long2).*TA(:,lat1:lat2,long1:long2));
ta = reshape(ta,[12 2*nt/12 nAlat nAlong]).*m(:,:,lat1:lat2,long1:long2);
YdadtTa = squeeze(nansum(nansum(nansum(ta,4),3),1));
YdadtTaR = squeeze(nansum(nansum(nansum(ta(:,:,indexa),4),3),1));
clearvars ta
%%%%%%%%%%%%%% b.ES01 %%%%%%%%%%%%%%
ncload b30.030b.ES01.csim.h.daidtt.1870-01_cat_1999-12.nc daidtt
daidtt = daidtt(30*12+1:end,lat1:lat2,long1:long2);
tb = daidtt.*TA(:,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.daidtt_nh.2000-01_cat_2049-12.nc daidtt
tb = cat(1,tb,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040b.ES01.csim.h.daidtt_nh.2050-01_cat_2099-12.nc daidtt
tb = cat(1,tb,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
tb = reshape(tb,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
YdadtTb = squeeze(nansum(nansum(nansum(tb,4),3),1));
YdadtTbR = squeeze(nansum(nansum(nansum(tb(:,:,indexb),4),3),1));
clearvars tb
%%%%%%%%%%%%%% c %%%%%%%%%%%%%%
ncload b30.030c.csim.h.daidtt.1870-01_cat_1999-12.nc daidtt
daidtt = daidtt(30*12+1:end,lat1:lat2,long1:long2);
tc = daidtt.*TA(:,lat1:lat2,long1:long2);
ncload b30.040c.csim.h.daidtt_nh.2000-01_cat_2049-12.nc daidtt
tc = cat(1,tc,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040c.csim.h.daidtt_nh.2050-01_cat_2099-12.nc daidtt
tc = cat(1,tc,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
tc = reshape(tc,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
YdadtTc = squeeze(nansum(nansum(nansum(tc,4),3),1));
YdadtTcR = squeeze(nansum(nansum(nansum(tc(:,:,indexc),4),3),1));
clearvars tc
%%%%%%%%%%%%%% e %%%%%%%%%%%%%%
ncload b30.030e.csim.h.daidtt.1870-01_cat_1999-12.nc daidtt 
daidtt = daidtt(30*12+1:end,lat1:lat2,long1:long2);
te = daidtt.*TA(:,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.daidtt.2000-01_cat_2099-12.nc daidtt  
te = cat(1,te,daidtt(:,lat1:lat2,long1:long2).*TA(:,lat1:lat2,long1:long2));
te = reshape(te,[12 2*nt/12 nAlat nAlong]).*m(:,:,lat1:lat2,long1:long2);
YdadtTe = squeeze(nansum(nansum(nansum(te,4),3),1));
YdadtTeR = squeeze(nansum(nansum(nansum(te(:,:,indexe),4),3),1));
clearvars te
%%%%%%%%%%%%%% f.ES01 %%%%%%%%%%%%%%
ncload b30.030f.ES01.csim.h.daidtt.1870-01_cat_1999-12.nc daidtt
daidtt = daidtt(30*12+1:end,lat1:lat2,long1:long2);
tf = daidtt.*TA(:,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.daidtt_nh.2000-01_cat_2049-12.nc daidtt
tf = cat(1,tf,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040f.ES01.csim.h.daidtt_nh.2050-01_cat_2099-12.nc daidtt
tf = cat(1,tf,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
tf = reshape(tf,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
YdadtTf = squeeze(nansum(nansum(nansum(tf,4),3),1));
YdadtTfR = squeeze(nansum(nansum(nansum(tf(:,:,indexf),4),3),1));
clearvars tf
%%%%%%%%%%%%%% g.ES01 %%%%%%%%%%%%%%
ncload b30.030g.ES01.csim.h.daidtt_nh.1900-01_cat_1949-12.nc daidtt
tg = daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2);
ncload b30.030g.ES01.csim.h.daidtt_nh.1950-01_cat_1999-12.nc daidtt
tg = cat(1,tg,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040g.ES01.csim.h.daidtt_nh.2000-01_cat_2049-12.nc daidtt
tg = cat(1,tg,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040g.ES01.csim.h.daidtt_nh.2050-01_cat_2099-12.nc daidtt  
tg = cat(1,tg,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
tg = reshape(tg,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
YdadtTg = squeeze(nansum(nansum(nansum(tg,4),3),1));
YdadtTgR = squeeze(nansum(nansum(nansum(tg(:,:,indexg),4),3),1));
clearvars tg



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% DYNAMIC volume %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%% a %%%%%%%%%%%%%%
ncload b30.030a.csim.h.dvidtd.1870-01_cat_1999-12.nc dvidtd 
dvidtd = dvidtd(30*12+1:end,lat1:lat2,long1:long2);
da = dvidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.dvidtd.2000-01_cat_2099-12.nc dvidtd  
da = cat(1,da,dvidtd(:,lat1:lat2,long1:long2).*TA(:,lat1:lat2,long1:long2));
da = reshape(da,[12 2*nt/12 nAlat nAlong]).*m(:,:,lat1:lat2,long1:long2);
YdvdtDa = squeeze(nansum(nansum(nansum(da,4),3),1));
YdvdtDaR = squeeze(nansum(nansum(nansum(da(:,:,indexa),4),3),1));
clearvars da 
%%%%%%%%%%%%%% b.ES01 %%%%%%%%%%%%%%
ncload b30.030b.ES01.csim.h.dvidtd.1870-01_cat_1999-12.nc dvidtd
dvidtd = dvidtd(30*12+1:end,lat1:lat2,long1:long2);
db = dvidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.dvidtd_nh.2000-01_cat_2049-12.nc dvidtd
db = cat(1,db,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040b.ES01.csim.h.dvidtd_nh.2050-01_cat_2099-12.nc dvidtd
db = cat(1,db,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
db = reshape(db,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
YdvdtDb = squeeze(nansum(nansum(nansum(db,4),3),1));
YdvdtDbR = squeeze(nansum(nansum(nansum(db(:,:,indexb),4),3),1));
clearvars db
%%%%%%%%%%%%%% c %%%%%%%%%%%%%%
ncload b30.030c.csim.h.dvidtd.1870-01_cat_1999-12.nc dvidtd
dvidtd = dvidtd(30*12+1:end,lat1:lat2,long1:long2);
dc = dvidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.dvidtd_nh.2000-01_cat_2049-12.nc dvidtd
dc = cat(1,dc,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040b.ES01.csim.h.dvidtd_nh.2050-01_cat_2099-12.nc dvidtd
dc = cat(1,dc,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
dc = reshape(dc,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
YdvdtDc = squeeze(nansum(nansum(nansum(dc,4),3),1));
YdvdtDcR = squeeze(nansum(nansum(nansum(dc(:,:,indexc),4),3),1));
clearvars dc
%%%%%%%%%%%%%% e %%%%%%%%%%%%%%
ncload b30.030e.csim.h.dvidtd.1870-01_cat_1999-12.nc dvidtd 
dvidtd = dvidtd(30*12+1:end,lat1:lat2,long1:long2);
de = dvidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.dvidtd.2000-01_cat_2099-12.nc dvidtd  
de = cat(1,de,dvidtd(:,lat1:lat2,long1:long2).*TA(:,lat1:lat2,long1:long2));
de = reshape(de,[12 2*nt/12 nAlat nAlong]).*m(:,:,lat1:lat2,long1:long2);
YdvdtDe = squeeze(nansum(nansum(nansum(de,4),3),1));
YdvdtDeR = squeeze(nansum(nansum(nansum(de(:,:,indexe),4),3),1));
clearvars de
%%%%%%%%%%%%%% f.ES01 %%%%%%%%%%%%%%
ncload b30.030f.ES01.csim.h.dvidtd.1870-01_cat_1999-12.nc dvidtd
dvidtd = dvidtd(30*12+1:end,lat1:lat2,long1:long2);
df = dvidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.dvidtd_nh.2000-01_cat_2049-12.nc dvidtd
df = cat(1,df,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040f.ES01.csim.h.dvidtd_nh.2050-01_cat_2099-12.nc dvidtd
df = cat(1,df,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
df = reshape(df,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
YdvdtDf = squeeze(nansum(nansum(nansum(df,4),3),1));
YdvdtDfR = squeeze(nansum(nansum(nansum(df(:,:,indexf),4),3),1));
clearvars df
%%%%%%%%%%%%%% g.ES01 %%%%%%%%%%%%%%
ncload b30.030g.ES01.csim.h.dvidtd_nh.1900-01_cat_1949-12.nc dvidtd
dg = dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2);
ncload b30.030g.ES01.csim.h.dvidtd_nh.1950-01_cat_1999-12.nc dvidtd
dg = cat(1,dg,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040g.ES01.csim.h.dvidtd_nh.2000-01_cat_2049-12.nc dvidtd
dg = cat(1,dg,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040g.ES01.csim.h.dvidtd_nh.2050-01_cat_2099-12.nc dvidtd  
dg = cat(1,dg,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
dg = reshape(dg,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
YdvdtDg = squeeze(nansum(nansum(nansum(dg,4),3),1));
YdvdtDgR = squeeze(nansum(nansum(nansum(dg(:,:,indexg),4),3),1));
clearvars dg

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% THERMO volume %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%% a %%%%%%%%%%%%%%
ncload b30.030a.csim.h.dvidtt.1870-01_cat_1999-12.nc dvidtt 
dvidtt = dvidtt(30*12+1:end,lat1:lat2,long1:long2);
ta = dvidtt.*TA(:,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.dvidtt.2000-01_cat_2099-12.nc dvidtt  
ta = cat(1,ta,dvidtt(:,lat1:lat2,long1:long2).*TA(:,lat1:lat2,long1:long2));
ta = reshape(ta,[12 2*nt/12 nAlat nAlong]).*m(:,:,lat1:lat2,long1:long2);
YdvdtTa = squeeze(nansum(nansum(nansum(ta,4),3),1));
YdvdtTaR = squeeze(nansum(nansum(nansum(ta(:,:,indexa),4),3),1));
clearvars ta
%%%%%%%%%%%%%% b.ES01 %%%%%%%%%%%%%%
ncload b30.030b.ES01.csim.h.dvidtt.1870-01_cat_1999-12.nc dvidtt
dvidtt = dvidtt(30*12+1:end,lat1:lat2,long1:long2);
tb = dvidtt.*TA(:,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.dvidtt_nh.2000-01_cat_2049-12.nc dvidtt
tb = cat(1,tb,dvidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040b.ES01.csim.h.dvidtt_nh.2050-01_cat_2099-12.nc dvidtt
tb = cat(1,tb,dvidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
tb = reshape(tb,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
YdvdtTb = squeeze(nansum(nansum(nansum(tb,4),3),1));
YdvdtTbR = squeeze(nansum(nansum(nansum(tb(:,:,indexb),4),3),1));
clearvars tb
%%%%%%%%%%%%%% c %%%%%%%%%%%%%%
ncload b30.030c.csim.h.dvidtt.1870-01_cat_1999-12.nc dvidtt
dvidtt = dvidtt(30*12+1:end,lat1:lat2,long1:long2);
tc = dvidtt.*TA(:,lat1:lat2,long1:long2);
ncload b30.040c.csim.h.dvidtt_nh.2000-01_cat_2049-12.nc dvidtt
tc = cat(1,tc,dvidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040c.csim.h.dvidtt_nh.2050-01_cat_2099-12.nc dvidtt
tc = cat(1,tc,dvidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
tc = reshape(tc,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
YdvdtTc = squeeze(nansum(nansum(nansum(tc,4),3),1));
YdvdtTcR = squeeze(nansum(nansum(nansum(tc(:,:,indexc),4),3),1));
clearvars tc
%%%%%%%%%%%%%% e %%%%%%%%%%%%%%
ncload b30.030e.csim.h.dvidtt.1870-01_cat_1999-12.nc dvidtt 
dvidtt = dvidtt(30*12+1:end,lat1:lat2,long1:long2);
te = dvidtt.*TA(:,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.dvidtt.2000-01_cat_2099-12.nc dvidtt  
te = cat(1,te,dvidtt(:,lat1:lat2,long1:long2).*TA(:,lat1:lat2,long1:long2));
te = reshape(te,[12 2*nt/12 nAlat nAlong]).*m(:,:,lat1:lat2,long1:long2);
YdvdtTe = squeeze(nansum(nansum(nansum(te,4),3),1));
YdvdtTeR = squeeze(nansum(nansum(nansum(te(:,:,indexe),4),3),1));
clearvars te
%%%%%%%%%%%%%% f.ES01 %%%%%%%%%%%%%%
ncload b30.030f.ES01.csim.h.dvidtt.1870-01_cat_1999-12.nc dvidtt
dvidtt = dvidtt(30*12+1:end,lat1:lat2,long1:long2);
tf = dvidtt.*TA(:,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.dvidtt_nh.2000-01_cat_2049-12.nc dvidtt
tf = cat(1,tf,dvidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040f.ES01.csim.h.dvidtt_nh.2050-01_cat_2099-12.nc dvidtt
tf = cat(1,tf,dvidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
tf = reshape(tf,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
YdvdtTf = squeeze(nansum(nansum(nansum(tf,4),3),1));
YdvdtTfR = squeeze(nansum(nansum(nansum(tf(:,:,indexf),4),3),1));
clearvars tf
%%%%%%%%%%%%%% g.ES01 %%%%%%%%%%%%%%
ncload b30.030g.ES01.csim.h.dvidtt_nh.1900-01_cat_1949-12.nc dvidtt
tg = dvidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2);
ncload b30.030g.ES01.csim.h.dvidtt_nh.1950-01_cat_1999-12.nc dvidtt
tg = cat(1,tg,dvidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040g.ES01.csim.h.dvidtt_nh.2000-01_cat_2049-12.nc dvidtt
tg = cat(1,tg,dvidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040g.ES01.csim.h.dvidtt_nh.2050-01_cat_2099-12.nc dvidtt  
tg = cat(1,tg,dvidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
tg = reshape(tg,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
YdvdtTg = squeeze(nansum(nansum(nansum(tg,4),3),1));
YdvdtTgR = squeeze(nansum(nansum(nansum(tg(:,:,indexg),4),3),1));
clearvars tg



clearvars daidtt daidtd dvidtt dvidtd m TA tarea index ans
save dvidt.mat
