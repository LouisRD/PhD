clear 
load Gates3.mat
load conv3.mat
load Gates3VT.mat
F3conv200 = repmat(Fconv,[20 1 1])/10^12;
BA3conv200 = repmat(BAconv,[20 1 1])/10^12;
C3conv200 = repmat(Cconv,[20 1 1])/10^12;
BE3conv200 = repmat(BEconv,[20 1 1])/10^12;
load Gates4.mat
load conv4.mat
load Gates4VT.mat
F4conv200 = repmat(Fconv4,[20 1 1])/10^12;
BA4conv200 = repmat(BAconv4,[20 1 1])/10^12;
C4conv200 = repmat(Cconv4,[20 1 1])/10^12;
BE4conv200 = repmat(BEconv4,[20 1 1])/10^12;



lat1barents = 334;
lat2barents = 369;
longbarents = 100;
addpath /glade/u/home/renaud/scripts
ncload b30.030b.ES01.pop.h.1931-07.nc HTE HTN z_w dz
z3 = z_w/100; 
[nt nz n] = size(BAbT);
tmpHTE = repmat(squeeze(HTE(lat1barents:lat2barents,longbarents)),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:16),[1 nt n]);
tmpz = permute(tmpz,[2 1 3]);
sA3 = tmpHTE.*tmpz/100^2/10^6/100;
ncload b40.20th.track1.1deg.012.pop.h.1983-09.nc z_w dz
z4 = z_w/100; 
[nt nz n] = size(BA12T);
tmpHTE = repmat(squeeze(HTE(lat1barents:lat2barents,longbarents)),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:30),[1 nt n]); 
tmpz = permute(tmpz,[2 1 3]);
sA4 = tmpHTE.*tmpz/100^2/10^6/100;


tmp = zeros(lat2barents-lat1barents+1,1);
for i = 2:lat2barents-lat1barents+1
	tmp(i) = sum(HTE(lat1barents:lat1barents+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(3);

BAu3 = (BAbU+BAcU+BAeU+BAfU+BAgU)/5;
BAu4 = (BA5U+BA6U+BA7U+BA8U+BA9U+BA12U)/6;

index = find(BAbU==0); tmpb = BAbU.*sA3; tmpb(index)= NaN;
indexOut = find(BAbU<0); tmpIn = tmpb; tmpIn(indexOut) = NaN; tmpInb = nansum(nansum(tmpIn,3),2);
indexIn = find(BAbU>0); tmpOut = tmpb; tmpOut(indexIn) = NaN; tmpOutb = nansum(nansum(tmpOut,3),2);

index = find(BAcU==0); tmpc = BAcU.*sA3; tmpc(index)= NaN;
indexOut = find(BAcU<0); tmpIn = tmpc; tmpIn(indexOut) = NaN; tmpInc = nansum(nansum(tmpIn,3),2);
indexIn = find(BAcU>0); tmpOut = tmpc; tmpOut(indexIn) = NaN; tmpOutc = nansum(nansum(tmpOut,3),2);

index = find(BAeU==0); tmpe = BAeU.*sA3; tmpe(index)= NaN;
indexOut = find(BAeU<0); tmpIn = tmpe; tmpIn(indexOut) = NaN; tmpIne = nansum(nansum(tmpIn,3),2);
indexIn = find(BAeU>0); tmpOut = tmpe; tmpOut(indexIn) = NaN; tmpOute = nansum(nansum(tmpOut,3),2);

index = find(BAfU==0); tmpf = BAfU.*sA3; tmpf(index)= NaN;
indexOut = find(BAfU<0); tmpIn = tmpf; tmpIn(indexOut) = NaN; tmpInf = nansum(nansum(tmpIn,3),2);
indexIn = find(BAfU>0); tmpOut = tmpf; tmpOut(indexIn) = NaN; tmpOutf = nansum(nansum(tmpOut,3),2);

index = find(BAgU==0); tmpg = BAgU.*sA3; tmpg(index)= NaN;
indexOut = find(BAgU<0); tmpIn = tmpg; tmpIn(indexOut) = NaN; tmpIng = nansum(nansum(tmpIn,3),2);
indexIn = find(BAgU>0); tmpOut = tmpg; tmpOut(indexIn) = NaN; tmpOutg = nansum(nansum(tmpOut,3),2);

BAU3 = (tmpb+tmpc+tmpe+tmpf+tmpg)/5;
BAU3In = (tmpInb+tmpInc+tmpIne+tmpInf+tmpIng)/5;
BAU3Out = (tmpOutb+tmpOutc+tmpOute+tmpOutf+tmpOutg)/5;

index = find(BA5U==0); tmp5 = BA5U.*sA4; tmp5(index)= NaN;
indexOut = find(BA5U<0); tmpIn = tmp5; tmpIn(indexOut) = NaN; tmpIn5 = nansum(nansum(tmpIn,3),2);
indexIn = find(BA5U>0); tmpOut = tmp5; tmpOut(indexIn) = NaN; tmpOut5 = nansum(nansum(tmpOut,3),2);

index = find(BA6U==0); tmp6 = BA6U.*sA4; tmp6(index)= NaN;
indexOut = find(BA6U<0); tmpIn = tmp6; tmpIn(indexOut) = NaN; tmpIn6 = nansum(nansum(tmpIn,3),2);
indexIn = find(BA6U>0); tmpOut = tmp6; tmpOut(indexIn) = NaN; tmpOut6 = nansum(nansum(tmpOut,3),2);

index = find(BA7U==0); tmp7 = BA7U.*sA4; tmp7(index)= NaN;
indexOut = find(BA7U<0); tmpIn = tmp7; tmpIn(indexOut) = NaN; tmpIn7 = nansum(nansum(tmpIn,3),2);
indexIn = find(BA7U>0); tmpOut = tmp7; tmpOut(indexIn) = NaN; tmpOut7 = nansum(nansum(tmpOut,3),2);

index = find(BA8U==0); tmp8 = BA8U.*sA4; tmp8(index)= NaN;
indexOut = find(BA8U<0); tmpIn = tmp8; tmpIn(indexOut) = NaN; tmpIn8 = nansum(nansum(tmpIn,3),2);
indexIn = find(BA8U>0); tmpOut = tmp8; tmpOut(indexIn) = NaN; tmpOut8 = nansum(nansum(tmpOut,3),2);

index = find(BA9U==0); tmp9 = BA9U.*sA4; tmp9(index)= NaN;
indexOut = find(BA9U<0); tmpIn = tmp9; tmpIn(indexOut) = NaN; tmpIn9 = nansum(nansum(tmpIn,3),2);
indexIn = find(BA9U>0); tmpOut = tmp9; tmpOut(indexIn) = NaN; tmpOut9 = nansum(nansum(tmpOut,3),2);

index = find(BA12U==0); tmp12 = BA12U.*sA4; tmp12(index)= NaN;
indexOut = find(BA12U<0); tmpIn = tmp12; tmpIn(indexOut) = NaN; tmpIn12 = nansum(nansum(tmpIn,3),2);
indexIn = find(BA12U>0); tmpOut = tmp12; tmpOut(indexIn) = NaN; tmpOut12 = nansum(nansum(tmpOut,3),2);


BAU4 = (tmp5+tmp6+tmp7+tmp8+tmp9+tmp12)/6;
BAU4In = (tmpIn5+tmpIn6+tmpIn7+tmpIn8+tmpIn9+tmpIn12)/6;
BAU4Out = (tmpOut5+tmpOut6+tmpOut7+tmpOut8+tmpOut9+tmpOut12)/6;


index = find(BAbU==0); tmpTb = BAbT; tmpTb(index)= NaN;
indexOut = find(BAbU<0); tmpTIn = tmpTb; tmpTIn(indexOut) = NaN; tmpTInb = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(BAbU>0); tmpTOut = tmpTb; tmpTOut(indexIn) = NaN; tmpTOutb = nanmean(nanmean(tmpTOut,3),2);

index = find(BAcU==0); tmpTc = BAcT; tmpTc(index)= NaN;
indexOut = find(BAcU<0); tmpTIn = tmpTc; tmpTIn(indexOut) = NaN; tmpTInc = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(BAcU>0); tmpTOut = tmpTc; tmpTOut(indexIn) = NaN; tmpTOutc = nanmean(nanmean(tmpTOut,3),2);

index = find(BAeU==0); tmpTe = BAeT; tmpTe(index)= NaN;
indexOut = find(BAeU<0); tmpTIn = tmpTe; tmpTIn(indexOut) = NaN; tmpTIne = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(BAeU>0); tmpTOut = tmpTe; tmpTOut(indexIn) = NaN; tmpTOute = nanmean(nanmean(tmpTOut,3),2);

index = find(BAfU==0); tmpTf = BAfT; tmpTf(index)= NaN;
indexOut = find(BAfU<0); tmpTIn = tmpTf; tmpTIn(indexOut) = NaN; tmpTInf = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(BAfU>0); tmpTOut = tmpTf; tmpTOut(indexIn) = NaN; tmpTOutf = nanmean(nanmean(tmpTOut,3),2);

index = find(BAgU==0); tmpTg = BAgT; tmpTg(index)= NaN;
indexOut = find(BAgU<0); tmpTIn = tmpTg; tmpTIn(indexOut) = NaN; tmpTIng = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(BAgU>0); tmpTOut = tmpTg; tmpTOut(indexIn) = NaN; tmpTOutg = nanmean(nanmean(tmpTOut,3),2);

BAT3 = (tmpTb+tmpTc+tmpTe+tmpTf+tmpTg)/5;
BAT3In = (tmpTInb+tmpTInc+tmpTIne+tmpTInf+tmpTIng)/5;
BAT3Out = (tmpTOutb+tmpTOutc+tmpTOute+tmpTOutf+tmpTOutg)/5;


index = find(BA5U==0); tmpT5 = BA5T; tmpT5(index)= NaN;
indexOut = find(BA5U<0); tmpTIn = tmpT5; tmpTIn(indexOut) = NaN; tmpTIn5 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(BA5U>0); tmpTOut = tmpT5; tmpTOut(indexIn) = NaN; tmpTOut5 = nanmean(nanmean(tmpTOut,3),2);

index = find(BA6U==0); tmpT6 = BA6T; tmpT6(index)= NaN;
indexOut = find(BA6U<0); tmpTIn = tmpT6; tmpTIn(indexOut) = NaN; tmpTIn6 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(BA6U>0); tmpTOut = tmpT6; tmpTOut(indexIn) = NaN; tmpTOut6 = nanmean(nanmean(tmpTOut,3),2);

index = find(BA7U==0); tmpT7 = BA7T; tmpT7(index)= NaN;
indexOut = find(BA7U<0); tmpTIn = tmpT7; tmpTIn(indexOut) = NaN; tmpTIn7 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(BA7U>0); tmpTOut = tmpT7; tmpTOut(indexIn) = NaN; tmpTOut7 = nanmean(nanmean(tmpTOut,3),2);

index = find(BA8U==0); tmpT8 = BA8T; tmpT8(index)= NaN;
indexOut = find(BA8U<0); tmpTIn = tmpT8; tmpTIn(indexOut) = NaN; tmpTIn8 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(BA8U>0); tmpTOut = tmpT8; tmpTOut(indexIn) = NaN; tmpTOut8 = nanmean(nanmean(tmpTOut,3),2);

index = find(BA9U==0); tmpT9 = BA9T; tmpT9(index)= NaN;
indexOut = find(BA9U<0); tmpTIn = tmpT9; tmpTIn(indexOut) = NaN; tmpTIn9 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(BA9U>0); tmpTOut = tmpT9; tmpTOut(indexIn) = NaN; tmpTOut9 = nanmean(nanmean(tmpTOut,3),2);

index = find(BA12U==0); tmpT12 = BA12T; tmpT12(index)= NaN;
indexOut = find(BA12U<0); tmpTIn = tmpT12; tmpTIn(indexOut) = NaN; tmpTIn12 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(BA12U>0); tmpTOut = tmpT12; tmpTOut(indexIn) = NaN; tmpTOut12 = nanmean(nanmean(tmpTOut,3),2);

BAT4 = (tmpT5+tmpT6+tmpT7+tmpT8+tmpT9+tmpT12)/6;
BAT4In = (tmpTIn5+tmpTIn6+tmpTIn7+tmpTIn8+tmpTIn9+tmpTIn12)/6;
BAT4Out = (tmpTOut5+tmpTOut6+tmpTOut7+tmpTOut8+tmpTOut9+tmpTOut12)/6;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%


BAM3 = (BAb+BAc+BAe+BAf+BAg)/5;
BAM4 = (BA5+BA6+BA7+BA8+BA9+BA12)/6;

x = (1900:2099);


subplot(4,2,[1 2])

plot(x,nansum(nansum(BAb.*BA3conv200,3),2),'b',...
	x,nansum(nansum(BA5.*BA4conv200,3),2),'r',...
	x,nansum(nansum(BAc.*BA3conv200,3),2),'b',...
	x,nansum(nansum(BAe.*BA3conv200,3),2),'b',...
	x,nansum(nansum(BAf.*BA3conv200,3),2),'b',...
	x,nansum(nansum(BAg.*BA3conv200,3),2),'b',...
	x,nansum(nansum(BA6.*BA4conv200,3),2),'r',...
	x,nansum(nansum(BA7.*BA4conv200,3),2),'r',...
	x,nansum(nansum(BA8.*BA4conv200,3),2),'r',...
	x,nansum(nansum(BA9.*BA4conv200,3),2),'r',...
	x,nansum(nansum(BA12.*BA4conv200,3),2),'r')
grid on 
hold on
plot(x,nansum(nansum(BAM3.*BA3conv200,3),2),'b',...
	x,nansum(nansum(BAM4.*BA4conv200,3),2),'r','linewidth',3)
hold off
%legend('CCSM3','CCSM4','location','southwest')
ylabel('TW')
ylim([-10 200])
yticks((0:50:200))
title('Energy transport','FontWeight','Normal')

subplot(4,2,3)
plot(x,nansum(nansum(BAU3,3),2),'b',x,nansum(nansum(BAU4,3),2),'r','Linewidth',3)
hold on
plot(x,nansum(nansum(tmpb,3),2),'b',x,nansum(nansum(tmpc,3),2),'b',x,nansum(nansum(tmpe,3),2),'b',x,nansum(nansum(tmpf,3),2),'b',x,nansum(nansum(tmpg,3),2),'b')
plot(x,nansum(nansum(tmp5,3),2),'r',x,nansum(nansum(tmp6,3),2),'r',x,nansum(nansum(tmp7,3),2),'r',x,nansum(nansum(tmp8,3),2),'r',x,nansum(nansum(tmp9,3),2),'r',x,nansum(nansum(tmp12,3),2),'r')
hold off
title('Volume transport','FontWeight','Normal')
xticks((1900:50:2100))
xticklabels({'','','','',''})
ylabel('Sv')
ylim([0 7])
yticks((0:2:7))
grid on

subplot(4,2,5)
plot(x,BAU3In,'b',x,BAU4In,'r','Linewidth',3)
%legend('CCSM3','CCSM4','location','northwest')
hold on
plot(x,tmpInb,'b',x,tmpInc,'b',x,tmpIne,'b',x,tmpInf,'b',x,tmpIng,'b')
plot(x,tmpIn5,'r',x,tmpIn6,'r',x,tmpIn7,'r',x,tmpIn8,'r',x,tmpIn9,'r',x,tmpIn12,'r')
hold off
title('Inflow','FontWeight','Normal')
xticks((1900:50:2100))
xticklabels({'','','','',''})
%yticks((0:2:10))
%ylim([0 10])
ylabel('Sv')
ylim([0 7])
yticks((0:2:7))
grid on

subplot(4,2,7);
plot(x,-BAU3Out,'b',x,-BAU4Out,'r','Linewidth',3)
hold on
plot(x,-tmpOutb,'b',x,-tmpOutc,'b',x,-tmpOute,'b',x,-tmpOutf,'b',x,-tmpOutg,'b')
plot(x,-tmpOut5,'r',x,-tmpOut6,'r',x,-tmpOut7,'r',x,-tmpOut8,'r',x,-tmpOut9,'r',x,-tmpOut12,'r')
hold off
title('Outflow','FontWeight','Normal')
xticks((1900:50:2100))
ylim([0 2])
yticks((0:2))
ylabel('Sv')
grid on


subplot(4,2,4)
plot(x,nanmean(nanmean(BAT3,3),2),'b',x,nanmean(nanmean(BAT4,3),2),'r','Linewidth',3)
hold on
plot(x,nanmean(nanmean(tmpTb,3),2),'b',x,nanmean(nanmean(tmpTc,3),2),'b',x,nanmean(nanmean(tmpTe,3),2),'b',x,nanmean(nanmean(tmpTf,3),2),'b',x,nanmean(nanmean(tmpTg,3),2),'b')
plot(x,nanmean(nanmean(tmpT5,3),2),'r',x,nanmean(nanmean(tmpT6,3),2),'r',x,nanmean(nanmean(tmpT7,3),2),'r',x,nanmean(nanmean(tmpT8,3),2),'r',x,nanmean(nanmean(tmpT9,3),2),'r',x,nanmean(nanmean(tmpT12,3),2),'r')
hold off
title('Temperature','FontWeight','Normal')
xticks((1900:50:2100))
xticklabels({'','','','',''})
ylabel('^\circ C')
ylim([-0.5 6])
yticks((0:2:6))
grid on



subplot(4,2,6)
plot(x,BAT3In,'b',x,BAT4In,'r','Linewidth',3)
%legend('CCSM3','CCSM4','location','northwest')
hold on
plot(x,tmpTInb,'b',x,tmpTInc,'b',x,tmpTIne,'b',x,tmpTInf,'b',x,tmpTIng,'b')
plot(x,tmpTIn5,'r',x,tmpTIn6,'r',x,tmpTIn7,'r',x,tmpTIn8,'r',x,tmpTIn9,'r',x,tmpTIn12,'r')
hold off
title('Inflow','FontWeight','Normal')
xticks((1900:50:2100))
xticklabels({'','','','',''})
%yticks((0:2:10))
ylabel('^\circ C')
ylim([-0.5 7])
yticks((0:2:6))
grid on


subplot(4,2,8);
plot(x,BAT3Out,'b',x,BAT4Out,'r','Linewidth',3)
hold on
plot(x,tmpTOutb,'b',x,tmpTOutc,'b',x,tmpTOute,'b',x,tmpTOutf,'b',x,tmpTOutg,'b')
plot(x,tmpTOut5,'r',x,tmpTOut6,'r',x,tmpTOut7,'r',x,tmpTOut8,'r',x,tmpTOut9,'r',x,tmpTOut12,'r')
hold off
title('Outflow','FontWeight','Normal')
xticks((1900:50:2100))
ylabel('^\circ C')
%yticks((-10:2:0))
ylim([-1 5])
grid on

% print('BarentsM','-djpeg')













subplot(3,2,1)
index = find(BAM3==0); BAM3(index) = NaN;
pcolor(HF,-z3(1:16),(squeeze(mean(BAM3(end-50:end,:,:).*BA3conv200(1:51,:,:)))-squeeze(mean(BAM3(1:50,:,:).*BA3conv200(1:50,:,:))))./squeeze(sA3(1,:,:))*10^-2); shading interp
xlim([-50 700])
ylim([-260 0])
title({'CCSM3';'Heat flux'})
xticklabels([])
caxis([-2 2])

subplot(3,2,2);
index = find(BAM4==0); BAM4(index) = NaN;
pcolor(HF,-z4(1:30),(squeeze(mean(BAM4(end-50:end,:,:).*BA4conv200(1:51,:,:))) - squeeze(mean(BAM4(1:50,:,:).*BA4conv200(1:50,:,:))))./squeeze(sA4(1,:,:))*10^-2); shading interp
xlim([-50 700])
ylim([-260 0])
xticklabels([])
yticklabels([])
title({'CCSM4';'Heat flux'})
caxis([-2 2])

p = get(gca,'position');
h = colorbar('eastoutside'); 
set(h,'YTick',[-2:2])
set(gca,'Position', [p(1)-0.05 p(2) p(3) p(4)])
ylabel(h, 'TW/m^2')


subplot(3,2,3)
index = find(BAU3==0); BAU3(index) = NaN;
pcolor(HF,-z3(1:16),squeeze(mean(BAU3(end-49:end,:,:)-BAU3(1:50,:,:)))); shading interp
xlim([-50 700])
ylim([-260 0])
xticklabels([])
caxis([-0.02 0.02])
title('Velocity')


subplot(3,2,4)
index = find(BAU4==0); BAU4(index) = NaN;
pcolor(HF,-z4(1:30),squeeze(mean(BAU4(end-49:end,:,:)-BAU4(1:50,:,:)))); shading interp
xlim([-50 700])
ylim([-260 0])
xticklabels([])
yticklabels([])
caxis([-0.02 0.02])
title('Velocity')



p = get(gca,'position');
h = colorbar('eastoutside');
set(h,'YTick',[-0.02:0.01:0.02])
set(gca,'Position', [p(1)-0.05 p(2) p(3) p(4)])
ylabel(h, 'm/s')


subplot(3,2,5)
index = find(BAT3==0); BAT3(index) = NaN;
pcolor(HF,-z3(1:16),squeeze(mean(BAT3(end-49:end,:,:)-BAT3(1:50,:,:)))); shading interp
xlim([-50 700])
ylim([-260 0])
caxis([0 6])
title('Temperature')



subplot(3,2,6)
index = find(BAT4==0); BAT4(index) = NaN;
pcolor(HF,-z4(1:30),squeeze(mean(BAT4(end-49:end,:,:)-BAT4(1:50,:,:)))); shading interp
xlim([-50 700])
ylim([-260 0])
yticklabels([])
caxis([0 6])
title('Temperature')


p = get(gca,'position');
h = colorbar('eastoutside');
set(gca,'Position', [p(1)-0.05 p(2) p(3) p(4)])
ylabel(h, '^\circ C')

%print('BarentsS','-djpeg')







