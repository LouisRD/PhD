clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

ncload b30.030a.csim.h.strairx.1870-01_cat_1999-12.nc strairx
tmpx = strairx(12*30+1:end,end-103:end,:);
ncload b30.040a.csim.h.strairx.2000-01_cat_2099-12.nc strairx
tmpx = cat(1,tmpx,strairx(:,end-103:end,:));
ncload b30.030a.csim.h.strairy.1870-01_cat_1999-12.nc strairy
tmpy = strairy(12*30+1:end,end-103:end,:);
ncload b30.040a.csim.h.strairy.2000-01_cat_2099-12.nc strairy     
tmpy = cat(1,tmpy,strairy(:,end-103:end,:));
wa = sqrt(tmpx.^2 + tmpy.^2);

ncload b30.030b.ES01.csim.h.strairx.1870-01_cat_1999-12.nc strairx
tmpx = strairx(12*30+1:end,end-103:end,:);
ncload b30.040b.ES01.csim.h.strairx_nh.2000-01_cat_2049-12.nc strairx
tmpx = cat(1,tmpx,strairx);
ncload b30.040b.ES01.csim.h.strairx_nh.2050-01_cat_2099-12.nc strairx  
tmpx = cat(1,tmpx,strairx);
ncload b30.030b.ES01.csim.h.strairy.1870-01_cat_1999-12.nc strairy
tmpy = strairy(12*30+1:end,end-103:end,:);
ncload b30.040b.ES01.csim.h.strairy_nh.2000-01_cat_2049-12.nc strairy     
tmpy = cat(1,tmpy,strairy);
ncload b30.040b.ES01.csim.h.strairy_nh.2050-01_cat_2099-12.nc strairy    
tmpy = cat(1,tmpy,strairy);
wb = sqrt(tmpx.^2 + tmpy.^2);

ncload b30.030c.csim.h.strairx.1870-01_cat_1999-12.nc strairx
tmpx = strairx(12*30+1:end,end-103:end,:);
ncload b30.040c.csim.h.strairx_nh.2000-01_cat_2049-12.nc strairx
tmpx = cat(1,tmpx,strairx);
ncload b30.040c.csim.h.strairx_nh.2050-01_cat_2099-12.nc strairx  
tmpx = cat(1,tmpx,strairx);
ncload b30.030c.csim.h.strairy.1870-01_cat_1999-12.nc strairy
tmpy = strairy(12*30+1:end,end-103:end,:);
ncload b30.040c.csim.h.strairy_nh.2000-01_cat_2049-12.nc strairy     
tmpy = cat(1,tmpy,strairy);
ncload b30.040c.csim.h.strairy_nh.2050-01_cat_2099-12.nc strairy    
tmpy = cat(1,tmpy,strairy);
wc = sqrt(tmpx.^2 + tmpy.^2);

ncload b30.030e.csim.h.strairx.1870-01_cat_1999-12.nc strairx
tmpx = strairx(12*30+1:end,end-103:end,:);
ncload b30.040e.csim.h.strairx.2000-01_cat_2099-12.nc strairx
tmpx = cat(1,tmpx,strairx(:,end-103:end,:));
ncload b30.030e.csim.h.strairy.1870-01_cat_1999-12.nc strairy
tmpy = strairy(12*30+1:end,end-103:end,:);
ncload b30.040e.csim.h.strairy.2000-01_cat_2099-12.nc strairy     
tmpy = cat(1,tmpy,strairy(:,end-103:end,:));
we = sqrt(tmpx.^2 + tmpy.^2);

ncload b30.030f.ES01.csim.h.strairx.1870-01_cat_1999-12.nc strairx
tmpx = strairx(12*30+1:end,end-103:end,:);
ncload b30.040f.ES01.csim.h.strairx_nh.2000-01_cat_2049-12.nc strairx
tmpx = cat(1,tmpx,strairx);
ncload b30.040f.ES01.csim.h.strairx_nh.2050-01_cat_2099-12.nc strairx  
tmpx = cat(1,tmpx,strairx);
ncload b30.030f.ES01.csim.h.strairy.1870-01_cat_1999-12.nc strairy
tmpy = strairy(12*30+1:end,end-103:end,:);
ncload b30.040f.ES01.csim.h.strairy_nh.2000-01_cat_2049-12.nc strairy     
tmpy = cat(1,tmpy,strairy);
ncload b30.040f.ES01.csim.h.strairy_nh.2050-01_cat_2099-12.nc strairy    
tmpy = cat(1,tmpy,strairy);
wf = sqrt(tmpx.^2 + tmpy.^2);

ncload b30.030g.ES01.csim.h.strairx_nh.1900-01_cat_1949-12.nc strairx   
tmpx = strairx;
ncload b30.030g.ES01.csim.h.strairx_nh.1950-01_cat_1999-12.nc strairx   
tmpx = cat(1,tmpx,strairx);
ncload b30.040g.ES01.csim.h.strairx_nh.2000-01_cat_2049-12.nc strairx
tmpx = cat(1,tmpx,strairx);
ncload b30.040g.ES01.csim.h.strairx_nh.2050-01_cat_2099-12.nc strairx  
tmpx = cat(1,tmpx,strairx);
ncload b30.030g.ES01.csim.h.strairy_nh.1900-01_cat_1949-12.nc strairy   
tmpy = strairy;
ncload b30.030g.ES01.csim.h.strairy_nh.1950-01_cat_1999-12.nc strairy   
tmpy = cat(1,tmpy,strairy);
ncload b30.040g.ES01.csim.h.strairy_nh.2000-01_cat_2049-12.nc strairy     
tmpy = cat(1,tmpy,strairy);
ncload b30.040g.ES01.csim.h.strairy_nh.2050-01_cat_2099-12.nc strairy    
tmpy = cat(1,tmpy,strairy);
wg = sqrt(tmpx.^2 + tmpy.^2);

clearvars tmpx tmpy strairy strairx

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Graph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
load wind.mat

index = find(wa==0);
wa(index) = NaN;
index = find(wb==0);
wb(index) = NaN;
index = find(wc==0);
wc(index) = NaN;
index = find(we==0);
we(index) = NaN;
index = find(wf==0);
wf(index) = NaN;
index = find(wg==0);
wg(index) = NaN;
[nt nlat nlong] = size(wa);
x = (1900:2099);

subplot(3,2,1)
tmp = reshape(wa,[12 nt/12 nlat nlong]);
plot(x,nanmean(nanmean(nanmean(tmp,4),3),1),'LineWidth',2)
hold on
plot(x,nanmax(nanmean(nanmean(tmp,4),3),[],1))
plot(x,nanmin(nanmean(nanmean(tmp,4),3),[],1))
area([2036 2037], [0.1 0.1],'FaceColor', 'k','Linestyle','none');
hold off
title('a')

subplot(3,2,2)
tmp = reshape(wb,[12 nt/12 nlat nlong]);
plot(x,nanmean(nanmean(nanmean(tmp,4),3),1),'LineWidth',2)
hold on
plot(x,nanmax(nanmean(nanmean(tmp,4),3),[],1))
plot(x,nanmin(nanmean(nanmean(tmp,4),3),[],1))
area([2027 2028], [0.1 0.1],'FaceColor', 'k','Linestyle','none');
area([2030 2031], [0.1 0.1],'FaceColor', 'k','Linestyle','none');
hold off
title('b')

subplot(3,2,3)
tmp = reshape(wc,[12 nt/12 nlat nlong]);
plot(x,nanmean(nanmean(nanmean(tmp,4),3),1),'LineWidth',2)
hold on
plot(x,nanmax(nanmean(nanmean(tmp,4),3),[],1))
plot(x,nanmin(nanmean(nanmean(tmp,4),3),[],1))
area([2032 2033], [0.1 0.1],'FaceColor', 'k','Linestyle','none');
hold off
title('c')
ylabel('Norm of the Ice-Wind Stress ')

subplot(3,2,4)
tmp = reshape(we,[12 nt/12 nlat nlong]);
plot(x,nanmean(nanmean(nanmean(tmp,4),3),1),'LineWidth',2)
hold on
plot(x,nanmax(nanmean(nanmean(tmp,4),3),[],1))
plot(x,nanmin(nanmean(nanmean(tmp,4),3),[],1))
area([2032 2033], [0.1 0.1],'FaceColor', 'k','Linestyle','none');
hold off
title('e')

subplot(3,2,5)
tmp = reshape(wf,[12 nt/12 nlat nlong]);
plot(x,nanmean(nanmean(nanmean(tmp,4),3),1),'LineWidth',2)
hold on
plot(x,nanmax(nanmean(nanmean(tmp,4),3),[],1))
plot(x,nanmin(nanmean(nanmean(tmp,4),3),[],1))
area([2013 2015], [0.1 0.1],'FaceColor', 'k','Linestyle','none');
hold off
title('f')

subplot(3,2,6)
tmp = reshape(wg,[12 nt/12 nlat nlong]);
plot(x,nanmean(nanmean(nanmean(tmp,4),3),1),'LineWidth',2)
hold on
plot(x,nanmax(nanmean(nanmean(tmp,4),3),[],1))
plot(x,nanmin(nanmean(nanmean(tmp,4),3),[],1))
area([2044 2045], [0.1 0.1],'FaceColor', 'k','Linestyle','none');
hold off
title('g')

print('wind','-djpeg')





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
load wind.mat

index = find(wa==0);
wa(index) = NaN;
index = find(wb==0);
wb(index) = NaN;
index = find(wc==0);
wc(index) = NaN;
index = find(we==0);
we(index) = NaN;
index = find(wf==0);
wf(index) = NaN;
index = find(wg==0);
wg(index) = NaN;
[nt nlat nlong] = size(wa);
x = (1900:2099);

subplot(3,2,1)
tmp = reshape(wa,[12 nt/12 nlat nlong]);
plot(x,nanmean(nanmean(nanmean(tmp,4),3),1),'LineWidth',2)
hold on
plot(x,nanmax(nanmean(nanmean(tmp,4),3),[],1),'c')
plot(x,nanmax(nanmax(nanmax(tmp,[],4),[],3),[],1),'r')
area([2036 2037], [1 1],'FaceColor', 'k','Linestyle','none');
hold off
grid on
title('a')

subplot(3,2,2)
tmp = reshape(wb,[12 nt/12 nlat nlong]);
plot(x,nanmean(nanmean(nanmean(tmp,4),3),1),'LineWidth',2)
hold on
plot(x,nanmax(nanmean(nanmean(tmp,4),3),[],1),'c')
plot(x,nanmax(nanmax(nanmax(tmp,[],4),[],3),[],1),'r')
area([2027 2028], [1 1],'FaceColor', 'k','Linestyle','none');
area([2030 2031], [1 1],'FaceColor', 'k','Linestyle','none');
hold off
grid on
title('b')

subplot(3,2,3)
tmp = reshape(wc,[12 nt/12 nlat nlong]);
plot(x,nanmean(nanmean(nanmean(tmp,4),3),1),'LineWidth',2)
hold on
plot(x,nanmax(nanmean(nanmean(tmp,4),3),[],1),'c')
plot(x,nanmax(nanmax(nanmax(tmp,[],4),[],3),[],1),'r')
area([2032 2033], [1 1],'FaceColor', 'k','Linestyle','none');
hold off
grid on
title('c')
ylabel('Norm of the Ice-Wind Stress ')

subplot(3,2,4)
tmp = reshape(we,[12 nt/12 nlat nlong]);
plot(x,nanmean(nanmean(nanmean(tmp,4),3),1),'LineWidth',2)
hold on
plot(x,nanmax(nanmean(nanmean(tmp,4),3),[],1),'c')
plot(x,nanmax(nanmax(nanmax(tmp,[],4),[],3),[],1),'r')
area([2032 2033], [1 1],'FaceColor', 'k','Linestyle','none');
hold off
grid on
title('e')

subplot(3,2,5)
tmp = reshape(wf,[12 nt/12 nlat nlong]);
plot(x,nanmean(nanmean(nanmean(tmp,4),3),1),'LineWidth',2)
hold on
plot(x,nanmax(nanmean(nanmean(tmp,4),3),[],1),'c')
plot(x,nanmax(nanmax(nanmax(tmp,[],4),[],3),[],1),'r')
area([2013 2015], [1 1],'FaceColor', 'k','Linestyle','none');
hold off
grid on
title('f')

subplot(3,2,6)
tmp = reshape(wg,[12 nt/12 nlat nlong]);
plot(x,nanmean(nanmean(nanmean(tmp,4),3),1),'LineWidth',2)
hold on
plot(x,nanmax(nanmean(nanmean(tmp,4),3),[],1),'c')
plot(x,nanmax(nanmax(nanmax(tmp,[],4),[],3),[],1),'r')
area([2044 2045], [1 1],'FaceColor', 'k','Linestyle','none');
hold off
grid on
title('g')

%print('wind2','-djpeg')












