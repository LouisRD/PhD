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

addpath /glade/u/home/renaud/scripts
ncload b30.030b.ES01.pop.h.1931-07.nc HTE HTN z_w dz
z3 = z_w/100; 
[nt nz n] = size(FbU);
tmpHTE = repmat(squeeze(HTE(lat1fram:lat2fram,longfram)),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:30),[1 nt n]);
tmpz = permute(tmpz,[2 1 3]);
sA3 = tmpHTE.*tmpz/100^2;
ncload b40.20th.track1.1deg.012.pop.h.1983-09.nc z_w dz
z4 = z_w/100; 
[nt nz n] = size(F12U);
[nt nz n] = size(F12U);
tmpHTE = repmat(squeeze(HTE(lat1fram:lat2fram,longfram)),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:50),[1 nt n]); 
tmpz = permute(tmpz,[2 1 3]);
sA4 = tmpHTE.*tmpz/100^2;

tmp = zeros(lat2fram-lat1fram+1,1);
for i = 2:lat2fram-lat1fram+1
	tmp(i) = sum(HTE(lat1fram:lat1fram+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(4);


sA3 = sA3/10^8;
index = find(FbU==0); tmpb = FbU.*sA3; tmpb(index)= NaN;
indexOut = find(FbU<0); tmpIn = tmpb; tmpIn(indexOut) = NaN; tmpInb = nansum(nansum(tmpIn,3),2);
indexIn = find(FbU>0); tmpOut = tmpb; tmpOut(indexIn) = NaN; tmpOutb = nansum(nansum(tmpOut,3),2);

index = find(FcU==0); tmpc = FcU.*sA3; tmpc(index)= NaN;
indexOut = find(FcU<0); tmpIn = tmpc; tmpIn(indexOut) = NaN; tmpInc = nansum(nansum(tmpIn,3),2);
indexIn = find(FcU>0); tmpOut = tmpc; tmpOut(indexIn) = NaN; tmpOutc = nansum(nansum(tmpOut,3),2);

index = find(FeU==0); tmpe = FeU.*sA3; tmpe(index)= NaN;
indexOut = find(FeU<0); tmpIn = tmpe; tmpIn(indexOut) = NaN; tmpIne = nansum(nansum(tmpIn,3),2);
indexIn = find(FeU>0); tmpOut = tmpe; tmpOut(indexIn) = NaN; tmpOute = nansum(nansum(tmpOut,3),2);

index = find(FfU==0); tmpf = FfU.*sA3; tmpf(index)= NaN;
indexOut = find(FfU<0); tmpIn = tmpf; tmpIn(indexOut) = NaN; tmpInf = nansum(nansum(tmpIn,3),2);
indexIn = find(FfU>0); tmpOut = tmpf; tmpOut(indexIn) = NaN; tmpOutf = nansum(nansum(tmpOut,3),2);

index = find(FgU==0); tmpg = FgU.*sA3; tmpg(index)= NaN;
indexOut = find(FgU<0); tmpIn = tmpg; tmpIn(indexOut) = NaN; tmpIng = nansum(nansum(tmpIn,3),2);
indexIn = find(FgU>0); tmpOut = tmpg; tmpOut(indexIn) = NaN; tmpOutg = nansum(nansum(tmpOut,3),2);

FU3 = (tmpb+tmpc+tmpe+tmpf+tmpg)/5;
FU3In = (tmpInb+tmpInc+tmpIne+tmpInf+tmpIng)/5;
FU3Out = (tmpOutb+tmpOutc+tmpOute+tmpOutf+tmpOutg)/5;

sA4 = sA4/10^8;
index = find(F5U==0); tmp5 = F5U.*sA4; tmp5(index)= NaN;
indexOut = find(F5U<0); tmpIn = tmp5; tmpIn(indexOut) = NaN; tmpIn5 = nansum(nansum(tmpIn,3),2);
indexIn = find(F5U>0); tmpOut = tmp5; tmpOut(indexIn) = NaN; tmpOut5 = nansum(nansum(tmpOut,3),2);

index = find(F6U==0); tmp6 = F6U.*sA4; tmp6(index)= NaN;
indexOut = find(F6U<0); tmpIn = tmp6; tmpIn(indexOut) = NaN; tmpIn6 = nansum(nansum(tmpIn,3),2);
indexIn = find(F6U>0); tmpOut = tmp6; tmpOut(indexIn) = NaN; tmpOut6 = nansum(nansum(tmpOut,3),2);

index = find(F7U==0); tmp7 = F7U.*sA4; tmp7(index)= NaN;
indexOut = find(F7U<0); tmpIn = tmp7; tmpIn(indexOut) = NaN; tmpIn7 = nansum(nansum(tmpIn,3),2);
indexIn = find(F7U>0); tmpOut = tmp7; tmpOut(indexIn) = NaN; tmpOut7 = nansum(nansum(tmpOut,3),2);

index = find(F8U==0); tmp8 = F8U.*sA4; tmp8(index)= NaN;
indexOut = find(F8U<0); tmpIn = tmp8; tmpIn(indexOut) = NaN; tmpIn8 = nansum(nansum(tmpIn,3),2);
indexIn = find(F8U>0); tmpOut = tmp8; tmpOut(indexIn) = NaN; tmpOut8 = nansum(nansum(tmpOut,3),2);

index = find(F9U==0); tmp9 = F9U.*sA4; tmp9(index)= NaN;
indexOut = find(F9U<0); tmpIn = tmp9; tmpIn(indexOut) = NaN; tmpIn9 = nansum(nansum(tmpIn,3),2);
indexIn = find(F9U>0); tmpOut = tmp9; tmpOut(indexIn) = NaN; tmpOut9 = nansum(nansum(tmpOut,3),2);

index = find(F12U==0); tmp12 = F12U.*sA4; tmp12(index)= NaN;
indexOut = find(F12U<0); tmpIn = tmp12; tmpIn(indexOut) = NaN; tmpIn12 = nansum(nansum(tmpIn,3),2);
indexIn = find(F12U>0); tmpOut = tmp12; tmpOut(indexIn) = NaN; tmpOut12 = nansum(nansum(tmpOut,3),2);

FU4 = (tmp5+tmp6+tmp7+tmp8+tmp9+tmp12)/6;
FU4In = (tmpIn5+tmpIn6+tmpIn7+tmpIn8+tmpIn9+tmpIn12)/6;
FU4Out = (tmpOut5+tmpOut6+tmpOut7+tmpOut8+tmpOut9+tmpOut12)/6;


index = find(FbU==0); tmpTb = FbT; tmpTb(index)= NaN;
indexOut = find(FbU<0); tmpTIn = tmpTb; tmpTIn(indexOut) = NaN; tmpTInb = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(FbU>0); tmpTOut = tmpTb; tmpTOut(indexIn) = NaN; tmpTOutb = nanmean(nanmean(tmpTOut,3),2);

index = find(FcU==0); tmpTc = FcT; tmpTc(index)= NaN;
indexOut = find(FcU<0); tmpTIn = tmpTc; tmpTIn(indexOut) = NaN; tmpTInc = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(FcU>0); tmpTOut = tmpTc; tmpTOut(indexIn) = NaN; tmpTOutc = nanmean(nanmean(tmpTOut,3),2);

index = find(FeU==0); tmpTe = FeT; tmpTe(index)= NaN;
indexOut = find(FeU<0); tmpTIn = tmpTe; tmpTIn(indexOut) = NaN; tmpTIne = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(FeU>0); tmpTOut = tmpTe; tmpTOut(indexIn) = NaN; tmpTOute = nanmean(nanmean(tmpTOut,3),2);

index = find(FfU==0); tmpTf = FfT; tmpTf(index)= NaN;
indexOut = find(FfU<0); tmpTIn = tmpTf; tmpTIn(indexOut) = NaN; tmpTInf = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(FfU>0); tmpTOut = tmpTf; tmpTOut(indexIn) = NaN; tmpTOutf = nanmean(nanmean(tmpTOut,3),2);

index = find(FgU==0); tmpTg = FgT; tmpTg(index)= NaN;
indexOut = find(FgU<0); tmpTIn = tmpTg; tmpTIn(indexOut) = NaN; tmpTIng = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(FgU>0); tmpTOut = tmpTg; tmpTOut(indexIn) = NaN; tmpTOutg = nanmean(nanmean(tmpTOut,3),2);

FT3 = (tmpTb+tmpTc+tmpTe+tmpTf+tmpTg)/5;
FT3In = (tmpTInb+tmpTInc+tmpTIne+tmpTInf+tmpTIng)/5;
FT3Out = (tmpTOutb+tmpTOutc+tmpTOute+tmpTOutf+tmpTOutg)/5;

index = find(F5U==0); tmpT5 = F5T; tmpT5(index)= NaN;
indexOut = find(F5U<0); tmpTIn = tmpT5; tmpTIn(indexOut) = NaN; tmpTIn5 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(F5U>0); tmpTOut = tmpT5; tmpTOut(indexIn) = NaN; tmpTOut5 = nanmean(nanmean(tmpTOut,3),2);

index = find(F6U==0); tmpT6 = F6T; tmpT6(index)= NaN;
indexOut = find(F6U<0); tmpTIn = tmpT6; tmpTIn(indexOut) = NaN; tmpTIn6 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(F6U>0); tmpTOut = tmpT6; tmpTOut(indexIn) = NaN; tmpTOut6 = nanmean(nanmean(tmpTOut,3),2);

index = find(F7U==0); tmpT7 = F7T; tmpT7(index)= NaN;
indexOut = find(F7U<0); tmpTIn = tmpT7; tmpTIn(indexOut) = NaN; tmpTIn7 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(F7U>0); tmpTOut = tmpT7; tmpTOut(indexIn) = NaN; tmpTOut7 = nanmean(nanmean(tmpTOut,3),2);

index = find(F8U==0); tmpT8 = F8T; tmpT8(index)= NaN;
indexOut = find(F8U<0); tmpTIn = tmpT8; tmpTIn(indexOut) = NaN; tmpTIn8 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(F8U>0); tmpTOut = tmpT8; tmpTOut(indexIn) = NaN; tmpTOut8 = nanmean(nanmean(tmpTOut,3),2);

index = find(F9U==0); tmpT9 = F9T; tmpT9(index)= NaN;
indexOut = find(F9U<0); tmpTIn = tmpT9; tmpTIn(indexOut) = NaN; tmpTIn9 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(F9U>0); tmpTOut = tmpT9; tmpTOut(indexIn) = NaN; tmpTOut9 = nanmean(nanmean(tmpTOut,3),2);

index = find(F12U==0); tmpT12 = F12T; tmpT12(index)= NaN;
indexOut = find(F12U<0); tmpTIn = tmpT12; tmpTIn(indexOut) = NaN; tmpTIn12 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(F12U>0); tmpTOut = tmpT12; tmpTOut(indexIn) = NaN; tmpTOut12 = nanmean(nanmean(tmpTOut,3),2);

FT4 = (tmpT5+tmpT6+tmpT7+tmpT8+tmpT9+tmpT12)/6;
FT4In = (tmpTIn5+tmpTIn6+tmpTIn7+tmpTIn8+tmpTIn9+tmpTIn12)/6;
FT4Out = (tmpTOut5+tmpTOut6+tmpTOut7+tmpTOut8+tmpTOut9+tmpTOut12)/6;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%    Fram        %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FM3 = (Fb+Fc+Fe+Ff+Fg)/5;
FM4 = (F5+F6+F7+F8+F9+F12)/6;

x = (1900:2099);


subplot(4,2,[1 2])

plot(x,nansum(nansum(Fb.*F3conv200,3),2),'b',...
	x,nansum(nansum(F5.*F4conv200,3),2),'r',...
	x,nansum(nansum(Fc.*F3conv200,3),2),'b',...
	x,nansum(nansum(Fe.*F3conv200,3),2),'b',...
	x,nansum(nansum(Ff.*F3conv200,3),2),'b',...
	x,nansum(nansum(Fg.*F3conv200,3),2),'b',...
	x,nansum(nansum(F6.*F4conv200,3),2),'r',...
	x,nansum(nansum(F7.*F4conv200,3),2),'r',...
	x,nansum(nansum(F8.*F4conv200,3),2),'r',...
	x,nansum(nansum(F9.*F4conv200,3),2),'r',...
	x,nansum(nansum(F12.*F4conv200,3),2),'r')
grid on 
hold on
plot(x,nansum(nansum(FM3.*F3conv200,3),2),'b',...
	x,nansum(nansum(FM4.*F4conv200,3),2),'r','linewidth',3)
hold off
%legend('CCSM3','CCSM4','location','southwest')
ylabel('TW')
ylim([-50 25])
title('Energy transport','FontWeight','Normal')

subplot(4,2,3)
plot(x,nansum(nansum(FU3,3),2),'b',x,nansum(nansum(FU4,3),2),'r','Linewidth',3)
set(h2,'Position',[p2(1)+(p2(3)-p1(3))/2 p2(2) p1(3) p2(4)])
hold on
plot(x,nansum(nansum(tmpb,3),2),'b',x,nansum(nansum(tmpc,3),2),'b',x,nansum(nansum(tmpe,3),2),'b',x,nansum(nansum(tmpf,3),2),'b',x,nansum(nansum(tmpg,3),2),'b')
plot(x,nansum(nansum(tmp5,3),2),'r',x,nansum(nansum(tmp6,3),2),'r',x,nansum(nansum(tmp7,3),2),'r',x,nansum(nansum(tmp8,3),2),'r',x,nansum(nansum(tmp9,3),2),'r',x,nansum(nansum(tmp12,3),2),'r')
hold off
title('Volume transport','FontWeight','Normal')
xticks((1900:50:2100))
xticklabels({'','','','',''})
ylabel('Sv')
ylim([-7 0])
yticks((-6:2:0))
grid on

subplot(4,2,5)
plot(x,FU3In,'b',x,FU4In,'r','Linewidth',3)
%legend('CCSM3','CCSM4','location','northwest')
hold on
plot(x,tmpInb,'b',x,tmpInc,'b',x,tmpIne,'b',x,tmpInf,'b',x,tmpIng,'b')
plot(x,tmpIn5,'r',x,tmpIn6,'r',x,tmpIn7,'r',x,tmpIn8,'r',x,tmpIn9,'r',x,tmpIn12,'r')
hold off
p1 = get(h1,'Position')
title('Inflow','FontWeight','Normal')
xticks((1900:50:2100))
xticklabels({'','','','',''})
%yticks((0:2:10))
%ylim([0 10])
ylabel('Sv')
ylim([0 3])
yticks((0:3))
grid on

subplot(4,2,7);
plot(x,-FU3Out,'b',x,-FU4Out,'r','Linewidth',3)
hold on
plot(x,-tmpOutb,'b',x,-tmpOutc,'b',x,-tmpOute,'b',x,-tmpOutf,'b',x,-tmpOutg,'b')
plot(x,-tmpOut5,'r',x,-tmpOut6,'r',x,-tmpOut7,'r',x,-tmpOut8,'r',x,-tmpOut9,'r',x,-tmpOut12,'r')
hold off
title('Outflow','FontWeight','Normal')
xticks((1900:50:2100))
yticks((0:2:10))
ylim([0 9])
yticks([0:3:9])
ylabel('Sv')
grid on


subplot(4,2,4)
plot(x,nanmean(nanmean(FT3,3),2),'b',x,nanmean(nanmean(FT4,3),2),'r','Linewidth',3)
hold on
plot(x,nanmean(nanmean(tmpTb,3),2),'b',x,nanmean(nanmean(tmpTc,3),2),'b',x,nanmean(nanmean(tmpTe,3),2),'b',x,nanmean(nanmean(tmpTf,3),2),'b',x,nanmean(nanmean(tmpTg,3),2),'b')
plot(x,nanmean(nanmean(tmpT5,3),2),'r',x,nanmean(nanmean(tmpT6,3),2),'r',x,nanmean(nanmean(tmpT7,3),2),'r',x,nanmean(nanmean(tmpT8,3),2),'r',x,nanmean(nanmean(tmpT9,3),2),'r',x,nanmean(nanmean(tmpT12,3),2),'r')
hold off
title('Temperature','FontWeight','Normal')
xticks((1900:50:2100))
xticklabels({'','','','',''})
ylabel('^\circ C')
ylim([-0.5 2.5])
yticks((0:1:2))
grid on



subplot(4,2,6)
plot(x,FT3In,'b',x,FT4In,'r','Linewidth',3)
%legend('CCSM3','CCSM4','location','northwest')
hold on
plot(x,tmpTInb,'b',x,tmpTInc,'b',x,tmpTIne,'b',x,tmpTInf,'b',x,tmpTIng,'b')
plot(x,tmpTIn5,'r',x,tmpTIn6,'r',x,tmpTIn7,'r',x,tmpTIn8,'r',x,tmpTIn9,'r',x,tmpTIn12,'r')
hold off
p1 = get(h1,'Position')
title('Inflow','FontWeight','Normal')
xticks((1900:50:2100))
xticklabels({'','','','',''})
%yticks((0:2:10))
ylabel('^\circ C')
yticks((0:2:4))
grid on


subplot(4,2,8);
plot(x,FT3Out,'b',x,FT4Out,'r','Linewidth',3)
hold on
plot(x,tmpTOutb,'b',x,tmpTOutc,'b',x,tmpTOute,'b',x,tmpTOutf,'b',x,tmpTOutg,'b')
plot(x,tmpTOut5,'r',x,tmpTOut6,'r',x,tmpTOut7,'r',x,tmpTOut8,'r',x,tmpTOut9,'r',x,tmpTOut12,'r')
hold off
title('Outflow','FontWeight','Normal')
xticks((1900:50:2100))
ylabel('^\circ C')
%yticks((-10:2:0))
ylim([-0.5 2.5])
grid on

% print('FramM','-djpeg')



subplot(3,2,1)
index = find(FM3==0); FM3(index) = NaN;
pcolor(HF,-z3(1:30),(squeeze(mean(FM3(end-50:end,:,:).*F3conv200(1:51,:,:)))-squeeze(mean(FM3(1:50,:,:).*F3conv200(1:50,:,:))))./squeeze(sA3(1,:,:))*10^-2); shading interp
xlim([-50 500])
ylim([-2600 0])
title('CCSM3')
title({'CCSM3';'Heat flux'})
%annotation('textbox',[.465 .65 .1 .2],'String','TW/m^2','EdgeColor','none')
xticklabels([])
caxis([-0.4 0.4])

subplot(3,2,2);
index = find(FM4==0); FM4(index) = NaN;
pcolor(HF,-z4(1:50),(squeeze(mean(FM4(end-50:end,:,:).*F4conv200(1:51,:,:))) - squeeze(mean(FM4(1:50,:,:).*F4conv200(1:50,:,:))))./squeeze(sA4(1,:,:))*10^-2); shading interp
xlim([-50 500])
ylim([-2600 0])
xticklabels([])
yticklabels([])
title({'CCSM4';'Heat flux'})
caxis([-0.4 0.4])

p = get(gca,'position');
h = colorbar('eastoutside');
%ylabel(h, 'TW/m^2')
set(gca,'Position', [p(1)-0.05 p(2) p(3) p(4)])
ylabel(h, 'TW/m^2')


subplot(3,2,3)
index = find(FU3==0); FU3(index) = NaN;
pcolor(HF,-z3(1:30),squeeze(mean(FU3(end-49:end,:,:)-FU3(1:50,:,:)))); shading interp
xlim([-50 500])
ylim([-2600 0])
xticklabels([])
caxis([-0.1 0.1])
title('Velocity')

subplot(3,2,4)
index = find(FU4==0); FU4(index) = NaN;
pcolor(HF,-z4(1:50),squeeze(mean(FU4(end-49:end,:,:)-FU4(1:50,:,:)))); shading interp
xlim([-50 500])
ylim([-2600 0])
xticklabels([])
yticklabels([])
caxis([-0.1 0.1])
title('Velocity')


p = get(gca,'position');
h = colorbar('eastoutside');
%ylabel(h, 'm/s')
set(gca,'Position', [p(1)-0.05 p(2) p(3) p(4)])
ylabel(h, 'm/s')

subplot(3,2,5)
index = find(FT3==0); FT3(index) = NaN;
pcolor(HF,-z3(1:30),squeeze(mean(FT3(end-49:end,:,:)-FT3(1:50,:,:)))); shading interp
xlim([-50 500])
ylim([-2600 0])
caxis([0 4])
title('Temperature')


subplot(3,2,6)
index = find(FT4==0); FT4(index) = NaN;
pcolor(HF,-z4(1:50),squeeze(mean(FT4(end-49:end,:,:)-FT4(1:50,:,:)))); shading interp
xlim([-50 500])
ylim([-2600 0])
yticklabels([])
caxis([0 4])
title('Temperature')

p = get(gca,'position');
h = colorbar('eastoutside');
set(gca,'Position', [p(1)-0.05 p(2) p(3) p(4)])
ylabel(h, '^\circ C')

%print('FramS','-djpeg')





















