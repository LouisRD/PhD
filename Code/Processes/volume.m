clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

ncload b30.030a.csim.h.aice.1870-01_cat_1999-12.nc tarea aice
a = aice(30*12+1:end,lat1:lat2,long1:long2);
ncload b30.040a.csim.h.aice.2000-01_cat_2099-12.nc aice
a = cat(1,a,aice(:,lat1:lat2,long1:long2));
ncload b30.030a.csim.h.hi_nh.1900-01_cat_1949-12.nc hi 
ah = hi(:,latt1:latt2,long1:long2);
ncload b30.030a.csim.h.hi_nh.1950-01_cat_1999-12.nc hi
ah = cat(1,ah,hi(:,latt1:latt2,long1:long2));
ncload b30.040a.csim.h.hi.2000-01_cat_2099-12.nc hi
ah = cat(1,ah,hi(:,lat1:lat2,long1:long2));
[nt nlat nlong] = size(a);
TA = repmat(tarea(lat1:lat2,long1:long2),[1 1 nt]);
TA = permute(TA,[3 1 2]);
av = reshape(nansum(nansum(ah.*a/100.*TA,3),2),[12 nt/12]);

ncload b30.030b.ES01.csim.h.aice.1870-01_cat_1999-12.nc aice
b = aice(30*12+1:end,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
b = cat(1,b,aice(:,latt1:latt2,long1:long2));
ncload b30.040b.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
b = cat(1,b,aice(:,latt1:latt2,long1:long2));
ncload b30.030b.ES01.csim.h.hi.1870-01_cat_1999-12.nc hi
bh = hi(30*12+1:end,lat1:lat2,long1:long2);
ncload b30.040b.ES01.csim.h.hi_nh.2000-01_cat_2049-12.nc hi
bh = cat(1,bh,hi(:,latt1:latt2,long1:long2));
ncload b30.040b.ES01.csim.h.hi_nh.2050-01_cat_2099-12.nc hi
bh = cat(1,bh,hi(:,latt1:latt2,long1:long2));
bv = reshape(nansum(nansum(bh.*b/100.*TA,3),2),[12 nt/12]);

ncload b30.030c.csim.h.aice.1870-01_cat_1999-12.nc aice
c = aice(30*12+1:end,lat1:lat2,long1:long2);
ncload b30.040c.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
c = cat(1,c,aice(:,latt1:latt2,long1:long2));
ncload b30.040c.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
c = cat(1,c,aice(:,latt1:latt2,long1:long2));
ncload b30.030c.csim.h.hi_nh.1900-01_cat_1949-12.nc hi
ch = hi(:,latt1:latt2,long1:long2);
ncload b30.030c.csim.h.hi_nh.1950-01_cat_1999-12.nc hi
ch = cat(1,ch,hi(:,latt1:latt2,long1:long2));
ncload b30.040c.csim.h.hi_nh.2000-01_cat_2049-12.nc hi
ch = cat(1,ch,hi(:,latt1:latt2,long1:long2));
ncload b30.040c.csim.h.hi_nh.2050-01_cat_2099-12.nc hi
ch = cat(1,ch,hi(:,latt1:latt2,long1:long2));
cv = reshape(nansum(nansum(ch.*c/100.*TA,3),2),[12 nt/12]);

ncload b30.030e.csim.h.aice.1870-01_cat_1999-12.nc aice
e = aice(30*12+1:end,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.aice.2000-01_cat_2099-12.nc aice
e = cat(1,e,aice(:,lat1:lat2,long1:long2));
ncload b30.030e.csim.h.hi.1870-01_cat_1999-12.nc hi
eh = hi(30*12+1:end,lat1:lat2,long1:long2);
ncload b30.040e.csim.h.hi.2000-01_cat_2099-12.nc hi
eh = cat(1,eh,hi(:,lat1:lat2,long1:long2));
ev = reshape(nansum(nansum(eh.*e/100.*TA,3),2),[12 nt/12]);

ncload b30.030f.ES01.csim.h.aice.1870-01_cat_1999-12.nc aice
f = aice(30*12+1:end,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
f = cat(1,f,aice(:,latt1:latt2,long1:long2));
ncload b30.040f.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
f = cat(1,f,aice(:,latt1:latt2,long1:long2));
ncload b30.030f.ES01.csim.h.hi.1870-01_cat_1999-12.nc hi
fh = hi(30*12+1:end,lat1:lat2,long1:long2);
ncload b30.040f.ES01.csim.h.hi_nh.2000-01_cat_2049-12.nc hi
fh = cat(1,fh,hi(:,latt1:latt2,long1:long2));
ncload b30.040f.ES01.csim.h.hi_nh.2050-01_cat_2099-12.nc hi
fh = cat(1,fh,hi(:,latt1:latt2,long1:long2));
fv = reshape(nansum(nansum(fh.*f/100.*TA,3),2),[12 nt/12]);

ncload b30.030g.ES01.csim.h.aice_nh.1900-01_cat_1949-12.nc aice
g = aice(:,latt1:latt2,long1:long2);
ncload b30.030g.ES01.csim.h.aice_nh.1950-01_cat_1999-12.nc aice
g = cat(1,g,aice(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.aice_nh.2000-01_cat_2049-12.nc aice
g = cat(1,g,aice(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.aice_nh.2050-01_cat_2099-12.nc aice
g = cat(1,g,aice(:,latt1:latt2,long1:long2));
ncload b30.030g.ES01.csim.h.hi_nh.1900-01_cat_1949-12.nc hi
gh = hi(:,latt1:latt2,long1:long2);
ncload b30.030g.ES01.csim.h.hi_nh.1950-01_cat_1999-12.nc hi
gh = cat(1,gh,hi(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.hi_nh.2000-01_cat_2049-12.nc hi
gh = cat(1,gh,hi(:,latt1:latt2,long1:long2));
ncload b30.040g.ES01.csim.h.hi_nh.2050-01_cat_2099-12.nc hi
gh = cat(1,gh,hi(:,latt1:latt2,long1:long2));
gv = reshape(nansum(nansum(gh.*g/100.*TA,3),2),[12 nt/12]);

% save volume.mat


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%load volume.mat
[nt nlat nlong] = size(a);
TA = repmat(tarea(lat1:lat2,long1:long2),[1 1 nt]);
TA = permute(TA,[3 1 2]);

av2 = reshape(nansum(nansum(ah.*TA,3),2),[12 nt/12]);
bv2 = reshape(nansum(nansum(bh.*TA,3),2),[12 nt/12]);
cv2 = reshape(nansum(nansum(ch.*TA,3),2),[12 nt/12]);
ev2 = reshape(nansum(nansum(eh.*TA,3),2),[12 nt/12]);
fv2 = reshape(nansum(nansum(fh.*TA,3),2),[12 nt/12]);
gv2 = reshape(nansum(nansum(gh.*TA,3),2),[12 nt/12]);

save volume.mat

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Graph

x = (1900:2099);
subplot(3,2,1)
area([2036 2037], [4*10^13 4*10^13],'FaceColor', 'k','Linestyle','none');
hold on
plot(x,max(av2),'b',x,min(av2),'b','LineWidth',2)
xlim([1900 2100]);
grid on
title('a')

subplot(3,2,2)
area([2027 2028], [4*10^13 4*10^13],'FaceColor', 'k','Linestyle','none');
hold on
area([2030 2031], [4*10^13 4*10^13],'FaceColor', 'k','Linestyle','none');
plot(x,max(bv2),'b',x,min(bv2),'b','LineWidth',2)
xlim([1900 2100]);
grid on
title('b.ES01')

subplot(3,2,3)
area([2032 2033], [4*10^13 4*10^13],'FaceColor', 'k','Linestyle','none');
hold on
plot(x,max(cv2),'b',x,min(cv2),'b','LineWidth',2)
xlim([1900 2100]);
ylabel('m^3')
grid on
title('c')

subplot(3,2,4)
plot(x,max(ev2),'b',x,min(ev2),'b','LineWidth',2)
hold on
area([2032 2033], [4*10^13 4*10^13],'FaceColor', 'k','Linestyle','none');
xlim([1900 2100]);
grid on
title('e')

subplot(3,2,5)
area([2013 2015], [4*10^13 4*10^13],'FaceColor', 'k','Linestyle','none');
hold on
plot(x,max(fv2),'b',x,min(fv2),'b','LineWidth',2)
xlim([1900 2100]);
grid on
title('f.ES01')

subplot(3,2,6)
area([2044 2045], [4*10^13 4*10^13],'FaceColor', 'k','Linestyle','none');
hold on
plot(x,max(gv2),'b',x,min(gv2),'b','LineWidth',2)
xlim([1900 2100]);
grid on
title('g.ES01')

print('volume2','-djpeg')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load volume.mat

tmp = av2(9:12:end);
asv2 = (tmp(5:end)+tmp(4:end-1)+tmp(3:end-2)+tmp(2:end-3)+tmp(1:end-4))/5;
dasv2 = asv2(2:end)-asv2(1:end-1);
plot(dasv2)
max(dasv2)

tmp = bv2(9:12:end);
bsv2 = (tmp(5:end)+tmp(4:end-1)+tmp(3:end-2)+tmp(2:end-3)+tmp(1:end-4))/5;
dbsv2 = bsv2(2:end)-bsv2(1:end-1);
plot(dbsv2)
max(dbsv2)

tmp = cC(9:12:end);
csv2 = (tmp(5:end)+tmp(4:end-1)+tmp(3:end-2)+tmp(2:end-3)+tmp(1:end-4))/5;
dcsv2 = csv2(2:end)-csv2(1:end-1);
plot(dcsv2)
max(dcsv2)

tmp = eC(9:12:end);
esC = (tmp(5:end)+tmp(4:end-1)+tmp(3:end-2)+tmp(2:end-3)+tmp(1:end-4))/5;
desC = esC(2:end)-esC(1:end-1);
plot(desC)
max(desC)/10^14

tmp = fC(9:12:end);
fsC = (tmp(5:end)+tmp(4:end-1)+tmp(3:end-2)+tmp(2:end-3)+tmp(1:end-4))/5;
dfsC = fsC(2:end)-fsC(1:end-1);
plot(dfsC)
max(dfsC)/10^14

tmp = gC(9:12:end);
gsC = (tmp(5:end)+tmp(4:end-1)+tmp(3:end-2)+tmp(2:end-3)+tmp(1:end-4))/5;
dgsC = gsC(2:end)-gsC(1:end-1);
plot(dgsC)
max(dgsC)/10^14


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% graph of SIV vs Forcing
load volume.mat
xx = (1990:10:2100);
A1B = [1.03 1.33 1.65 2.16 2.84 3.61 4.16 4.79 5.28 5.62 5.86 6.05];
x = (1990:1:2099);
F = interp1(xx,A1B,x);

plot(F,mean(av2(:,end-109:end)),F,mean(bv2(:,end-109:end)),F,mean(cv2(:,end-109:end)),F,mean(ev2(:,end-109:end)),F,mean(fv2(:,end-109:end)),F,mean(gv2(:,end-109:end)))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rates of decrease to detail sea ice volume temporal evolution. 

load volume.mat
x = (1900:1:2099);

r1a = polyfit(x(50:100),squeeze(av2(9,50:100))/10^12,1); %m^3 -> 1000 km^3
% polyfit donne les coefficients en ordre décroissant de puissance
r1b = polyfit(x(50:100),squeeze(bv2(9,50:100))/10^12,1);
r1c = polyfit(x(50:100),squeeze(cv2(9,50:100))/10^12,1);
r1e = polyfit(x(50:100),squeeze(ev2(9,50:100))/10^12,1);
r1f = polyfit(x(50:100),squeeze(fv2(9,50:100))/10^12,1);
r1g = polyfit(x(50:100),squeeze(gv2(9,50:100))/10^12,1);

r1 = [r1a(1) r1b(1) r1c(1) r1e(1) r1f(1) r1g(1)];


r2a = polyfit(x(100:150),squeeze(av2(9,100:150))/10^12,1); %m^3 -> 1000 km^3
% polyfit donne les coefficients en ordre décroissant de puissance
r2b = polyfit(x(100:150),squeeze(bv2(9,100:150))/10^12,1);
r2c = polyfit(x(100:150),squeeze(cv2(9,100:150))/10^12,1);
r2e = polyfit(x(100:150),squeeze(ev2(9,100:150))/10^12,1);
r2f = polyfit(x(100:150),squeeze(fv2(9,100:150))/10^12,1);
r2g = polyfit(x(100:150),squeeze(gv2(9,100:150))/10^12,1);

r2 = [r2a(1) r2b(1) r2c(1) r2e(1) r2f(1) r2g(1)];


r3a = polyfit(x(151:end),squeeze(av2(9,151:end))/10^12,1); %m^3 -> 1000 km^3
% polyfit donne les coefficients en ordre décroissant de puissance
r3b = polyfit(x(151:end),squeeze(bv2(9,151:end))/10^12,1);
r3c = polyfit(x(151:end),squeeze(cv2(9,151:end))/10^12,1);
r3e = polyfit(x(151:end),squeeze(ev2(9,151:end))/10^12,1);
r3f = polyfit(x(151:end),squeeze(fv2(9,151:end))/10^12,1);
r3g = polyfit(x(151:end),squeeze(gv2(9,151:end))/10^12,1);

r3 = [r3a(1) r3b(1) r3c(1) r3e(1) r3f(1) r3g(1)];



% half-life for SIV vs forcing
xx = (1990:10:2100);
A1B = [1.03 1.33 1.65 2.16 2.84 3.61 4.16 4.79 5.28 5.62 5.86 6.05];
x = (1990:1:2099);
F = interp1(xx,A1B,x);

subplot(1,2,1)
plot(F,(av2(9,end-109:end))/10^12,F,(bv2(9,end-109:end))/10^12,F,(cv2(9,end-109:end))/10^12,F,(ev2(9,end-109:end))/10^12,F,(fv2(9,end-109:end))/10^12,F,(gv2(9,end-109:end))/10^12)
grid on
xlim([1 6])
ylabel('1000 km^3')
xlabel('W/m^2')
subplot(1,2,2)
semilogy(F,(av2(9,end-109:end))/10^12,F,(bv2(9,end-109:end))/10^12,F,(cv2(9,end-109:end))/10^12,F,(ev2(9,end-109:end))/10^12,F,(fv2(9,end-109:end))/10^12,F,(gv2(9,end-109:end))/10^12)
grid on
xlim([1 6])
ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0  1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
text(0.5, 0.98,'\bf September sea ice volume VS forcing','HorizontalAlignment','center')
% print('sivVSforcing','-djpeg')

rexpa = polyfit(F,log(av2(9,end-109:end)),1);
rexpb = polyfit(F,log(bv2(9,end-109:end)),1);
rexpc = polyfit(F,log(cv2(9,end-109:end)),1);
rexpe = polyfit(F,log(ev2(9,end-109:end)),1);
rexpf = polyfit(F,log(fv2(9,end-109:end)),1);
rexpg = polyfit(F,log(gv2(9,end-109:end)),1);

rhl = [log(0.5)/rexpa(1) log(0.5)/rexpb(1) log(0.5)/rexpc(1) log(0.5)/rexpe(1) log(0.5)/rexpf(1) log(0.5)/rexpg(1)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot of volume and SIE.

load volume.mat
index = find(a<15);
tmp = TA;
tmp(index) = NaN;
siea = reshape(nansum(nansum(tmp,3),2),[12 nt/12]);

index = find(b<15);
tmp = TA;
tmp(index) = NaN;
sieb = reshape(nansum(nansum(tmp,3),2),[12 nt/12]);

index = find(c<15);
tmp = TA;
tmp(index) = NaN;
siec = reshape(nansum(nansum(tmp,3),2),[12 nt/12]);

index = find(e<15);
tmp = TA;
tmp(index) = NaN;
siee = reshape(nansum(nansum(tmp,3),2),[12 nt/12]);

index = find(f<15);
tmp = TA;
tmp(index) = NaN;
sief = reshape(nansum(nansum(tmp,3),2),[12 nt/12]);

index = find(g<15);
tmp = TA;
tmp(index) = NaN;
sieg = reshape(nansum(nansum(tmp,3),2),[12 nt/12]);


dv = [(av2(9,51)-av2(9,101))/av2(9,51) (bv2(9,51)-bv2(9,101))/bv2(9,51) (cv2(9,51)-cv2(9,101))/cv2(9,51) (ev2(9,51)-ev2(9,101))/ev2(9,51) (fv2(9,51)-fv2(9,101))/fv2(9,51) (gv2(9,51)-gv2(9,101))/gv2(9,51)]
dsie = [(siea(9,51)-siea(9,101))/siea(9,51) (sieb(9,51)-sieb(9,101))/sieb(9,51) (siec(9,51)-siec(9,101))/siec(9,51) (siee(9,51)-siee(9,101))/siee(9,51) (sief(9,51)-sief(9,101))/sief(9,51) (sieg(9,51)-sieg(9,101))/sieg(9,51)]







