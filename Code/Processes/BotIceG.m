%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ice bottom fluxes graph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load BotIce.mat

[nt nlat nlong] = size(foia);
foiay = nanmean(nanmean(nanmean(reshape(foia,[12 nt/12 nlat nlong]),4),3),1);
foiby = nanmean(nanmean(nanmean(reshape(foib,[12 nt/12 nlat nlong]),4),3),1);
foicy = nanmean(nanmean(nanmean(reshape(foic,[12 nt/12 nlat nlong]),4),3),1);
foiey = nanmean(nanmean(nanmean(reshape(foie,[12 nt/12 nlat nlong]),4),3),1);
foify = nanmean(nanmean(nanmean(reshape(foif,[12 nt/12 nlat nlong]),4),3),1);
foigy = nanmean(nanmean(nanmean(reshape(foig,[12 nt/12 nlat nlong]),4),3),1);
foi = [foiay' foiby' foicy' foiey' foify' foigy'];

ua = nanmean(nanmean(nanmean(reshape(ua,[12 nt/12 nlat nlong]),4),3),1);
ub = nanmean(nanmean(nanmean(reshape(ub,[12 nt/12 nlat nlong]),4),3),1);
uc = nanmean(nanmean(nanmean(reshape(uc,[12 nt/12 nlat nlong]),4),3),1);
ue = nanmean(nanmean(nanmean(reshape(ue,[12 nt/12 nlat nlong]),4),3),1);
uf = nanmean(nanmean(nanmean(reshape(uf,[12 nt/12 nlat nlong]),4),3),1);
ug = nanmean(nanmean(nanmean(reshape(ug,[12 nt/12 nlat nlong]),4),3),1);
ustar = [ua' ub' uc' ue' uf' ug'];


t = {'a','b.ES01','c','e','f.ES01','g.ES01'};
ry = [2036 2027 2032 2032 2013 2044];
ryb = 2030;
Mx = -20;
Mn = -140;

x = (1900:2099);
for i=1:6
subplot(2,3,i)
plot(x,foi(:,i),'LineWidth',2)
title(t(i))
grid on
hold on
area([ry(i) ry(i)+1], [Mx Mx],'FaceColor', 'k','Linestyle','none');
area([ry(i) ry(i)+1], [Mn Mn],'FaceColor', 'k','Linestyle','none');
ylim([Mn Mx])
xticks([1900 1950 2000 2050 2100])
xticklabels({'1900' '' '2000' '' '2100'})
end
subplot(2,3,1)
ylabel('W/m^2')
subplot(2,3,4)
ylabel('W/m^2')
subplot(2,3,2)
area([ryb ryb+1], [Mx Mx],'FaceColor', 'k','Linestyle','none');
area([ryb ryb+1], [Mn Mn],'FaceColor', 'k','Linestyle','none');

print('BotIce','-djpeg')


t = {'a','b.ES01','c','e','f.ES01','g.ES01'};
ry = [2036 2027 2032 2032 2013 2044];
ryb = 2030;
Mx = 0.16;
Mn = 0.11;

x = (1900:2099);
for i=1:6
subplot(2,3,i)
plot(x,ustar(:,i),'LineWidth',2)
title(t(i))
grid on
hold on
area([ry(i) ry(i)+1], [Mx Mx],'FaceColor', 'k','Linestyle','none');
area([ry(i) ry(i)+1], [Mn Mn],'FaceColor', 'k','Linestyle','none');
ylim([Mn Mx])
xticks([1900 1950 2000 2050 2100])
xticklabels({'1900' '' '2000' '' '2100'})
end
subplot(2,3,1)
ylabel('m/s')
subplot(2,3,4)
ylabel('m/s')
subplot(2,3,2)
area([ryb ryb+1], [Mx Mx],'FaceColor', 'k','Linestyle','none');
area([ryb ryb+1], [Mn Mn],'FaceColor', 'k','Linestyle','none');

print('Ustar','-djpeg')


tmp = zeros(40,6);
for i=1:40
	tmp(i,:) = max(ustar((i-1)*5+1:i*5,:))-min(ustar((i-1)*5+1:i*5,:));
end

tmp = zeros(20,6);
for i=1:20
	tmp(i,:) = max(ustar((i-1)*10+1:i*10,:))-min(ustar((i-1)*10+1:i*10,:));
end


