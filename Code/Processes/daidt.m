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
%%%%%%%%%%%%%% THERMO %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%% a %%%%%%%%%%%%%%
ncload b30.030a.csim.h.daidtd.1870-01_cat_1999-12.nc daidtd 
daidtd = daidtd(30*12+1:end,lat1:lat2,long1:long2);
da = daidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.daidtd.2000-01_cat_2099-12.nc daidtd  
da = cat(1,da,daidtd(:,lat1:lat2,long1:long2).*TA(:,lat1:lat2,long1:long2));
yda = reshape(da,[12 2*nt/12 nAlat nAlong]).*m(:,:,lat1:lat2,long1:long2);
yda = squeeze(nansum(nansum(nansum(yda,4),3),1));
%%%%%%%%%%%%%% b.ES01 %%%%%%%%%%%%%%
ncload b30.030b.ES01.csim.h.daidtd.1870-01_cat_1999-12.nc daidtd
daidtd = daidtd(30*12+1:end,lat1:lat2,long1:long2);
db = daidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.daidtd_nh.2000-01_cat_2049-12.nc daidtd
db = cat(1,db,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040b.ES01.csim.h.daidtd_nh.2050-01_cat_2099-12.nc daidtd
db = cat(1,db,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ydb = reshape(db,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
ydb = squeeze(nansum(nansum(nansum(ydb,4),3),1));
%%%%%%%%%%%%%% c %%%%%%%%%%%%%%
ncload b30.030c.csim.h.daidtd.1870-01_cat_1999-12.nc daidtd
daidtd = daidtd(30*12+1:end,lat1:lat2,long1:long2);
dc = daidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.daidtd_nh.2000-01_cat_2049-12.nc daidtd
dc = cat(1,dc,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040b.ES01.csim.h.daidtd_nh.2050-01_cat_2099-12.nc daidtd
dc = cat(1,dc,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ydc = reshape(dc,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
ydc = squeeze(nansum(nansum(nansum(ydc,4),3),1));
%%%%%%%%%%%%%% e %%%%%%%%%%%%%%
ncload b30.030e.csim.h.daidtd.1870-01_cat_1999-12.nc daidtd 
daidtd = daidtd(30*12+1:end,lat1:lat2,long1:long2);
de = daidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.daidtd.2000-01_cat_2099-12.nc daidtd  
de = cat(1,de,daidtd(:,lat1:lat2,long1:long2).*TA(:,lat1:lat2,long1:long2));
yde = reshape(de,[12 2*nt/12 nAlat nAlong]).*m(:,:,lat1:lat2,long1:long2);
yde = squeeze(nansum(nansum(nansum(yde,4),3),1));
%%%%%%%%%%%%%% f.ES01 %%%%%%%%%%%%%%
ncload b30.030f.ES01.csim.h.daidtd.1870-01_cat_1999-12.nc daidtd
daidtd = daidtd(30*12+1:end,lat1:lat2,long1:long2);
df = daidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.daidtd_nh.2000-01_cat_2049-12.nc daidtd
df = cat(1,df,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040f.ES01.csim.h.daidtd_nh.2050-01_cat_2099-12.nc daidtd
df = cat(1,df,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ydf = reshape(df,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
ydf = squeeze(nansum(nansum(nansum(ydf,4),3),1));
%%%%%%%%%%%%%% g.ES01 %%%%%%%%%%%%%%
ncload b30.030g.ES01.csim.h.daidtd_nh.1900-01_cat_1949-12.nc daidtd
dg = daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2);
ncload b30.030g.ES01.csim.h.daidtd_nh.1950-01_cat_1999-12.nc daidtd
dg = cat(1,dg,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040g.ES01.csim.h.daidtd_nh.2000-01_cat_2049-12.nc daidtd
dg = cat(1,dg,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040g.ES01.csim.h.daidtd_nh.2050-01_cat_2099-12.nc daidtd  
dg = cat(1,dg,daidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ydg = reshape(dg,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
ydg = squeeze(nansum(nansum(nansum(ydg,4),3),1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% THERMO %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%% a %%%%%%%%%%%%%%
ncload b30.030a.csim.h.daidtt.1870-01_cat_1999-12.nc daidtt 
daidtt = daidtt(30*12+1:end,lat1:lat2,long1:long2);
ta = daidtt.*TA(:,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.daidtt.2000-01_cat_2099-12.nc daidtt  
ta = cat(1,ta,daidtt(:,lat1:lat2,long1:long2).*TA(:,lat1:lat2,long1:long2));
yta = reshape(ta,[12 2*nt/12 nAlat nAlong]).*m(:,:,lat1:lat2,long1:long2);
yta = squeeze(nansum(nansum(nansum(yta,4),3),1));
%%%%%%%%%%%%%% b.ES01 %%%%%%%%%%%%%%
ncload b30.030b.ES01.csim.h.daidtt.1870-01_cat_1999-12.nc daidtt
daidtt = daidtt(30*12+1:end,lat1:lat2,long1:long2);
tb = daidtt.*TA(:,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.daidtt_nh.2000-01_cat_2049-12.nc daidtt
tb = cat(1,tb,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040b.ES01.csim.h.daidtt_nh.2050-01_cat_2099-12.nc daidtt
tb = cat(1,tb,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ytb = reshape(tb,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
ytb = squeeze(nansum(nansum(nansum(ytb,4),3),1));
%%%%%%%%%%%%%% c %%%%%%%%%%%%%%
ncload b30.030c.csim.h.daidtt.1870-01_cat_1999-12.nc daidtt
daidtt = daidtt(30*12+1:end,lat1:lat2,long1:long2);
tc = daidtt.*TA(:,lat1:lat2,long1:long2);
ncload b30.040c.csim.h.daidtt_nh.2000-01_cat_2049-12.nc daidtt
tc = cat(1,tc,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040c.csim.h.daidtt_nh.2050-01_cat_2099-12.nc daidtt
tc = cat(1,tc,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ytc = reshape(tc,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
ytc = squeeze(nansum(nansum(nansum(ytc,4),3),1));
%%%%%%%%%%%%%% e %%%%%%%%%%%%%%
ncload b30.030e.csim.h.daidtt.1870-01_cat_1999-12.nc daidtt 
daidtt = daidtt(30*12+1:end,lat1:lat2,long1:long2);
te = daidtt.*TA(:,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.daidtt.2000-01_cat_2099-12.nc daidtt  
te = cat(1,te,daidtt(:,lat1:lat2,long1:long2).*TA(:,lat1:lat2,long1:long2));
yte = reshape(te,[12 2*nt/12 nAlat nAlong]).*m(:,:,lat1:lat2,long1:long2);
yte = squeeze(nansum(nansum(nansum(yte,4),3),1));
%%%%%%%%%%%%%% f.ES01 %%%%%%%%%%%%%%
ncload b30.030f.ES01.csim.h.daidtt.1870-01_cat_1999-12.nc daidtt
daidtt = daidtt(30*12+1:end,lat1:lat2,long1:long2);
tf = daidtt.*TA(:,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.daidtt_nh.2000-01_cat_2049-12.nc daidtt
tf = cat(1,tf,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040f.ES01.csim.h.daidtt_nh.2050-01_cat_2099-12.nc daidtt
tf = cat(1,tf,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ytf = reshape(tf,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
ytf = squeeze(nansum(nansum(nansum(ytf,4),3),1));
%%%%%%%%%%%%%% g.ES01 %%%%%%%%%%%%%%
ncload b30.030g.ES01.csim.h.daidtt_nh.1900-01_cat_1949-12.nc daidtt
tg = daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2);
ncload b30.030g.ES01.csim.h.daidtt_nh.1950-01_cat_1999-12.nc daidtt
tg = cat(1,tg,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040g.ES01.csim.h.daidtt_nh.2000-01_cat_2049-12.nc daidtt
tg = cat(1,tg,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040g.ES01.csim.h.daidtt_nh.2050-01_cat_2099-12.nc daidtt  
tg = cat(1,tg,daidtt(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ytg = reshape(tg,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
ytg = squeeze(nansum(nansum(nansum(ytg,4),3),1));


