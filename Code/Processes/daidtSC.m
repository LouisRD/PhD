% Run after daidt.m to obtain the seasonal cycles of daidtd and daidtd. 


tmp1 = autumn(200); c1 = tmp1; % 1900 = red, 2100 = yellow
tmp2 = winter(200); c2 = tmp2; % 1900 = blue, 2100 = teal

subplot(2,3,1)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nt nlat nlong] = size(da);
tmpD = reshape(da,[12 nt/12 nlat nlong]); tmpD = nansum(nansum(tmpD.*m(:,:,lat1:lat2,long1:long2),4),3)/10^14;
tmpT = reshape(ta,[12 nt/12 nlat nlong]); tmpT = nansum(nansum(tmpT.*m(:,:,lat1:lat2,long1:long2),4),3)/10^14;
mm = (1:12);
for i=1:199
	plot(mm,tmpD(:,i),'color',c1(i,:));
	if i == 1
		hold on
	end
	plot(mm,tmpT(:,i),'color',c2(i,:));
end
hold off
caxis([1900 2100])
xlim([1 12]);%ylim([-1.5 2]*10)
set(gca,'Xtick',[(1:12)] ,'XTicklabel', {'J','F','M','A','M','J','J','A','S','O','N','D'})
ylabel('10^6 km^2/month')
title('a')
grid on
subplot(2,3,2)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nt nlat nlong] = size(db);
tmpD = reshape(db,[12 nt/12 nlat nlong]); tmpD = nansum(nansum(tmpD.*m(:,:,lat1:lat2,long1:long2),4),3)/10^14;
tmpT = reshape(tb,[12 nt/12 nlat nlong]); tmpT = nansum(nansum(tmpT.*m(:,:,lat1:lat2,long1:long2),4),3)/10^14;
for i=1:199
	plot(mm,tmpD(:,i),'color',c1(i,:));
	if i == 1
		hold on
	end
	plot(mm,tmpT(:,i),'color',c2(i,:));
end
hold off
caxis([1900 2100])
xlim([1 12]);%ylim([-1.5 2]*10)
set(gca,'Xtick',[(1:12)] ,'XTicklabel', {'J','F','M','A','M','J','J','A','S','O','N','D'})
title({'Seasonal cycle of the dynamic and thermodynamic SIA tendency';'b.ES01'})
grid on
subplot(2,3,3)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nt nlat nlong] = size(dc);
tmpD = reshape(dc,[12 nt/12 nlat nlong]); tmpD = nansum(nansum(tmpD.*m(:,:,lat1:lat2,long1:long2),4),3)/10^14;
tmpT = reshape(tc,[12 nt/12 nlat nlong]); tmpT = nansum(nansum(tmpT.*m(:,:,lat1:lat2,long1:long2),4),3)/10^14;
for i=1:199
	plot(mm,tmpD(:,i),'color',c1(i,:));
	if i == 1
		hold on
	end
	plot(mm,tmpT(:,i),'color',c2(i,:));
end
hold off
caxis([1900 2100])
xlim([1 12]);%ylim([-1.5 2]*10)
set(gca,'Xtick',[(1:12)] ,'XTicklabel', {'J','F','M','A','M','J','J','A','S','O','N','D'})
title('c')
grid on
subplot(2,3,4)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nt nlat nlong] = size(de);
tmpD = reshape(de,[12 nt/12 nlat nlong]); tmpD = nansum(nansum(tmpD.*m(:,:,lat1:lat2,long1:long2),4),3)/10^14;
tmpT = reshape(te,[12 nt/12 nlat nlong]); tmpT = nansum(nansum(tmpT.*m(:,:,lat1:lat2,long1:long2),4),3)/10^14;
for i=1:199
	plot(mm,tmpD(:,i),'color',c1(i,:));
	if i == 1
		hold on
	end
	plot(mm,tmpT(:,i),'color',c2(i,:));
end
hold off
caxis([1900 2100])
xlim([1 12]);%ylim([-1.5 2]*10)
set(gca,'Xtick',[(1:12)] ,'XTicklabel', {'J','F','M','A','M','J','J','A','S','O','N','D'})
ylabel('10^6 km^2/month')
title('e')
grid on
subplot(2,3,5)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nt nlat nlong] = size(df);
tmpD = reshape(df,[12 nt/12 nlat nlong]); tmpD = nansum(nansum(tmpD.*m(:,:,lat1:lat2,long1:long2),4),3)/10^14;
tmpT = reshape(tf,[12 nt/12 nlat nlong]); tmpT = nansum(nansum(tmpT.*m(:,:,lat1:lat2,long1:long2),4),3)/10^14;
for i=1:199
	plot(mm,tmpD(:,i),'color',c1(i,:));
	if i == 1
		hold on
	end
	plot(mm,tmpT(:,i),'color',c2(i,:));
end
hold off
caxis([1900 2100])
xlim([1 12]);%ylim([-1.5 2]*10)
set(gca,'Xtick',[(1:12)] ,'XTicklabel', {'J','F','M','A','M','J','J','A','S','O','N','D'})
title('f.ES01')
grid on
subplot(2,3,6)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nt nlat nlong] = size(dg);
tmpD = reshape(dg,[12 nt/12 nlat nlong]); tmpD = nansum(nansum(tmpD.*m(:,:,lat1:lat2,long1:long2),4),3)/10^14;
tmpT = reshape(tg,[12 nt/12 nlat nlong]); tmpT = nansum(nansum(tmpT.*m(:,:,lat1:lat2,long1:long2),4),3)/10^14;
for i=1:199
	plot(mm,tmpD(:,i),'color',c1(i,:));
	if i == 1
		hold on
	end
	plot(mm,tmpT(:,i),'color',c2(i,:));
end
hold off
caxis([1900 2100])
xlim([1 12]);%ylim([-1.5 2]*10)
set(gca,'Xtick',[(1:12)] ,'XTicklabel', {'J','F','M','A','M','J','J','A','S','O','N','D'})
title('g.ES01')
grid on
% print('SCdynVStherm','-djpeg')




