clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

%a
ncload b30.030a.csim.h.aice.1870-01_cat_1999-12.nc tarea aice
a = aice(30*12+9:12:end,end-103:end,:);
ncload b30.040a.csim.h.aice.2000-01_cat_2099-12.nc aice
a = cat(1,a,aice(9:12:end,end-103:end,:));
[nt nlat nlong] = size(a);
TA = repmat(tarea(end-103:end,:),[1 1 nt]);
TA = permute(TA,[3 1 2]);

indexNaN = find(isnan(a)==1);
index15 = find(a<15);
index20 = find(a<20);
index25 = find(a<25);
index30 = find(a<30);
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index15) = NaN;
aE15 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index20) = NaN;
aE20 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index25) = NaN;
aE25 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index30) = NaN;
aE30 = nansum(nansum(tmp,2),3)/10^12;
aC = nansum(nansum(a.*TA,2),3)/10^14;
aE15s5 = (aE15(1:end-4)+aE15(2:end-3)+aE15(3:end-2)+aE15(4:end-1)+aE15(5:end))/5;
adE15s5 = aE15s5(2:end)-aE15s5(1:end-1);
aE20s5 = (aE20(1:end-4)+aE20(2:end-3)+aE20(3:end-2)+aE20(4:end-1)+aE20(5:end))/5;
adE20s5 = aE20s5(2:end)-aE20s5(1:end-1);
aE25s5 = (aE25(1:end-4)+aE25(2:end-3)+aE25(3:end-2)+aE25(4:end-1)+aE25(5:end))/5;
adE25s5 = aE25s5(2:end)-aE25s5(1:end-1);
aE30s5 = (aE30(1:end-4)+aE30(2:end-3)+aE30(3:end-2)+aE30(4:end-1)+aE30(5:end))/5;
adE30s5 = aE30s5(2:end)-aE30s5(1:end-1);
aCs5 = (aC(1:end-4)+aC(2:end-3)+aC(3:end-2)+aC(4:end-1)+aC(5:end))/5;
adCs5 = aCs5(2:end)-aCs5(1:end-1);
x = (1900:2099);
x5 = (1902:2097);
dx5 = (1902.5:1:2096.5);
x5(find(adE15s5<=-0.5))

x3 = (1901:2098);
dx3 = (1901+0.5:2098-0.5);
aE15s3 = (aE15(1:end-2)+aE15(2:end-1)+aE15(3:end))/3;
adE15s3 = aE15s3(2:end)-aE15s3(1:end-1);
x7 = (1903:2096);
dx7 = (1903+0.5:2096-0.5);
aE15s7 = (aE15(1:end-6)+aE15(2:end-5)+aE15(3:end-4)+aE15(4:end-3)+aE15(5:end-2)+aE15(6:end-1)+aE15(7:end))/7;
adE15s7 = aE15s7(2:end)-aE15s7(1:end-1);
x9 = (1904:2095);
dx9 = (1904+0.5:2095-0.5);
aE15s9 = (aE15(1:end-8)+aE15(2:end-7)+aE15(3:end-6)+aE15(4:end-5)+aE15(5:end-4)+aE15(6:end-3)+aE15(7:end-2)+aE15(8:end-1)+aE15(9:end))/9;
adE15s9 = aE15s9(2:end)-aE15s9(1:end-1);
x3(find(adE15s3<=-0.5))
x5(find(adE15s5<=-0.5))
x7(find(adE15s7<=-0.5))
x9(find(adE15s9<=-0.5))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

ncload b30.030b.ES01.csim.h.aice_nh.1900-01_cat_1949-12.nc aice tarea
b = aice(9:12:end,:,:);
ncload b30.030b.ES01.csim.h.aice_nh.1950-01_cat_1999-12.nc aice
b = cat(1,b,aice(9:12:end,:,:));
ncload b30.040b.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
b = cat(1,b,aice(9:12:end,:,:));
ncload b30.040b.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
b = cat(1,b,aice(9:12:end,:,:));
[nt nlat nlong] = size(b);
TA = repmat(tarea,[1 1 nt]);
TA = permute(TA,[3 1 2]);

indexNaN = find(isnan(b)==1);
index15 = find(b<15);
index20 = find(b<20);
index25 = find(b<25);
index30 = find(b<30);
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index15) = NaN;
bE15 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index20) = NaN;
bE20 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index25) = NaN;
bE25 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index30) = NaN;
bE30 = nansum(nansum(tmp,2),3)/10^12;
bC = nansum(nansum(b.*TA,2),3)/10^14;
bE15s5 = (bE15(1:end-4)+bE15(2:end-3)+bE15(3:end-2)+bE15(4:end-1)+bE15(5:end))/5;
bdE15s5 = bE15s5(2:end)-bE15s5(1:end-1);
bE20s5 = (bE20(1:end-4)+bE20(2:end-3)+bE20(3:end-2)+bE20(4:end-1)+bE20(5:end))/5;
bdE20s5 = bE20s5(2:end)-bE20s5(1:end-1);
bE25s5 = (bE25(1:end-4)+bE25(2:end-3)+bE25(3:end-2)+bE25(4:end-1)+bE25(5:end))/5;
bdE25s5 = bE25s5(2:end)-bE25s5(1:end-1);
bE30s5 = (bE30(1:end-4)+bE30(2:end-3)+bE30(3:end-2)+bE30(4:end-1)+bE30(5:end))/5;
bdE30s5 = bE30s5(2:end)-bE30s5(1:end-1);
bCs5 = (bC(1:end-4)+bC(2:end-3)+bC(3:end-2)+bC(4:end-1)+bC(5:end))/5;
bdCs5 = bCs5(2:end)-bCs5(1:end-1);
x = (1900:2099);
x5 = (1902:2097);
dx5 = (1902.5:1:2096.5);
x5(find(bdE15s5<=-0.5))
x5(find(bdE20s5<=-0.5))
x5(find(bdE25s5<=-0.5))
x5(find(bdE30s5<=-0.5))
x5(find(bdCs5<=-0.5))

x3 = (1901:2098);
dx3 = (1901+0.5:2098-0.5);
bE15s3 = (bE15(1:end-2)+bE15(2:end-1)+bE15(3:end))/3;
bdE15s3 = bE15s3(2:end)-bE15s3(1:end-1);
x7 = (1903:2096);
dx7 = (1903+0.5:2096-0.5);
bE15s7 = (bE15(1:end-6)+bE15(2:end-5)+bE15(3:end-4)+bE15(4:end-3)+bE15(5:end-2)+bE15(6:end-1)+bE15(7:end))/7;
bdE15s7 = bE15s7(2:end)-bE15s7(1:end-1);
x9 = (1904:2095);
dx9 = (1904+0.5:2095-0.5);
bE15s9 = (bE15(1:end-8)+bE15(2:end-7)+bE15(3:end-6)+bE15(4:end-5)+bE15(5:end-4)+bE15(6:end-3)+bE15(7:end-2)+bE15(8:end-1)+bE15(9:end))/9;
bdE15s9 = bE15s9(2:end)-bE15s9(1:end-1);
x3(find(bdE15s3<=-0.5))
x5(find(bdE15s5<=-0.5))
x7(find(bdE15s7<=-0.5))
x9(find(bdE15s9<=-0.5))


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%c
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

ncload b30.030c.csim.h.aice.1870-01_cat_1999-12.nc aice
c = aice(30*12+9:12:end,end-103:end,:);
ncload b30.040c.csim.h.aice_nh.2000-01_cat_2049-12.nc aice tarea
c = cat(1,c,aice(9:12:end,:,:));
ncload b30.040c.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
c = cat(1,c,aice(9:12:end,:,:));
[nt nlat nlong] = size(c);
TA = repmat(tarea,[1 1 nt]);
TA = permute(TA,[3 1 2]);

indexNaN = find(isnan(c)==1);
index15 = find(c<15);
index20 = find(c<20);
index25 = find(c<25);
index30 = find(c<30);
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index15) = NaN;
cE15 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index20) = NaN;
cE20 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index25) = NaN;
cE25 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index30) = NaN;
cE30 = nansum(nansum(tmp,2),3)/10^12;
cC = nansum(nansum(c.*TA,2),3)/10^14;
cE15s5 = (cE15(1:end-4)+cE15(2:end-3)+cE15(3:end-2)+cE15(4:end-1)+cE15(5:end))/5;
cdE15s5 = cE15s5(2:end)-cE15s5(1:end-1);
cE20s5 = (cE20(1:end-4)+cE20(2:end-3)+cE20(3:end-2)+cE20(4:end-1)+cE20(5:end))/5;
cdE20s5 = cE20s5(2:end)-cE20s5(1:end-1);
cE25s5 = (cE25(1:end-4)+cE25(2:end-3)+cE25(3:end-2)+cE25(4:end-1)+cE25(5:end))/5;
cdE25s5 = cE25s5(2:end)-cE25s5(1:end-1);
cE30s5 = (cE30(1:end-4)+cE30(2:end-3)+cE30(3:end-2)+cE30(4:end-1)+cE30(5:end))/5;
cdE30s5 = cE30s5(2:end)-cE30s5(1:end-1);
cCs5 = (cC(1:end-4)+cC(2:end-3)+cC(3:end-2)+cC(4:end-1)+cC(5:end))/5;
cdCs5 = cCs5(2:end)-cCs5(1:end-1);
x = (1900:2099);
x5 = (1902:2097);
dx5 = (1902.5:1:2096.5);
x5(find(cdE15s5<=-0.5))
x5(find(cdE20s5<=-0.5))
x5(find(cdE25s5<=-0.5))
x5(find(cdE30s5<=-0.5))
x5(find(cdCs5<=-0.5))

x3 = (1901:2098);
dx3 = (1901+0.5:2098-0.5);
cE15s3 = (cE15(1:end-2)+cE15(2:end-1)+cE15(3:end))/3;
cdE15s3 = cE15s3(2:end)-cE15s3(1:end-1);
x7 = (1903:2096);
dx7 = (1903+0.5:2096-0.5);
cE15s7 = (cE15(1:end-6)+cE15(2:end-5)+cE15(3:end-4)+cE15(4:end-3)+cE15(5:end-2)+cE15(6:end-1)+cE15(7:end))/7;
cdE15s7 = cE15s7(2:end)-cE15s7(1:end-1);
x9 = (1904:2095);
dx9 = (1904+0.5:2095-0.5);
cE15s9 = (cE15(1:end-8)+cE15(2:end-7)+cE15(3:end-6)+cE15(4:end-5)+cE15(5:end-4)+cE15(6:end-3)+cE15(7:end-2)+cE15(8:end-1)+cE15(9:end))/9;
cdE15s9 = cE15s9(2:end)-cE15s9(1:end-1);
x3(find(cdE15s3<=-0.5))
x5(find(cdE15s5<=-0.5))
x7(find(cdE15s7<=-0.5))
x9(find(cdE15s9<=-0.5))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%e
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

ncload b30.030e.csim.h.aice.1870-01_cat_1999-12.nc aice tarea
e = aice(30*12+9:12:end,end-103:end,:);
ncload b30.040e.csim.h.aice.2000-01_cat_2099-12.nc aice
e = cat(1,e,aice(9:12:end,end-103:end,:));
[nt nlat nlong] = size(e);
TA = repmat(tarea(end-103:end,:),[1 1 nt]);
TA = permute(TA,[3 1 2]);

indexNaN = find(isnan(e)==1);
index15 = find(e<15);
index20 = find(e<20);
index25 = find(e<25);
index30 = find(e<30);
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index15) = NaN;
eE15 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index20) = NaN;
eE20 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index25) = NaN;
eE25 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index30) = NaN;
eE30 = nansum(nansum(tmp,2),3)/10^12;
eC = nansum(nansum(e.*TA,2),3)/10^14;
eE15s5 = (eE15(1:end-4)+eE15(2:end-3)+eE15(3:end-2)+eE15(4:end-1)+eE15(5:end))/5;
edE15s5 = eE15s5(2:end)-eE15s5(1:end-1);
eE20s5 = (eE20(1:end-4)+eE20(2:end-3)+eE20(3:end-2)+eE20(4:end-1)+eE20(5:end))/5;
edE20s5 = eE20s5(2:end)-eE20s5(1:end-1);
eE25s5 = (eE25(1:end-4)+eE25(2:end-3)+eE25(3:end-2)+eE25(4:end-1)+eE25(5:end))/5;
edE25s5 = eE25s5(2:end)-eE25s5(1:end-1);
eE30s5 = (eE30(1:end-4)+eE30(2:end-3)+eE30(3:end-2)+eE30(4:end-1)+eE30(5:end))/5;
edE30s5 = eE30s5(2:end)-eE30s5(1:end-1);
eCs5 = (eC(1:end-4)+eC(2:end-3)+eC(3:end-2)+eC(4:end-1)+eC(5:end))/5;
edCs5 = eCs5(2:end)-eCs5(1:end-1);
x = (1900:2099);
x5 = (1902:2097);
dx5 = (1902.5:1:2096.5);
x5(find(edE15s5<=-0.5))
x5(find(edE20s5<=-0.5))
x5(find(edE25s5<=-0.5))
x5(find(edE30s5<=-0.5))
x5(find(edCs5<=-0.5))

x3 = (1901:2098);
dx3 = (1901+0.5:2098-0.5);
eE15s3 = (eE15(1:end-2)+eE15(2:end-1)+eE15(3:end))/3;
edE15s3 = eE15s3(2:end)-eE15s3(1:end-1);
x7 = (1903:2096);
dx7 = (1903+0.5:2096-0.5);
eE15s7 = (eE15(1:end-6)+eE15(2:end-5)+eE15(3:end-4)+eE15(4:end-3)+eE15(5:end-2)+eE15(6:end-1)+eE15(7:end))/7;
edE15s7 = eE15s7(2:end)-eE15s7(1:end-1);
x9 = (1904:2095);
dx9 = (1904+0.5:2095-0.5);
eE15s9 = (eE15(1:end-8)+eE15(2:end-7)+eE15(3:end-6)+eE15(4:end-5)+eE15(5:end-4)+eE15(6:end-3)+eE15(7:end-2)+eE15(8:end-1)+eE15(9:end))/9;
edE15s9 = eE15s9(2:end)-eE15s9(1:end-1);
x3(find(edE15s3<=-0.5))
x5(find(edE15s5<=-0.5))
x7(find(edE15s7<=-0.5))
x9(find(edE15s9<=-0.5))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%f
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

ncload b30.030f.ES01.csim.h.aice.1870-01_cat_1999-12.nc aice
f = aice(30*12+9:12:end,end-103:end,:);
ncload b30.040f.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice tarea
f = cat(1,f,aice(9:12:end,:,:));
ncload b30.040f.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
f = cat(1,f,aice(9:12:end,:,:));
[nt nlat nlong] = size(f);
TA = repmat(tarea(end-103:end,:),[1 1 nt]);
TA = permute(TA,[3 1 2]);

indexNaN = find(isnan(f)==1);
index15 = find(f<15);
index20 = find(f<20);
index25 = find(f<25);
index30 = find(f<30);
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index15) = NaN;
fE15 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index20) = NaN;
fE20 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index25) = NaN;
fE25 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index30) = NaN;
fE30 = nansum(nansum(tmp,2),3)/10^12;
fC = nansum(nansum(f.*TA,2),3)/10^14;
fE15s5 = (fE15(1:end-4)+fE15(2:end-3)+fE15(3:end-2)+fE15(4:end-1)+fE15(5:end))/5;
fdE15s5 = fE15s5(2:end)-fE15s5(1:end-1);
fE20s5 = (fE20(1:end-4)+fE20(2:end-3)+fE20(3:end-2)+fE20(4:end-1)+fE20(5:end))/5;
fdE20s5 = fE20s5(2:end)-fE20s5(1:end-1);
fE25s5 = (fE25(1:end-4)+fE25(2:end-3)+fE25(3:end-2)+fE25(4:end-1)+fE25(5:end))/5;
fdE25s5 = fE25s5(2:end)-fE25s5(1:end-1);
fE30s5 = (fE30(1:end-4)+fE30(2:end-3)+fE30(3:end-2)+fE30(4:end-1)+fE30(5:end))/5;
fdE30s5 = fE30s5(2:end)-fE30s5(1:end-1);
fCs5 = (fC(1:end-4)+fC(2:end-3)+fC(3:end-2)+fC(4:end-1)+fC(5:end))/5;
fdCs5 = fCs5(2:end)-fCs5(1:end-1);
x = (1900:2099);
x5 = (1902:2097);
dx5 = (1902.5:1:2096.5);
x5(find(fdE15s5<=-0.5))
x5(find(fdE20s5<=-0.5))
x5(find(fdE25s5<=-0.5))
x5(find(fdE30s5<=-0.5))
x5(find(fdCs5<=-0.5))

x3 = (1901:2098);
dx3 = (1901+0.5:2098-0.5);
fE15s3 = (fE15(1:end-2)+fE15(2:end-1)+fE15(3:end))/3;
fdE15s3 = fE15s3(2:end)-fE15s3(1:end-1);
x7 = (1903:2096);
dx7 = (1903+0.5:2096-0.5);
fE15s7 = (fE15(1:end-6)+fE15(2:end-5)+fE15(3:end-4)+fE15(4:end-3)+fE15(5:end-2)+fE15(6:end-1)+fE15(7:end))/7;
fdE15s7 = fE15s7(2:end)-fE15s7(1:end-1);
x9 = (1904:2095);
dx9 = (1904+0.5:2095-0.5);
fE15s9 = (fE15(1:end-8)+fE15(2:end-7)+fE15(3:end-6)+fE15(4:end-5)+fE15(5:end-4)+fE15(6:end-3)+fE15(7:end-2)+fE15(8:end-1)+fE15(9:end))/9;
fdE15s9 = fE15s9(2:end)-fE15s9(1:end-1);
x3(find(fdE15s3<=-0.5))
x5(find(fdE15s5<=-0.5))
x7(find(fdE15s7<=-0.5))
x9(find(fdE15s9<=-0.5))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%g
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

ncload b30.030g.ES01.csim.h.aice_nh.1900-01_cat_1949-12.nc aice tarea
g = aice(9:12:end,:,:);
ncload b30.030g.ES01.csim.h.aice_nh.1950-01_cat_1999-12.nc aice
g = cat(1,g,aice(9:12:end,:,:));
ncload b30.040g.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
g = cat(1,g,aice(9:12:end,:,:));
ncload b30.040g.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
g = cat(1,g,aice(9:12:end,:,:));
[nt nlat nlong] = size(g);
TA = repmat(tarea,[1 1 nt]);
TA = permute(TA,[3 1 2]);

indexNaN = find(isnan(g)==1);
index15 = find(g<15);
index20 = find(g<20);
index25 = find(g<25);
index30 = find(g<30);
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index15) = NaN;
gE15 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index20) = NaN;
gE20 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index25) = NaN;
gE25 = nansum(nansum(tmp,2),3)/10^12;
tmp = TA;
tmp(indexNaN) = NaN;
tmp(index30) = NaN;
gE30 = nansum(nansum(tmp,2),3)/10^12;
gC = nansum(nansum(g.*TA,2),3)/10^14;
gE15s5 = (gE15(1:end-4)+gE15(2:end-3)+gE15(3:end-2)+gE15(4:end-1)+gE15(5:end))/5;
gdE15s5 = gE15s5(2:end)-gE15s5(1:end-1);
gE20s5 = (gE20(1:end-4)+gE20(2:end-3)+gE20(3:end-2)+gE20(4:end-1)+gE20(5:end))/5;
gdE20s5 = gE20s5(2:end)-gE20s5(1:end-1);
gE25s5 = (gE25(1:end-4)+gE25(2:end-3)+gE25(3:end-2)+gE25(4:end-1)+gE25(5:end))/5;
gdE25s5 = gE25s5(2:end)-gE25s5(1:end-1);
gE30s5 = (gE30(1:end-4)+gE30(2:end-3)+gE30(3:end-2)+gE30(4:end-1)+gE30(5:end))/5;
gdE30s5 = gE30s5(2:end)-gE30s5(1:end-1);
gCs5 = (gC(1:end-4)+gC(2:end-3)+gC(3:end-2)+gC(4:end-1)+gC(5:end))/5;
gdCs5 = gCs5(2:end)-gCs5(1:end-1);
x = (1900:2099);
x5 = (1902:2097);
dx5 = (1902.5:1:2096.5);
x5(find(gdE15s5<=-0.5))
x5(find(gdE20s5<=-0.5))
x5(find(gdE25s5<=-0.5))
x5(find(gdE30s5<=-0.5))
x5(find(gdCs5<=-0.5))

x3 = (1901:2098);
dx3 = (1901+0.5:2098-0.5);
gE15s3 = (gE15(1:end-2)+gE15(2:end-1)+gE15(3:end))/3;
gdE15s3 = gE15s3(2:end)-gE15s3(1:end-1);
x7 = (1903:2096);
dx7 = (1903+0.5:2096-0.5);
gE15s7 = (gE15(1:end-6)+gE15(2:end-5)+gE15(3:end-4)+gE15(4:end-3)+gE15(5:end-2)+gE15(6:end-1)+gE15(7:end))/7;
gdE15s7 = gE15s7(2:end)-gE15s7(1:end-1);
x9 = (1904:2095);
dx9 = (1904+0.5:2095-0.5);
gE15s9 = (gE15(1:end-8)+gE15(2:end-7)+gE15(3:end-6)+gE15(4:end-5)+gE15(5:end-4)+gE15(6:end-3)+gE15(7:end-2)+gE15(8:end-1)+gE15(9:end))/9;
gdE15s9 = gE15s9(2:end)-gE15s9(1:end-1);
x3(find(gdE15s3<=-0.5))
x5(find(gdE15s5<=-0.5))
x7(find(gdE15s7<=-0.5))
x9(find(gdE15s9<=-0.5))














