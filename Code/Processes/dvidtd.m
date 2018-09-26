clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

%%%%%%%%%%%%%% GRID %%%%%%%%%%%%%%
ncload b30.030a.csim.h.dvidtd.1870-01_cat_1999-12.nc tarea
nt = 100*12;
[nlat nlong] = size(tarea);
TA = repmat(tarea,[1 1 nt]);
TA = permute(TA,[3 1 2]);
m = [31 28 31 30 31 30 31 31 30 31 30 31]';
m = repmat(m,[1 nt/6 nlat nlong]);
%%%%%%%%%%%%%% a %%%%%%%%%%%%%%
ncload b30.030a.csim.h.dvidtd.1870-01_cat_1999-12.nc dvidtd 
dvidtd = dvidtd(30*12+1:end,:,:);
da = dvidtd.*TA;
ncload b30.040a.csim.h.dvidtd.2000-01_cat_2099-12.nc dvidtd  
da = cat(1,da,dvidtd.*TA);
yda = reshape(da,[12 2*nt/12 nlat nlong]).*m;
yda = squeeze(nansum(nansum(nansum(yda(:,:,lat1:lat2,long1:long2),4),3),1));
%%%%%%%%%%%%%% b.ES01 %%%%%%%%%%%%%%
ncload b30.030b.ES01.csim.h.dvidtd.1870-01_cat_1999-12.nc dvidtd
dvidtd = dvidtd(30*12+1:end,lat1:lat2,long1:long2);
db = dvidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.dvidtd_nh.2000-01_cat_2049-12.nc dvidtd
db = cat(1,db,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040b.ES01.csim.h.dvidtd_nh.2050-01_cat_2099-12.nc dvidtd
db = cat(1,db,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ydb = reshape(db,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
ydb = squeeze(nansum(nansum(nansum(ydb,4),3),1));
%%%%%%%%%%%%%% c %%%%%%%%%%%%%%
ncload b30.030c.csim.h.dvidtd.1870-01_cat_1999-12.nc dvidtd
dvidtd = dvidtd(30*12+1:end,lat1:lat2,long1:long2);
dc = dvidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.dvidtd_nh.2000-01_cat_2049-12.nc dvidtd
dc = cat(1,dc,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040b.ES01.csim.h.dvidtd_nh.2050-01_cat_2099-12.nc dvidtd
dc = cat(1,dc,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ydc = reshape(dc,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
ydc = squeeze(nansum(nansum(nansum(ydc,4),3),1));
%%%%%%%%%%%%%% e %%%%%%%%%%%%%%
ncload b30.030e.csim.h.dvidtd.1870-01_cat_1999-12.nc dvidtd 
dvidtd = dvidtd(30*12+1:end,:,:);
de = dvidtd.*TA;
ncload b30.040e.csim.h.dvidtd.2000-01_cat_2099-12.nc dvidtd  
de = cat(1,de,dvidtd.*TA);
yde = reshape(de,[12 2*nt/12 nlat nlong]).*m;
yde = squeeze(nansum(nansum(nansum(yde(:,:,lat1:lat2,long1:long2),4),3),1));
%%%%%%%%%%%%%% f.ES01 %%%%%%%%%%%%%%
ncload b30.030f.ES01.csim.h.dvidtd.1870-01_cat_1999-12.nc dvidtd
dvidtd = dvidtd(30*12+1:end,lat1:lat2,long1:long2);
df = dvidtd.*TA(:,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.dvidtd_nh.2000-01_cat_2049-12.nc dvidtd
df = cat(1,df,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040f.ES01.csim.h.dvidtd_nh.2050-01_cat_2099-12.nc dvidtd
df = cat(1,df,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ydf = reshape(df,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
ydf = squeeze(nansum(nansum(nansum(ydf,4),3),1));
%%%%%%%%%%%%%% g.ES01 %%%%%%%%%%%%%%
ncload b30.030g.ES01.csim.h.dvidtd_nh.1900-01_cat_1949-12.nc dvidtd
dg = dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2);
ncload b30.030g.ES01.csim.h.dvidtd_nh.1950-01_cat_1999-12.nc dvidtd
dg = cat(1,dg,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040g.ES01.csim.h.dvidtd_nh.2000-01_cat_2049-12.nc dvidtd
dg = cat(1,dg,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ncload b30.040g.ES01.csim.h.dvidtd_nh.2050-01_cat_2099-12.nc dvidtd  
dg = cat(1,dg,dvidtd(:,latt1:latt2,long1:long2).*TA(1:end/2,lat1:lat2,long1:long2));
ydg = reshape(dg,[12 2*nt/12 lat2-lat1+1 long2-long1+1]).*m(:,:,1:lat2-lat1+1,1:long2-long1+1);
ydg = squeeze(nansum(nansum(nansum(ydg,4),3),1));

save dvidtd.mat -v7.3
