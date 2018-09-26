clear 
load Gates3VT.mat
load Gates4VT.mat

addpath /glade/u/home/renaud/scripts
ncload b30.040g.ES01.pop.h.2079-08.nc HTE HTN z_w
z3 = z_w/100; 
ncload b40.20th.track1.1deg.006.pop.h.2005-08.nc z_w
z4 = z_w/100; 

x = (1900:2099);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%    Fram        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ncload b30.040g.ES01.pop.h.2079-08.nc HTE HTN dz
[nt nz n] = size(FbU);
tmpHTE = repmat(squeeze(HTE(lat1fram:lat2fram,longfram)),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:30),[1 nt n]);
tmpz = permute(tmpz,[2 1 3]);
sA3 = tmpHTE.*tmpz/100^2/10^6/100; % /100^2 = cm^2->m^2, /10^6 = -> Sverdrup, UVEL in cm/s ->m/s

ncload b40.20th.track1.1deg.006.pop.h.2005-08.nc dz
[nt nz n] = size(F12U);
tmpHTE = repmat(squeeze(HTE(lat1fram:lat2fram,longfram)),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:50),[1 nt n]); 
tmpz = permute(tmpz,[2 1 3]);
sA4 = tmpHTE.*tmpz/100^2/10^6/100;

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




h1 = subplot(2,2,3);
plot(x,FU3In,'b',x,FU4In,'r','Linewidth',3)
%legend('CCSM3','CCSM4','location','northwest')
hold on
plot(x,tmpInb,'b',x,tmpInc,'b',x,tmpIne,'b',x,tmpInf,'b',x,tmpIng,'b')
plot(x,tmpIn5,'r',x,tmpIn6,'r',x,tmpIn7,'r',x,tmpIn8,'r',x,tmpIn9,'r',x,tmpIn12,'r')
hold off
p1 = get(h1,'Position')
title('In')
xticks((1900:50:2100))
%yticks((0:2:10))
%ylim([0 10])
ylabel('Sverdrup')
grid on

subplot(2,2,4)
plot(x,-FU3Out,'b',x,-FU4Out,'r','Linewidth',3)
hold on
plot(x,-tmpOutb,'b',x,-tmpOutc,'b',x,-tmpOute,'b',x,-tmpOutf,'b',x,-tmpOutg,'b')
plot(x,-tmpOut5,'r',x,-tmpOut6,'r',x,-tmpOut7,'r',x,-tmpOut8,'r',x,-tmpOut9,'r',x,-tmpOut12,'r')
hold off
title('Out')
xticks((1900:50:2100))
yticks((0:2:10))
%ylim([0 10])
grid on

h2 = subplot(2,2,[1 2]);
p2 = get(h2,'Position');
plot(x,nansum(nansum(FU3,3),2),'b',x,nansum(nansum(FU4,3),2),'r','Linewidth',3)
set(h2,'Position',[p2(1)+(p2(3)-p1(3))/2 p2(2) p1(3) p2(4)])
hold on
plot(x,nansum(nansum(tmpb,3),2),'b',x,nansum(nansum(tmpc,3),2),'b',x,nansum(nansum(tmpe,3),2),'b',x,nansum(nansum(tmpf,3),2),'b',x,nansum(nansum(tmpg,3),2),'b')
plot(x,nansum(nansum(tmp5,3),2),'r',x,nansum(nansum(tmp6,3),2),'r',x,nansum(nansum(tmp7,3),2),'r',x,nansum(nansum(tmp8,3),2),'r',x,nansum(nansum(tmp9,3),2),'r',x,nansum(nansum(tmp12,3),2),'r')
hold off
title('Fram Strait')
xticks((1900:50:2100))
ylabel('Sverdrup')
grid on

% print('FramUM','-djpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tmp = zeros(lat2fram-lat1fram+1,1);
for i = 2:lat2fram-lat1fram+1
	tmp(i) = sum(HTE(lat1fram:lat1fram+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(4);


Fu3 = (FbU+FcU+FeU+FfU+FgU)/5;
Fu4 = (F5U+F6U+F7U+F8U+F9U+F12U)/6;

figure('position', [0, 0, 560, 550])
subplot(2,2,1)
index = find(Fu3==0); Fu3(index) = NaN;
pcolor(HF,-z3(1:30),squeeze(mean(Fu3(1:50,:,:)))); shading interp
xlim([-50 550])
ylim([-2600 0])
title('CCSM3 1900-1950')
caxis([-6 4])
subplot(2,2,2)
pcolor(HF,-z3(1:30),squeeze(mean(Fu3(end-50:end,:,:)))); shading interp
xlim([-50 500])
ylim([-2600 0])
title('CCSM3 2050-2099')
caxis([-6 4])
subplot(2,2,3)
index = find(Fu4==0); Fu4(index) = NaN;
pcolor(HF,-z4(1:50),squeeze(mean(Fu4(1:50,:,:)))); shading interp
xlim([-50 500])
ylim([-2600 0])
xticklabels([])
title('CCSM4 1900-1950')
caxis([-6 4])
subplot(2,2,4)
pcolor(HF,-z4(1:50),squeeze(mean(Fu4(end-50:end,:,:)))); shading interp
xlim([-50 500])
ylim([-2600 0])
xticklabels([])
title('CCSM4 2050-2099')
caxis([-6 4])

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-6 4])

%print('FramUS','-djpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


index = find(FbU==0); tmpb = FbT; tmpb(index)= NaN;
indexOut = find(FbU<0); tmpIn = tmpb; tmpIn(indexOut) = NaN; tmpInb = nanmean(nanmean(tmpIn,3),2);
indexIn = find(FbU>0); tmpOut = tmpb; tmpOut(indexIn) = NaN; tmpOutb = nanmean(nanmean(tmpOut,3),2);

index = find(FcU==0); tmpc = FcT; tmpc(index)= NaN;
indexOut = find(FcU<0); tmpIn = tmpc; tmpIn(indexOut) = NaN; tmpInc = nanmean(nanmean(tmpIn,3),2);
indexIn = find(FcU>0); tmpOut = tmpc; tmpOut(indexIn) = NaN; tmpOutc = nanmean(nanmean(tmpOut,3),2);

index = find(FeU==0); tmpe = FeT; tmpe(index)= NaN;
indexOut = find(FeU<0); tmpIn = tmpe; tmpIn(indexOut) = NaN; tmpIne = nanmean(nanmean(tmpIn,3),2);
indexIn = find(FeU>0); tmpOut = tmpe; tmpOut(indexIn) = NaN; tmpOute = nanmean(nanmean(tmpOut,3),2);

index = find(FfU==0); tmpf = FfT; tmpf(index)= NaN;
indexOut = find(FfU<0); tmpIn = tmpf; tmpIn(indexOut) = NaN; tmpInf = nanmean(nanmean(tmpIn,3),2);
indexIn = find(FfU>0); tmpOut = tmpf; tmpOut(indexIn) = NaN; tmpOutf = nanmean(nanmean(tmpOut,3),2);

index = find(FgU==0); tmpg = FgT; tmpg(index)= NaN;
indexOut = find(FgU<0); tmpIn = tmpg; tmpIn(indexOut) = NaN; tmpIng = nanmean(nanmean(tmpIn,3),2);
indexIn = find(FgU>0); tmpOut = tmpg; tmpOut(indexIn) = NaN; tmpOutg = nanmean(nanmean(tmpOut,3),2);

FT3 = (tmpb+tmpc+tmpe+tmpf+tmpg)/5;
FT3In = (tmpInb+tmpInc+tmpIne+tmpInf+tmpIng)/5;
FT3Out = (tmpOutb+tmpOutc+tmpOute+tmpOutf+tmpOutg)/5;


index = find(F5U==0); tmp5 = F5T; tmp5(index)= NaN;
indexOut = find(F5U<0); tmpIn = tmp5; tmpIn(indexOut) = NaN; tmpIn5 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(F5U>0); tmpOut = tmp5; tmpOut(indexIn) = NaN; tmpOut5 = nanmean(nanmean(tmpOut,3),2);

index = find(F6U==0); tmp6 = F6T; tmp6(index)= NaN;
indexOut = find(F6U<0); tmpIn = tmp6; tmpIn(indexOut) = NaN; tmpIn6 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(F6U>0); tmpOut = tmp6; tmpOut(indexIn) = NaN; tmpOut6 = nanmean(nanmean(tmpOut,3),2);

index = find(F7U==0); tmp7 = F7T; tmp7(index)= NaN;
indexOut = find(F7U<0); tmpIn = tmp7; tmpIn(indexOut) = NaN; tmpIn7 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(F7U>0); tmpOut = tmp7; tmpOut(indexIn) = NaN; tmpOut7 = nanmean(nanmean(tmpOut,3),2);

index = find(F8U==0); tmp8 = F8T; tmp8(index)= NaN;
indexOut = find(F8U<0); tmpIn = tmp8; tmpIn(indexOut) = NaN; tmpIn8 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(F8U>0); tmpOut = tmp8; tmpOut(indexIn) = NaN; tmpOut8 = nanmean(nanmean(tmpOut,3),2);

index = find(F9U==0); tmp9 = F9T; tmp9(index)= NaN;
indexOut = find(F9U<0); tmpIn = tmp9; tmpIn(indexOut) = NaN; tmpIn9 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(F9U>0); tmpOut = tmp9; tmpOut(indexIn) = NaN; tmpOut9 = nanmean(nanmean(tmpOut,3),2);

index = find(F12U==0); tmp12 = F12T; tmp12(index)= NaN;
indexOut = find(F12U<0); tmpIn = tmp12; tmpIn(indexOut) = NaN; tmpIn12 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(F12U>0); tmpOut = tmp12; tmpOut(indexIn) = NaN; tmpOut12 = nanmean(nanmean(tmpOut,3),2);

FT4 = (tmp5+tmp6+tmp7+tmp8+tmp9+tmp12)/6;
FT4In = (tmpIn5+tmpIn6+tmpIn7+tmpIn8+tmpIn9+tmpIn12)/6;
FT4Out = (tmpOut5+tmpOut6+tmpOut7+tmpOut8+tmpOut9+tmpOut12)/6;


h1 = subplot(2,2,3);
plot(x,FT3In,'b',x,FT4In,'r','Linewidth',3)
%legend('CCSM3','CCSM4','location','northwest')
hold on
plot(x,tmpInb,'b',x,tmpInc,'b',x,tmpIne,'b',x,tmpInf,'b',x,tmpIng,'b')
plot(x,tmpIn5,'r',x,tmpIn6,'r',x,tmpIn7,'r',x,tmpIn8,'r',x,tmpIn9,'r',x,tmpIn12,'r')
hold off
p1 = get(h1,'Position')
title('In')
xticks((1900:50:2100))
%yticks((0:2:10))
ylabel('^\circ C')
grid on

subplot(2,2,4)
plot(x,FT3Out,'b',x,FT4Out,'r','Linewidth',3)
hold on
plot(x,tmpOutb,'b',x,tmpOutc,'b',x,tmpOute,'b',x,tmpOutf,'b',x,tmpOutg,'b')
plot(x,tmpOut5,'r',x,tmpOut6,'r',x,tmpOut7,'r',x,tmpOut8,'r',x,tmpOut9,'r',x,tmpOut12,'r')
hold off
title('Out')
xticks((1900:50:2100))
%yticks((-10:2:0))
grid on

h2 = subplot(2,2,[1 2]);
p2 = get(h2,'Position');
plot(x,nanmean(nanmean(FT3,3),2),'b',x,nanmean(nanmean(FT4,3),2),'r','Linewidth',3)
set(h2,'Position',[p2(1)+(p2(3)-p1(3))/2 p2(2) p1(3) p2(4)])
hold on
plot(x,nanmean(nanmean(tmpb,3),2),'b',x,nanmean(nanmean(tmpc,3),2),'b',x,nanmean(nanmean(tmpe,3),2),'b',x,nanmean(nanmean(tmpf,3),2),'b',x,nanmean(nanmean(tmpg,3),2),'b')
plot(x,nanmean(nanmean(tmp5,3),2),'r',x,nanmean(nanmean(tmp6,3),2),'r',x,nanmean(nanmean(tmp7,3),2),'r',x,nanmean(nanmean(tmp8,3),2),'r',x,nanmean(nanmean(tmp9,3),2),'r',x,nanmean(nanmean(tmp12,3),2),'r')
hold off
title('Fram Strait')
xticks((1900:50:2100))
ylabel('^\circ C')
grid on

% print('FramTM','-djpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



tmp = zeros(lat2fram-lat1fram+1,1);
for i = 2:lat2fram-lat1fram+1
	tmp(i) = sum(HTE(lat1fram:lat1fram+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(4);

figure('position', [0, 0, 560, 550])
subplot(2,2,1)
index = find(FT3==0); FT3(index) = NaN;
pcolor(HF,-z3(1:30),squeeze(mean(FT3(1:50,:,:)))); shading interp
xlim([-50 550])
ylim([-2600 0])
title('CCSM3 1900-1950')
caxis([-3 4])
subplot(2,2,2)
pcolor(HF,-z3(1:30),squeeze(mean(FT3(end-50:end,:,:)))); shading interp
xlim([-50 500])
ylim([-2600 0])
title('CCSM3 2050-2099')
caxis([-3 4])
subplot(2,2,3)
index = find(FT4==0); FT4(index) = NaN;
pcolor(HF,-z4(1:50),squeeze(mean(FT4(1:50,:,:)))); shading interp
xlim([-50 500])
ylim([-2600 0])
xticklabels([])
title('CCSM4 1900-1950')
caxis([-3 4])
subplot(2,2,4)
pcolor(HF,-z4(1:50),squeeze(mean(FT4(end-50:end,:,:)))); shading interp
xlim([-50 500])
ylim([-2600 0])
xticklabels([])
title('CCSM4 2050-2099')
caxis([-3 4])

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-3 4])

%print('FramTS','-djpeg')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%    Barents     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lat1barents = 334;
lat2barents = 369;
longbarents = 100;
addpath /glade/u/home/renaud/scripts
ncload b30.040g.ES01.pop.h.2079-08.nc HTE dz
z3 = z_w/100; 
[nt nz n] = size(BAbT);
tmpHTE = repmat(squeeze(HTE(lat1barents:lat2barents,longbarents)),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:16),[1 nt n]);
tmpz = permute(tmpz,[2 1 3]);
sA3 = tmpHTE.*tmpz/100^2/10^6/100;
ncload b40.20th.track1.1deg.006.pop.h.2005-08.nc dz
z4 = z_w/100; 
[nt nz n] = size(BA12T);
tmpHTE = repmat(squeeze(HTE(lat1barents:lat2barents,longbarents)),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:30),[1 nt n]); 
tmpz = permute(tmpz,[2 1 3]);
sA4 = tmpHTE.*tmpz/100^2/10^6/100;


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

tmp = nansum(nansum(BAU4,3),2);
mean(tmp(97:107))


h1 = subplot(2,2,3);
plot(x,BAU3In,'b',x,BAU4In,'r','Linewidth',3)
%legend('CCSM3','CCSM4','location','northwest')
hold on
plot(x,tmpInb,'b',x,tmpInc,'b',x,tmpIne,'b',x,tmpInf,'b',x,tmpIng,'b')
plot(x,tmpIn5,'r',x,tmpIn6,'r',x,tmpIn7,'r',x,tmpIn8,'r',x,tmpIn9,'r',x,tmpIn12,'r')
hold off
p1 = get(h1,'Position')
title('In')
xticks((1900:50:2100))
%yticks((1:7))
%ylim([1 7])
ylabel('Sverdrup')
grid on

subplot(2,2,4)
plot(x,-BAU3Out,'b',x,-BAU4Out,'r','Linewidth',3)
hold on
plot(x,-tmpOutb,'b',x,-tmpOutc,'b',x,-tmpOute,'b',x,-tmpOutf,'b',x,-tmpOutg,'b')
plot(x,-tmpOut5,'r',x,-tmpOut6,'r',x,-tmpOut7,'r',x,-tmpOut8,'r',x,-tmpOut9,'r',x,-tmpOut12,'r')
hold off
title('Out')
xticks((1900:50:2100))
%yticks((0:0.5:2))
%ylim([0 2])
grid on

h2 = subplot(2,2,[1 2]);
p2 = get(h2,'Position');
plot(x,nansum(nansum(BAU3,3),2),'b',x,nansum(nansum(BAU4,3),2),'r','Linewidth',3)
set(h2,'Position',[p2(1)+(p2(3)-p1(3))/2 p2(2) p1(3) p2(4)])
hold on
plot(x,nansum(nansum(tmpb,3),2),'b',x,nansum(nansum(tmpc,3),2),'b',x,nansum(nansum(tmpe,3),2),'b',x,nansum(nansum(tmpf,3),2),'b',x,nansum(nansum(tmpg,3),2),'b')
plot(x,nansum(nansum(tmp5,3),2),'r',x,nansum(nansum(tmp6,3),2),'r',x,nansum(nansum(tmp7,3),2),'r',x,nansum(nansum(tmp8,3),2),'r',x,nansum(nansum(tmp9,3),2),'r',x,nansum(nansum(tmp12,3),2),'r')
hold off
title('Barents Sea Opening')
xticks((1900:50:2100))
%yticks((0:1:5))
%ylim([0 5])
ylabel('Sverdrup')
grid on

% print('BarentsUM','-djpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




tmp = zeros(lat2barents-lat1barents+1,1);
for i = 2:lat2barents-lat1barents+1
	tmp(i) = sum(HTE(lat1barents:lat1barents+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(3);

BAu3 = (BAbU+BAcU+BAeU+BAfU+BAgU)/5;
BAu4 = (BA5U+BA6U+BA7U+BA8U+BA9U+BA12U)/6;

figure('position', [0, 0, 560, 550])
subplot(2,2,1)
index = find(BAu3==0); BAu3(index) = NaN;
pcolor(HF,-z3(1:16),squeeze(mean(BAu3(1:50,:,:)))); shading interp
xlim([-50 700])
ylim([-260 0])
title('CCSM3 1900-1950')
caxis([-2 10])
subplot(2,2,2)
pcolor(HF,-z3(1:16),squeeze(mean(BAu3(end-50:end,:,:)))); shading interp
xlim([-50 700])
ylim([-260 0])
title('CCSM3 2050-2099')
caxis([-2 10])
subplot(2,2,3)
index = find(BAu4==0); BAu4(index) = NaN;
pcolor(HF,-z4(1:30),squeeze(mean(BAu4(1:50,:,:)))); shading interp
xlim([-50 700])
ylim([-260 0])
xticklabels([])
title('CCSM4 1900-1950')
caxis([-2 10])
subplot(2,2,4)
pcolor(HF,-z4(1:30),squeeze(mean(BAu4(end-50:end,:,:)))); shading interp
xlim([-50 700])
ylim([-260 0])
xticklabels([])
title('CCSM4 2050-2099')
caxis([-2 10])

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-2 10])

%print('BarentsUS','-djpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



index = find(BAbU==0); tmpb = BAbT; tmpb(index)= NaN;
indexOut = find(BAbU<0); tmpIn = tmpb; tmpIn(indexOut) = NaN; tmpInb = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BAbU>0); tmpOut = tmpb; tmpOut(indexIn) = NaN; tmpOutb = nanmean(nanmean(tmpOut,3),2);

index = find(BAcU==0); tmpc = BAcT; tmpc(index)= NaN;
indexOut = find(BAcU<0); tmpIn = tmpc; tmpIn(indexOut) = NaN; tmpInc = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BAcU>0); tmpOut = tmpc; tmpOut(indexIn) = NaN; tmpOutc = nanmean(nanmean(tmpOut,3),2);

index = find(BAeU==0); tmpe = BAeT; tmpe(index)= NaN;
indexOut = find(BAeU<0); tmpIn = tmpe; tmpIn(indexOut) = NaN; tmpIne = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BAeU>0); tmpOut = tmpe; tmpOut(indexIn) = NaN; tmpOute = nanmean(nanmean(tmpOut,3),2);

index = find(BAfU==0); tmpf = BAfT; tmpf(index)= NaN;
indexOut = find(BAfU<0); tmpIn = tmpf; tmpIn(indexOut) = NaN; tmpInf = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BAfU>0); tmpOut = tmpf; tmpOut(indexIn) = NaN; tmpOutf = nanmean(nanmean(tmpOut,3),2);

index = find(BAgU==0); tmpg = BAgT; tmpg(index)= NaN;
indexOut = find(BAgU<0); tmpIn = tmpg; tmpIn(indexOut) = NaN; tmpIng = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BAgU>0); tmpOut = tmpg; tmpOut(indexIn) = NaN; tmpOutg = nanmean(nanmean(tmpOut,3),2);

BAT3 = (tmpb+tmpc+tmpe+tmpf+tmpg)/5;
BAT3In = (tmpInb+tmpInc+tmpIne+tmpInf+tmpIng)/5;
BAT3Out = (tmpOutb+tmpOutc+tmpOute+tmpOutf+tmpOutg)/5;


index = find(BA5U==0); tmp5 = BA5T; tmp5(index)= NaN;
indexOut = find(BA5U<0); tmpIn = tmp5; tmpIn(indexOut) = NaN; tmpIn5 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BA5U>0); tmpOut = tmp5; tmpOut(indexIn) = NaN; tmpOut5 = nanmean(nanmean(tmpOut,3),2);

index = find(BA6U==0); tmp6 = BA6T; tmp6(index)= NaN;
indexOut = find(BA6U<0); tmpIn = tmp6; tmpIn(indexOut) = NaN; tmpIn6 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BA6U>0); tmpOut = tmp6; tmpOut(indexIn) = NaN; tmpOut6 = nanmean(nanmean(tmpOut,3),2);

index = find(BA7U==0); tmp7 = BA7T; tmp7(index)= NaN;
indexOut = find(BA7U<0); tmpIn = tmp7; tmpIn(indexOut) = NaN; tmpIn7 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BA7U>0); tmpOut = tmp7; tmpOut(indexIn) = NaN; tmpOut7 = nanmean(nanmean(tmpOut,3),2);

index = find(BA8U==0); tmp8 = BA8T; tmp8(index)= NaN;
indexOut = find(BA8U<0); tmpIn = tmp8; tmpIn(indexOut) = NaN; tmpIn8 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BA8U>0); tmpOut = tmp8; tmpOut(indexIn) = NaN; tmpOut8 = nanmean(nanmean(tmpOut,3),2);

index = find(BA9U==0); tmp9 = BA9T; tmp9(index)= NaN;
indexOut = find(BA9U<0); tmpIn = tmp9; tmpIn(indexOut) = NaN; tmpIn9 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BA9U>0); tmpOut = tmp9; tmpOut(indexIn) = NaN; tmpOut9 = nanmean(nanmean(tmpOut,3),2);

index = find(BA12U==0); tmp12 = BA12T; tmp12(index)= NaN;
indexOut = find(BA12U<0); tmpIn = tmp12; tmpIn(indexOut) = NaN; tmpIn12 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BA12U>0); tmpOut = tmp12; tmpOut(indexIn) = NaN; tmpOut12 = nanmean(nanmean(tmpOut,3),2);

BAT4 = (tmp5+tmp6+tmp7+tmp8+tmp9+tmp12)/6;
BAT4In = (tmpIn5+tmpIn6+tmpIn7+tmpIn8+tmpIn9+tmpIn12)/6;
BAT4Out = (tmpOut5+tmpOut6+tmpOut7+tmpOut8+tmpOut9+tmpOut12)/6;


h1 = subplot(2,2,3);
plot(x,BAT3In,'b',x,BAT4In,'r','Linewidth',3)
hold on
plot(x,tmpInb,'b',x,tmpInc,'b',x,tmpIne,'b',x,tmpInf,'b',x,tmpIng,'b')
plot(x,tmpIn5,'r',x,tmpIn6,'r',x,tmpIn7,'r',x,tmpIn8,'r',x,tmpIn9,'r',x,tmpIn12,'r')
hold off
p1 = get(h1,'Position')
title('In')
xticks((1900:50:2100))
yticks((-2:2:8))
ylim([-2 8])
ylabel('^\circ C')
grid on

subplot(2,2,4)
plot(x,BAT3Out,'b',x,BAT4Out,'r','Linewidth',3)
%legend('CCSM3','CCSM4','location','northwest')
hold on
plot(x,tmpOutb,'b',x,tmpOutc,'b',x,tmpOute,'b',x,tmpOutf,'b',x,tmpOutg,'b')
plot(x,tmpOut5,'r',x,tmpOut6,'r',x,tmpOut7,'r',x,tmpOut8,'r',x,tmpOut9,'r',x,tmpOut12,'r')
hold off
title('Out')
xticks((1900:50:2100))
%yticks((-10:2:0))
grid on

h2 = subplot(2,2,[1 2]);
p2 = get(h2,'Position');
plot(x,nanmean(nanmean(BAT3,3),2),'b',x,nanmean(nanmean(BAT4,3),2),'r','Linewidth',3)
set(h2,'Position',[p2(1)+(p2(3)-p1(3))/2 p2(2) p1(3) p2(4)])
hold on
plot(x,nanmean(nanmean(tmpb,3),2),'b',x,nanmean(nanmean(tmpc,3),2),'b',x,nanmean(nanmean(tmpe,3),2),'b',x,nanmean(nanmean(tmpf,3),2),'b',x,nanmean(nanmean(tmpg,3),2),'b')
plot(x,nanmean(nanmean(tmp5,3),2),'r',x,nanmean(nanmean(tmp6,3),2),'r',x,nanmean(nanmean(tmp7,3),2),'r',x,nanmean(nanmean(tmp8,3),2),'r',x,nanmean(nanmean(tmp9,3),2),'r',x,nanmean(nanmean(tmp12,3),2),'r')
hold off
title('Barents Sea Opening')
xticks((1900:50:2100))
ylabel('^\circ C')
grid on

% print('BarentsTM','-djpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tmp = zeros(lat2barents-lat1barents+1,1);
for i = 2:lat2barents-lat1barents+1
	tmp(i) = sum(HTE(lat1barents:lat1barents+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(3);


figure('position', [0, 0, 560, 550])
subplot(2,2,1)
index = find(BAT3==0); BAT3(index) = NaN;
pcolor(HF,-z3(1:16),squeeze(mean(BAT3(1:50,:,:)))); shading interp
xlim([-50 700])
ylim([-260 0])
title('CCSM3 1900-1950')
caxis([-2 5])
subplot(2,2,2)
pcolor(HF,-z3(1:16),squeeze(mean(BAT3(end-50:end,:,:)))); shading interp
xlim([-50 700])
ylim([-260 0])
title('CCSM3 2050-2099')
caxis([-2 5])
subplot(2,2,3)
index = find(BAT4==0); BAT4(index) = NaN;
pcolor(HF,-z4(1:30),squeeze(mean(BAT4(1:50,:,:)))); shading interp
xlim([-50 700])
ylim([-260 0])
xticklabels([])
title('CCSM4 1900-1950')
caxis([-2 5])
subplot(2,2,4)
pcolor(HF,-z4(1:30),squeeze(mean(BAT4(end-50:end,:,:)))); shading interp
xlim([-50 700])
ylim([-260 0])
xticklabels([])
title('CCSM4 2050-2099')
caxis([-2 5])

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-2 5])

%print('BarentsTS','-djpeg')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%    CAA         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


lat1CAA = 333;
lat2CAA = 384;
longCAA = 230;

addpath /glade/u/home/renaud/scripts
ncload b30.040g.ES01.pop.h.2079-08.nc HTE dz z_w
z3 = z_w/100; 
[nt nz n] = size(CbU);
tmpHTE = repmat(squeeze(HTE(lat1CAA:lat2CAA,longCAA)),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:16),[1 nt n]);
tmpz = permute(tmpz,[2 1 3]);
sA3 = tmpHTE.*tmpz/100^2/10^6/100;
ncload b40.20th.track1.1deg.006.pop.h.2005-08.nc dz z_w
z4 = z_w/100; 
[nt nz n] = size(C12U);
tmpHTE = repmat(squeeze(HTE(lat1CAA:lat2CAA,longCAA)),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:30),[1 nt n]); 
tmpz = permute(tmpz,[2 1 3]);
sA4 = tmpHTE.*tmpz/100^2/10^6/100;



index = find(CbU==0); tmpb = CbU.*sA3; tmpb(index)= NaN;
indexOut = find(CbU>0); tmpIn = tmpb; tmpIn(indexOut) = NaN; tmpInb = nansum(nansum(tmpIn,3),2);
indexIn = find(CbU<0); tmpOut = tmpb; tmpOut(indexIn) = NaN; tmpOutb = nansum(nansum(tmpOut,3),2);

index = find(CcU==0); tmpc = CcU.*sA3; tmpc(index)= NaN;
indexOut = find(CcU>0); tmpIn = tmpc; tmpIn(indexOut) = NaN; tmpInc = nansum(nansum(tmpIn,3),2);
indexIn = find(CcU<0); tmpOut = tmpc; tmpOut(indexIn) = NaN; tmpOutc = nansum(nansum(tmpOut,3),2);

index = find(CeU==0); tmpe = CeU.*sA3; tmpe(index)= NaN;
indexOut = find(CeU>0); tmpIn = tmpe; tmpIn(indexOut) = NaN; tmpIne = nansum(nansum(tmpIn,3),2);
indexIn = find(CeU<0); tmpOut = tmpe; tmpOut(indexIn) = NaN; tmpOute = nansum(nansum(tmpOut,3),2);

index = find(CfU==0); tmpf = CfU.*sA3; tmpf(index)= NaN;
indexOut = find(CfU>0); tmpIn = tmpf; tmpIn(indexOut) = NaN; tmpInf = nansum(nansum(tmpIn,3),2);
indexIn = find(CfU<0); tmpOut = tmpf; tmpOut(indexIn) = NaN; tmpOutf = nansum(nansum(tmpOut,3),2);

index = find(CgU==0); tmpg = CgU.*sA3; tmpg(index)= NaN;
indexOut = find(CgU>0); tmpIn = tmpg; tmpIn(indexOut) = NaN; tmpIng = nansum(nansum(tmpIn,3),2);
indexIn = find(CgU<0); tmpOut = tmpg; tmpOut(indexIn) = NaN; tmpOutg = nansum(nansum(tmpOut,3),2);

CU3 = (tmpb+tmpc+tmpe+tmpf+tmpg)/5;
CU3In = (tmpInb+tmpInc+tmpIne+tmpInf+tmpIng)/5;
CU3Out = (tmpOutb+tmpOutc+tmpOute+tmpOutf+tmpOutg)/5;

index = find(C5U==0); tmp5 = C5U.*sA4; tmp5(index)= NaN;
indexOut = find(C5U>0); tmpIn = tmp5; tmpIn(indexOut) = NaN; tmpIn5 = nansum(nansum(tmpIn,3),2);
indexIn = find(C5U<0); tmpOut = tmp5; tmpOut(indexIn) = NaN; tmpOut5 = nansum(nansum(tmpOut,3),2);

index = find(C6U==0); tmp6 = C6U.*sA4; tmp6(index)= NaN;
indexOut = find(C6U>0); tmpIn = tmp6; tmpIn(indexOut) = NaN; tmpIn6 = nansum(nansum(tmpIn,3),2);
indexIn = find(C6U<0); tmpOut = tmp6; tmpOut(indexIn) = NaN; tmpOut6 = nansum(nansum(tmpOut,3),2);

index = find(C7U==0); tmp7 = C7U.*sA4; tmp7(index)= NaN;
indexOut = find(C7U>0); tmpIn = tmp7; tmpIn(indexOut) = NaN; tmpIn7 = nansum(nansum(tmpIn,3),2);
indexIn = find(C7U<0); tmpOut = tmp7; tmpOut(indexIn) = NaN; tmpOut7 = nansum(nansum(tmpOut,3),2);

index = find(C8U==0); tmp8 = C8U.*sA4; tmp8(index)= NaN;
indexOut = find(C8U>0); tmpIn = tmp8; tmpIn(indexOut) = NaN; tmpIn8 = nansum(nansum(tmpIn,3),2);
indexIn = find(C8U<0); tmpOut = tmp8; tmpOut(indexIn) = NaN; tmpOut8 = nansum(nansum(tmpOut,3),2);

index = find(C9U==0); tmp9 = C9U.*sA4; tmp9(index)= NaN;
indexOut = find(C9U>0); tmpIn = tmp9; tmpIn(indexOut) = NaN; tmpIn9 = nansum(nansum(tmpIn,3),2);
indexIn = find(C9U<0); tmpOut = tmp9; tmpOut(indexIn) = NaN; tmpOut9 = nansum(nansum(tmpOut,3),2);

index = find(C12U==0); tmp12 = C12U.*sA4; tmp12(index)= NaN;
indexOut = find(C12U>0); tmpIn = tmp12; tmpIn(indexOut) = NaN; tmpIn12 = nansum(nansum(tmpIn,3),2);
indexIn = find(C12U<0); tmpOut = tmp12; tmpOut(indexIn) = NaN; tmpOut12 = nansum(nansum(tmpOut,3),2);

CU4 = (tmp5+tmp6+tmp7+tmp8+tmp9+tmp12)/6;
CU4In = (tmpIn5+tmpIn6+tmpIn7+tmpIn8+tmpIn9+tmpIn12)/6;
CU4Out = (tmpOut5+tmpOut6+tmpOut7+tmpOut8+tmpOut9+tmpOut12)/6;


h1 = subplot(2,2,3);
plot(x,-CU3In,'b',x,-CU4In,'r','Linewidth',3)
%legend('CCSM3','CCSM4','location','northwest')
hold on
plot(x,-tmpInb,'b',x,-tmpInc,'b',x,-tmpIne,'b',x,-tmpInf,'b',x,-tmpIng,'b')
plot(x,-tmpIn5,'r',x,-tmpIn6,'r',x,-tmpIn7,'r',x,-tmpIn8,'r',x,-tmpIn9,'r',x,-tmpIn12,'r')
hold off
p1 = get(h1,'Position')
title('In')
xticks((1900:50:2100))
%yticks((0:2:10))
%ylim([0.2:0.2:1.2])
ylabel('Sverdrup')
grid on

subplot(2,2,4)
plot(x,CU3Out,'b',x,CU4Out,'r','Linewidth',3)
hold on
plot(x,tmpOutb,'b',x,tmpOutc,'b',x,tmpOute,'b',x,tmpOutf,'b',x,tmpOutg,'b')
plot(x,tmpOut5,'r',x,tmpOut6,'r',x,tmpOut7,'r',x,tmpOut8,'r',x,tmpOut9,'r',x,tmpOut12,'r')
hold off
title('Out')
xticks((1900:50:2100))
%yticks((0:50:250))
%ylim([0 250])
grid on

h2 = subplot(2,2,[1 2]);
p2 = get(h2,'Position');
plot(x,-nansum(nansum(CU3,3),2),'b',x,-nansum(nansum(CU4,3),2),'r','Linewidth',3)
set(h2,'Position',[p2(1)+(p2(3)-p1(3))/2 p2(2) p1(3) p2(4)])
hold on
plot(x,-nansum(nansum(tmpb,3),2),'b',x,-nansum(nansum(tmpc,3),2),'b',x,-nansum(nansum(tmpe,3),2),'b',x,-nansum(nansum(tmpf,3),2),'b',x,-nansum(nansum(tmpg,3),2),'b')
plot(x,-nansum(nansum(tmp5,3),2),'r',x,-nansum(nansum(tmp6,3),2),'r',x,-nansum(nansum(tmp7,3),2),'r',x,-nansum(nansum(tmp8,3),2),'r',x,-nansum(nansum(tmp9,3),2),'r',x,-nansum(nansum(tmp12,3),2),'r')
hold off
title('CAA')
xticks((1900:50:2100))
%yticks((-250:50:0))
%ylim([-250 0])
ylabel('Sverdrup')
grid on

% print('CAAUM','-djpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tmp = zeros(lat2CAA-lat1CAA+1,1);
for i = 2:lat2CAA-lat1CAA+1
	tmp(i) = sum(HTE(lat1CAA:lat1CAA+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(3);


Cu3 = (CbU+CcU+CeU+CfU+CgU)/5;
Cu4 = (C5U+C6U+C7U+C8U+C9U+C12U)/6;

figure('position', [0, 0, 560, 550])
subplot(2,2,1)
index = find(Cu3==0); Cu3(index) = NaN;
pcolor(HF,-z3(1:16),squeeze(mean(-Cu3(1:50,:,:)))); shading interp
xlim([-50 1500])
ylim([-350 0])
title('CCSM3 1900-1950')
caxis([-10 1])
subplot(2,2,2)
pcolor(HF,-z3(1:16),squeeze(mean(-Cu3(end-50:end,:,:)))); shading interp
xlim([-50 1500])
ylim([-350 0])
title('CCSM3 2050-2099')
caxis([-10 1])
subplot(2,2,3)
index = find(Cu4==0); Cu4(index) = NaN;
pcolor(HF,-z4(1:30),squeeze(mean(-Cu4(1:50,:,:)))); shading interp
xlim([-50 1500])
ylim([-350 0])
xticklabels([])
title('CCSM4 1900-1950')
caxis([-10 1])
subplot(2,2,4)
pcolor(HF,-z4(1:30),squeeze(mean(-Cu4(end-50:end,:,:)))); shading interp
xlim([-50 1500])
ylim([-350 0])
xticklabels([])
title('CCSM4 2050-2099')
caxis([-10 1])

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-10 1])

%print('CAAUS','-djpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


index = find(CbU==0); tmpb = CbT; tmpb(index)= NaN;
indexOut = find(CbU>0); tmpIn = tmpb; tmpIn(indexOut) = NaN; tmpInb = nanmean(nanmean(tmpIn,3),2);
indexIn = find(CbU<0); tmpOut = tmpb; tmpOut(indexIn) = NaN; tmpOutb = nanmean(nanmean(tmpOut,3),2);

index = find(CcU==0); tmpc = CcT; tmpc(index)= NaN;
indexOut = find(CcU>0); tmpIn = tmpc; tmpIn(indexOut) = NaN; tmpInc = nanmean(nanmean(tmpIn,3),2);
indexIn = find(CcU<0); tmpOut = tmpc; tmpOut(indexIn) = NaN; tmpOutc = nanmean(nanmean(tmpOut,3),2);

index = find(CeU==0); tmpe = CeT; tmpe(index)= NaN;
indexOut = find(CeU>0); tmpIn = tmpe; tmpIn(indexOut) = NaN; tmpIne = nanmean(nanmean(tmpIn,3),2);
indexIn = find(CeU<0); tmpOut = tmpe; tmpOut(indexIn) = NaN; tmpOute = nanmean(nanmean(tmpOut,3),2);

index = find(CfU==0); tmpf = CfT; tmpf(index)= NaN;
indexOut = find(CfU>0); tmpIn = tmpf; tmpIn(indexOut) = NaN; tmpInf = nanmean(nanmean(tmpIn,3),2);
indexIn = find(CfU<0); tmpOut = tmpf; tmpOut(indexIn) = NaN; tmpOutf = nanmean(nanmean(tmpOut,3),2);

index = find(CgU==0); tmpg = CgT; tmpg(index)= NaN;
indexOut = find(CgU>0); tmpIn = tmpg; tmpIn(indexOut) = NaN; tmpIng = nanmean(nanmean(tmpIn,3),2);
indexIn = find(CgU<0); tmpOut = tmpg; tmpOut(indexIn) = NaN; tmpOutg = nanmean(nanmean(tmpOut,3),2);

CT3 = (tmpb+tmpc+tmpe+tmpf+tmpg)/5;
CT3In = (tmpInb+tmpInc+tmpIne+tmpInf+tmpIng)/5;
CT3Out = (tmpOutb+tmpOutc+tmpOute+tmpOutf+tmpOutg)/5;


index = find(C5U==0); tmp5 = C5T; tmp5(index)= NaN;
indexOut = find(C5U>0); tmpIn = tmp5; tmpIn(indexOut) = NaN; tmpIn5 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(C5U<0); tmpOut = tmp5; tmpOut(indexIn) = NaN; tmpOut5 = nanmean(nanmean(tmpOut,3),2);

index = find(C6U==0); tmp6 = C6T; tmp6(index)= NaN;
indexOut = find(C6U>0); tmpIn = tmp6; tmpIn(indexOut) = NaN; tmpIn6 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(C6U<0); tmpOut = tmp6; tmpOut(indexIn) = NaN; tmpOut6 = nanmean(nanmean(tmpOut,3),2);

index = find(C7U==0); tmp7 = C7T; tmp7(index)= NaN;
indexOut = find(C7U>0); tmpIn = tmp7; tmpIn(indexOut) = NaN; tmpIn7 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(C7U<0); tmpOut = tmp7; tmpOut(indexIn) = NaN; tmpOut7 = nanmean(nanmean(tmpOut,3),2);

index = find(C8U==0); tmp8 = C8T; tmp8(index)= NaN;
indexOut = find(C8U>0); tmpIn = tmp8; tmpIn(indexOut) = NaN; tmpIn8 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(C8U<0); tmpOut = tmp8; tmpOut(indexIn) = NaN; tmpOut8 = nanmean(nanmean(tmpOut,3),2);

index = find(C9U==0); tmp9 = C9T; tmp9(index)= NaN;
indexOut = find(C9U>0); tmpIn = tmp9; tmpIn(indexOut) = NaN; tmpIn9 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(C9U<0); tmpOut = tmp9; tmpOut(indexIn) = NaN; tmpOut9 = nanmean(nanmean(tmpOut,3),2);

index = find(C12U==0); tmp12 = C12T; tmp12(index)= NaN;
indexOut = find(C12U>0); tmpIn = tmp12; tmpIn(indexOut) = NaN; tmpIn12 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(C12U<0); tmpOut = tmp12; tmpOut(indexIn) = NaN; tmpOut12 = nanmean(nanmean(tmpOut,3),2);

CT4 = (tmp5+tmp6+tmp7+tmp8+tmp9+tmp12)/6;
CT4In = (tmpIn5+tmpIn6+tmpIn7+tmpIn8+tmpIn9+tmpIn12)/6;
CT4Out = (tmpOut5+tmpOut6+tmpOut7+tmpOut8+tmpOut9+tmpOut12)/6;


h1 = subplot(2,2,3);
plot(x,CT3In,'b',x,CT4In,'r','Linewidth',3)
%legend('CCSM3','CCSM4','location','northwest')
hold on
plot(x,tmpInb,'b',x,tmpInc,'b',x,tmpIne,'b',x,tmpInf,'b',x,tmpIng,'b')
plot(x,tmpIn5,'r',x,tmpIn6,'r',x,tmpIn7,'r',x,tmpIn8,'r',x,tmpIn9,'r',x,tmpIn12,'r')
hold off
p1 = get(h1,'Position')
title('In')
xticks((1900:50:2100))
%yticks((0:2:10))
ylabel('^\circ C')
grid on

subplot(2,2,4)
plot(x,CT3Out,'b',x,CT4Out,'r','Linewidth',3)
hold on
plot(x,tmpOutb,'b',x,tmpOutc,'b',x,tmpOute,'b',x,tmpOutf,'b',x,tmpOutg,'b')
plot(x,tmpOut5,'r',x,tmpOut6,'r',x,tmpOut7,'r',x,tmpOut8,'r',x,tmpOut9,'r',x,tmpOut12,'r')
hold off
title('Out')
xticks((1900:50:2100))
%yticks((-10:2:0))
grid on

h2 = subplot(2,2,[1 2]);
p2 = get(h2,'Position');
plot(x,nanmean(nanmean(CT3,3),2),'b',x,nanmean(nanmean(CT4,3),2),'r','Linewidth',3)
set(h2,'Position',[p2(1)+(p2(3)-p1(3))/2 p2(2) p1(3) p2(4)])
hold on
plot(x,nanmean(nanmean(tmpb,3),2),'b',x,nanmean(nanmean(tmpc,3),2),'b',x,nanmean(nanmean(tmpe,3),2),'b',x,nanmean(nanmean(tmpf,3),2),'b',x,nanmean(nanmean(tmpg,3),2),'b')
plot(x,nanmean(nanmean(tmp5,3),2),'r',x,nanmean(nanmean(tmp6,3),2),'r',x,nanmean(nanmean(tmp7,3),2),'r',x,nanmean(nanmean(tmp8,3),2),'r',x,nanmean(nanmean(tmp9,3),2),'r',x,nanmean(nanmean(tmp12,3),2),'r')
hold off
title('CAA')
xticks((1900:50:2100))
ylabel('^\circ C')
grid on

% print('CAATM','-djpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tmp = zeros(lat2CAA-lat1CAA+1,1);
for i = 2:lat2CAA-lat1CAA+1
	tmp(i) = sum(HTE(lat1CAA:lat1CAA+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(3);


figure('position', [0, 0, 560, 550])
subplot(2,2,1)
index = find(CT3==0); CT3(index) = NaN;
pcolor(HF,-z3(1:16),squeeze(mean(CT3(1:50,:,:)))); shading interp
xlim([-50 1500])
ylim([-350 0])
title('CCSM3 1900-1950')
caxis([-2 2])
subplot(2,2,2)
pcolor(HF,-z3(1:16),squeeze(mean(CT3(end-50:end,:,:)))); shading interp
xlim([-50 1500])
ylim([-350 0])
title('CCSM3 2050-2099')
caxis([-2 2])
subplot(2,2,3)
index = find(CT4==0); CT4(index) = NaN;
pcolor(HF,-z4(1:30),squeeze(mean(CT4(1:50,:,:)))); shading interp
xlim([-50 1500])
ylim([-350 0])
xticklabels([])
title('CCSM4 1900-1950')
caxis([-2 2])
subplot(2,2,4)
pcolor(HF,-z4(1:30),squeeze(mean(CT4(end-50:end,:,:)))); shading interp
xlim([-50 1500])
ylim([-350 0])
xticklabels([])
title('CCSM4 2050-2099')
caxis([-2 2])

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-2 2])

%print('CAATS','-djpeg')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%    Bering      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ncload b30.040g.ES01.pop.h.2079-08.nc HTE HTN dz
[nt nz n] = size(BEbV);
tmpHTE = repmat(squeeze(HTN(latbering,long1bering:long2bering)'),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:6),[1 nt n]);
tmpz = permute(tmpz,[2 1 3]);
sA3 = tmpHTE.*tmpz/100^2/10^6/100; % /100^2 = cm^2->m-2, /10^6 = -> Sverdrup

ncload b40.20th.track1.1deg.006.pop.h.2005-08.nc dz
[nt nz n] = size(BE12V);
tmpHTE = repmat(squeeze(HTN(latbering,long1bering:long2bering)'),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:6),[1 nt n]); 
tmpz = permute(tmpz,[2 1 3]);
sA4 = tmpHTE.*tmpz/100^2/10^6/100;


index = find(BEbV==0); tmpb = BEbV.*sA3; tmpb(index)= NaN;
indexOut = find(BEbV<0); tmpIn = tmpb; tmpIn(indexOut) = NaN; tmpInb = nansum(nansum(tmpIn,3),2);
indexIn = find(BEbV>0); tmpOut = tmpb; tmpOut(indexIn) = NaN; tmpOutb = nansum(nansum(tmpOut,3),2);

index = find(BEcV==0); tmpc = BEcV.*sA3; tmpc(index)= NaN;
indexOut = find(BEcV<0); tmpIn = tmpc; tmpIn(indexOut) = NaN; tmpInc = nansum(nansum(tmpIn,3),2);
indexIn = find(BEcV>0); tmpOut = tmpc; tmpOut(indexIn) = NaN; tmpOutc = nansum(nansum(tmpOut,3),2);

index = find(BEeV==0); tmpe = BEeV.*sA3; tmpe(index)= NaN;
indexOut = find(BEeV<0); tmpIn = tmpe; tmpIn(indexOut) = NaN; tmpIne = nansum(nansum(tmpIn,3),2);
indexIn = find(BEeV>0); tmpOut = tmpe; tmpOut(indexIn) = NaN; tmpOute = nansum(nansum(tmpOut,3),2);

index = find(BEfV==0); tmpf = BEfV.*sA3; tmpf(index)= NaN;
indexOut = find(BEfV<0); tmpIn = tmpf; tmpIn(indexOut) = NaN; tmpInf = nansum(nansum(tmpIn,3),2);
indexIn = find(BEfV>0); tmpOut = tmpf; tmpOut(indexIn) = NaN; tmpOutf = nansum(nansum(tmpOut,3),2);

index = find(BEgV==0); tmpg = BEgV.*sA3; tmpg(index)= NaN;
indexOut = find(BEgV<0); tmpIn = tmpg; tmpIn(indexOut) = NaN; tmpIng = nansum(nansum(tmpIn,3),2);
indexIn = find(BEgV>0); tmpOut = tmpg; tmpOut(indexIn) = NaN; tmpOutg = nansum(nansum(tmpOut,3),2);

BEV3 = (tmpb+tmpc+tmpe+tmpf+tmpg)/5;
BEV3In = (tmpInb+tmpInc+tmpIne+tmpInf+tmpIng)/5;
BEV3Out = (tmpOutb+tmpOutc+tmpOute+tmpOutf+tmpOutg)/5;

index = find(BE5V==0); tmp5 = BE5V.*sA4; tmp5(index)= NaN;
indexOut = find(BE5V<0); tmpIn = tmp5; tmpIn(indexOut) = NaN; tmpIn5 = nansum(nansum(tmpIn,3),2);
indexIn = find(BE5V>0); tmpOut = tmp5; tmpOut(indexIn) = NaN; tmpOut5 = nansum(nansum(tmpOut,3),2);

index = find(BE6V==0); tmp6 = BE6V.*sA4; tmp6(index)= NaN;
indexOut = find(BE6V<0); tmpIn = tmp6; tmpIn(indexOut) = NaN; tmpIn6 = nansum(nansum(tmpIn,3),2);
indexIn = find(BE6V>0); tmpOut = tmp6; tmpOut(indexIn) = NaN; tmpOut6 = nansum(nansum(tmpOut,3),2);

index = find(BE7V==0); tmp7 = BE7V.*sA4; tmp7(index)= NaN;
indexOut = find(BE7V<0); tmpIn = tmp7; tmpIn(indexOut) = NaN; tmpIn7 = nansum(nansum(tmpIn,3),2);
indexIn = find(BE7V>0); tmpOut = tmp7; tmpOut(indexIn) = NaN; tmpOut7 = nansum(nansum(tmpOut,3),2);

index = find(BE8V==0); tmp8 = BE8V.*sA4; tmp8(index)= NaN;
indexOut = find(BE8V<0); tmpIn = tmp8; tmpIn(indexOut) = NaN; tmpIn8 = nansum(nansum(tmpIn,3),2);
indexIn = find(BE8V>0); tmpOut = tmp8; tmpOut(indexIn) = NaN; tmpOut8 = nansum(nansum(tmpOut,3),2);

index = find(BE9V==0); tmp9 = BE9V.*sA4; tmp9(index)= NaN;
indexOut = find(BE9V<0); tmpIn = tmp9; tmpIn(indexOut) = NaN; tmpIn9 = nansum(nansum(tmpIn,3),2);
indexIn = find(BE9V>0); tmpOut = tmp9; tmpOut(indexIn) = NaN; tmpOut9 = nansum(nansum(tmpOut,3),2);

index = find(BE12V==0); tmp12 = BE12V.*sA4; tmp12(index)= NaN;
indexOut = find(BE12V<0); tmpIn = tmp12; tmpIn(indexOut) = NaN; tmpIn12 = nansum(nansum(tmpIn,3),2);
indexIn = find(BE12V>0); tmpOut = tmp12; tmpOut(indexIn) = NaN; tmpOut12 = nansum(nansum(tmpOut,3),2);

BEV4 = (tmp5+tmp6+tmp7+tmp8+tmp9+tmp12)/6;
BEV4In = (tmpIn5+tmpIn6+tmpIn7+tmpIn8+tmpIn9+tmpIn12)/6;
BEV4Out = (tmpOut5+tmpOut6+tmpOut7+tmpOut8+tmpOut9+tmpOut12)/6;


h1 = subplot(2,2,3);
plot(x,BEV3In,'b',x,BEV4In,'r','Linewidth',3)
%legend('CCSM3','CCSM4','location','northwest')
hold on
plot(x,tmpInb,'b',x,tmpInc,'b',x,tmpIne,'b',x,tmpInf,'b',x,tmpIng,'b')
plot(x,tmpIn5,'r',x,tmpIn6,'r',x,tmpIn7,'r',x,tmpIn8,'r',x,tmpIn9,'r',x,tmpIn12,'r')
hold off
p1 = get(h1,'Position')
title('In')
xticks((1900:50:2100))
yticks((0:10:50))
ylabel('Sverdrup')
grid on

subplot(2,2,4)
plot(x,BEV3Out,'b',x,BEV4Out,'r','Linewidth',3)
hold on
plot(x,tmpOutb,'b',x,tmpOutc,'b',x,tmpOute,'b',x,tmpOutf,'b',x,tmpOutg,'b')
plot(x,tmpOut5,'r',x,tmpOut6,'r',x,tmpOut7,'r',x,tmpOut8,'r',x,tmpOut9,'r',x,tmpOut12,'r')
hold off
title('Out')
xticks((1900:50:2100))
yticks([(-2:0.5:0)])
grid on

h2 = subplot(2,2,[1 2]);
p2 = get(h2,'Position');
plot(x,nansum(nansum(BEV3,3),2),'b',x,nansum(nansum(BEV4,3),2),'r','Linewidth',3)
set(h2,'Position',[p2(1)+(p2(3)-p1(3))/2 p2(2) p1(3) p2(4)])
hold on
plot(x,nansum(nansum(tmpb,3),2),'b',x,nansum(nansum(tmpc,3),2),'b',x,nansum(nansum(tmpe,3),2),'b',x,nansum(nansum(tmpf,3),2),'b',x,nansum(nansum(tmpg,3),2),'b')
plot(x,nansum(nansum(tmp5,3),2),'r',x,nansum(nansum(tmp6,3),2),'r',x,nansum(nansum(tmp7,3),2),'r',x,nansum(nansum(tmp8,3),2),'r',x,nansum(nansum(tmp9,3),2),'r',x,nansum(nansum(tmp12,3),2),'r')
hold off
title('Bering Strait')
xticks((1900:50:2100))

ylabel('Sverdrup')
grid on



plot(x,nansum(nansum(BEV3,3),2),'b',x,nansum(nansum(BEV4,3),2),'r','Linewidth',3)
set(h2,'Position',[p2(1)+(p2(3)-p1(3))/2 p2(2) p1(3) p2(4)])
hold on
plot(x,nansum(nansum(tmpb,3),2),'b',x,nansum(nansum(tmpc,3),2),'b',x,nansum(nansum(tmpe,3),2),'b',x,nansum(nansum(tmpf,3),2),'b',x,nansum(nansum(tmpg,3),2),'b')
plot(x,nansum(nansum(tmp5,3),2),'r',x,nansum(nansum(tmp6,3),2),'r',x,nansum(nansum(tmp7,3),2),'r',x,nansum(nansum(tmp8,3),2),'r',x,nansum(nansum(tmp9,3),2),'r',x,nansum(nansum(tmp12,3),2),'r')
hold off
title('Bering Strait')
ylabel('Sverdrup')
grid on

% print('BeringVM','-djpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


index = find(BEbV==0); tmpb = BEbT; tmpb(index)= NaN;
indexOut = find(BEbV<0); tmpIn = tmpb; tmpIn(indexOut) = NaN; tmpInb = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BEbV>0); tmpOut = tmpb; tmpOut(indexIn) = NaN; tmpOutb = nanmean(nanmean(tmpOut,3),2);

index = find(BEcV==0); tmpc = BEcT; tmpc(index)= NaN;
indexOut = find(BEcV<0); tmpIn = tmpc; tmpIn(indexOut) = NaN; tmpInc = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BEcV>0); tmpOut = tmpc; tmpOut(indexIn) = NaN; tmpOutc = nanmean(nanmean(tmpOut,3),2);

index = find(BEeV==0); tmpe = BEeT; tmpe(index)= NaN;
indexOut = find(BEeV<0); tmpIn = tmpe; tmpIn(indexOut) = NaN; tmpIne = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BEeV>0); tmpOut = tmpe; tmpOut(indexIn) = NaN; tmpOute = nanmean(nanmean(tmpOut,3),2);

index = find(BEfV==0); tmpf = BEfT; tmpf(index)= NaN;
indexOut = find(BEfV<0); tmpIn = tmpf; tmpIn(indexOut) = NaN; tmpInf = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BEfV>0); tmpOut = tmpf; tmpOut(indexIn) = NaN; tmpOutf = nanmean(nanmean(tmpOut,3),2);

index = find(BEgV==0); tmpg = BEgT; tmpg(index)= NaN;
indexOut = find(BEgV<0); tmpIn = tmpg; tmpIn(indexOut) = NaN; tmpIng = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BEgV>0); tmpOut = tmpg; tmpOut(indexIn) = NaN; tmpOutg = nanmean(nanmean(tmpOut,3),2);

BET3 = (tmpb+tmpc+tmpe+tmpf+tmpg)/5;
BET3In = (tmpInb+tmpInc+tmpIne+tmpInf+tmpIng)/5;
BET3Out = (tmpOutb+tmpOutc+tmpOute+tmpOutf+tmpOutg)/5;


index = find(BE5V==0); tmp5 = BE5T; tmp5(index)= NaN;
indexOut = find(BE5V<0); tmpIn = tmp5; tmpIn(indexOut) = NaN; tmpIn5 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BE5V>0); tmpOut = tmp5; tmpOut(indexIn) = NaN; tmpOut5 = nanmean(nanmean(tmpOut,3),2);

index = find(BE6V==0); tmp6 = BE6T; tmp6(index)= NaN;
indexOut = find(BE6V<0); tmpIn = tmp6; tmpIn(indexOut) = NaN; tmpIn6 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BE6V>0); tmpOut = tmp6; tmpOut(indexIn) = NaN; tmpOut6 = nanmean(nanmean(tmpOut,3),2);

index = find(BE7V==0); tmp7 = BE7T; tmp7(index)= NaN;
indexOut = find(BE7V<0); tmpIn = tmp7; tmpIn(indexOut) = NaN; tmpIn7 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BE7V>0); tmpOut = tmp7; tmpOut(indexIn) = NaN; tmpOut7 = nanmean(nanmean(tmpOut,3),2);

index = find(BE8V==0); tmp8 = BE8T; tmp8(index)= NaN;
indexOut = find(BE8V<0); tmpIn = tmp8; tmpIn(indexOut) = NaN; tmpIn8 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BE8V>0); tmpOut = tmp8; tmpOut(indexIn) = NaN; tmpOut8 = nanmean(nanmean(tmpOut,3),2);

index = find(BE9V==0); tmp9 = BE9T; tmp9(index)= NaN;
indexOut = find(BE9V<0); tmpIn = tmp9; tmpIn(indexOut) = NaN; tmpIn9 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BE9V>0); tmpOut = tmp9; tmpOut(indexIn) = NaN; tmpOut9 = nanmean(nanmean(tmpOut,3),2);

index = find(BE12V==0); tmp12 = BE12T; tmp12(index)= NaN;
indexOut = find(BE12V<0); tmpIn = tmp12; tmpIn(indexOut) = NaN; tmpIn12 = nanmean(nanmean(tmpIn,3),2);
indexIn = find(BE12V>0); tmpOut = tmp12; tmpOut(indexIn) = NaN; tmpOut12 = nanmean(nanmean(tmpOut,3),2);

BET4 = (tmp5+tmp6+tmp7+tmp8+tmp9+tmp12)/6;
BET4In = (tmpIn5+tmpIn6+tmpIn7+tmpIn8+tmpIn9+tmpIn12)/6;
BET4Out = (tmpOut5+tmpOut6+tmpOut7+tmpOut8+tmpOut9+tmpOut12)/6;






h1 = subplot(2,2,3);
plot(x,BET3In,'b',x,BET4In,'r','Linewidth',3)
%legend('CCSM3','CCSM4','location','northwest')
hold on
plot(x,tmpInb,'b',x,tmpInc,'b',x,tmpIne,'b',x,tmpInf,'b',x,tmpIng,'b')
plot(x,tmpIn5,'r',x,tmpIn6,'r',x,tmpIn7,'r',x,tmpIn8,'r',x,tmpIn9,'r',x,tmpIn12,'r')
hold off
p1 = get(h1,'Position')
title('In')
xticks((1900:50:2100))
%yticks((0:2:10))
ylabel('^\circ C')
grid on

subplot(2,2,4)
plot(x,BET3Out,'b',x,BET4Out,'r','Linewidth',3)
hold on
plot(x,tmpOutb,'b',x,tmpOutc,'b',x,tmpOute,'b',x,tmpOutf,'b',x,tmpOutg,'b')
plot(x,tmpOut5,'r',x,tmpOut6,'r',x,tmpOut7,'r',x,tmpOut8,'r',x,tmpOut9,'r',x,tmpOut12,'r')
hold off
title('Out')
xticks((1900:50:2100))
%yticks((-10:2:0))
grid on

h2 = subplot(2,2,[1 2]);
p2 = get(h2,'Position');
plot(x,nanmean(nanmean(BET3,3),2),'b',x,nanmean(nanmean(BET4,3),2),'r','Linewidth',3)
set(h2,'Position',[p2(1)+(p2(3)-p1(3))/2 p2(2) p1(3) p2(4)])
hold on
plot(x,nanmean(nanmean(tmpb,3),2),'b',x,nanmean(nanmean(tmpc,3),2),'b',x,nanmean(nanmean(tmpe,3),2),'b',x,nanmean(nanmean(tmpf,3),2),'b',x,nanmean(nanmean(tmpg,3),2),'b')
plot(x,nanmean(nanmean(tmp5,3),2),'r',x,nanmean(nanmean(tmp6,3),2),'r',x,nanmean(nanmean(tmp7,3),2),'r',x,nanmean(nanmean(tmp8,3),2),'r',x,nanmean(nanmean(tmp9,3),2),'r',x,nanmean(nanmean(tmp12,3),2),'r')
hold off
title('Bering Strait')
xticks((1900:50:2100))
ylabel('^\circ C')
grid on




plot(x,nanmean(nanmean(BET3,3),2),'b',x,nanmean(nanmean(BET4,3),2),'r','Linewidth',3)
set(h2,'Position',[p2(1)+(p2(3)-p1(3))/2 p2(2) p1(3) p2(4)])
hold on
plot(x,nanmean(nanmean(tmpb,3),2),'b',x,nanmean(nanmean(tmpc,3),2),'b',x,nanmean(nanmean(tmpe,3),2),'b',x,nanmean(nanmean(tmpf,3),2),'b',x,nanmean(nanmean(tmpg,3),2),'b')
plot(x,nanmean(nanmean(tmp5,3),2),'r',x,nanmean(nanmean(tmp6,3),2),'r',x,nanmean(nanmean(tmp7,3),2),'r',x,nanmean(nanmean(tmp8,3),2),'r',x,nanmean(nanmean(tmp9,3),2),'r',x,nanmean(nanmean(tmp12,3),2),'r')
hold off
title('Bering Strait')
xticks((1900:50:2100))
ylabel('^\circ C')
grid on
% print('BeringTM','-djpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,1,1)
plot(x,nansum(nansum(BEV3,3),2),'b',x,nansum(nansum(BEV4,3),2),'r','Linewidth',3)
hold on
plot(x,nansum(nansum(tmpb,3),2),'b',x,nansum(nansum(tmpc,3),2),'b',x,nansum(nansum(tmpe,3),2),'b',x,nansum(nansum(tmpf,3),2),'b',x,nansum(nansum(tmpg,3),2),'b')
plot(x,nansum(nansum(tmp5,3),2),'r',x,nansum(nansum(tmp6,3),2),'r',x,nansum(nansum(tmp7,3),2),'r',x,nansum(nansum(tmp8,3),2),'r',x,nansum(nansum(tmp9,3),2),'r',x,nansum(nansum(tmp12,3),2),'r')
hold off
title('Bering Strait')
ylabel('Sverdrup')
grid on
%yticks((0:25:150))
subplot(2,1,2)
plot(x,nanmean(nanmean(BET3,3),2),'b',x,nanmean(nanmean(BET4,3),2),'r','Linewidth',3)
hold on
plot(x,nanmean(nanmean(tmpb,3),2),'b',x,nanmean(nanmean(tmpc,3),2),'b',x,nanmean(nanmean(tmpe,3),2),'b',x,nanmean(nanmean(tmpf,3),2),'b',x,nanmean(nanmean(tmpg,3),2),'b')
plot(x,nanmean(nanmean(tmp5,3),2),'r',x,nanmean(nanmean(tmp6,3),2),'r',x,nanmean(nanmean(tmp7,3),2),'r',x,nanmean(nanmean(tmp8,3),2),'r',x,nanmean(nanmean(tmp9,3),2),'r',x,nanmean(nanmean(tmp12,3),2),'r')
hold off
xticks((1900:50:2100))
ylabel('^\circ C')
ylim([-2 5])
yticks((-2:1:5))
grid on
% print('BeringVTM','-djpeg')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




t = nansum(nansum(FU3,2),3)+nansum(nansum(BAU3,2),3)-nansum(nansum(CU3,2),3)+nansum(nansum(BEV3,2),3);
x = (1900:1:2099);
plot(x,nansum(nansum(FU3,3),2),x,nansum(nansum(BEV3,3),2),x,nansum(nansum(BAU3,3),2),x,-nansum(nansum(CU3,3),2),x,t,'linewidth',2)
legend('Fram','Bering','BSO','CAA','Total')
grid on
ylabel('Sverdrup')
title('Arctic volume transport budget, CCSM3')
print('BV3','-djpeg')



t = nansum(nansum(FU4,2),3)+nansum(nansum(BAU4,2),3)-nansum(nansum(CU4,2),3)+nansum(nansum(BEV4,2),3);
x = (1900:1:2099);
plot(x,nansum(nansum(FU4,3),2),x,nansum(nansum(BEV4,3),2),x,nansum(nansum(BAU4,3),2),x,-nansum(nansum(CU4,3),2),x,t,'linewidth',2)
legend('Fram','Bering','BSO','CAA','Total')
grid on
ylabel('Sverdrup')
title('Arctic volume transport budget, CCSM4')
print('BV4','-djpeg')



