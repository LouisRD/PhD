clear 
load Gates3.mat
load conv3.mat
F3conv200 = repmat(Fconv,[20 1 1])/10^12;
BA3conv200 = repmat(BAconv,[20 1 1])/10^12;
C3conv200 = repmat(Cconv,[20 1 1])/10^12;
BE3conv200 = repmat(BEconv,[20 1 1])/10^12;
load Gates4.mat
load conv4.mat
F4conv200 = repmat(Fconv4,[20 1 1])/10^12;
BA4conv200 = repmat(BAconv4,[20 1 1])/10^12;
C4conv200 = repmat(Cconv4,[20 1 1])/10^12;
BE4conv200 = repmat(BEconv4,[20 1 1])/10^12;

addpath /glade/u/home/renaud/scripts
ncload b30.040g.ES01.pop.h.2079-08.nc HTE HTN z_w
z3 = z_w/100; 
ncload b40.20th.track1.1deg.006.pop.h.2005-08.nc z_w
z4 = z_w/100; 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%    Fram        %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


FM3 = (Fb+Fc+Fe+Ff+Fg)/5;
FM4 = (F5+F6+F7+F8+F9+F12)/6;


tmp = zeros(lat2fram-lat1fram+1,1);
for i = 2:lat2fram-lat1fram+1
	tmp(i) = sum(HTE(lat1fram:lat1fram+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(4);

addpath /glade/u/home/renaud/scripts
ncload b30.040g.ES01.pop.h.2079-08.nc HTE HTN dz
[nt nz n] = size(Fb);
tmpHTE = repmat(squeeze(HTE(lat1fram:lat2fram,longfram)),[1 nz]);
tmpHTE = permute(tmpHTE,[2 1]);
tmpz = repmat(dz(1:30),[1 n]);
sA3 = tmpHTE.*tmpz/100^2;
ncload b40.20th.track1.1deg.006.pop.h.2005-08.nc dz
[nt nz n] = size(F12);
tmpHTE = repmat(squeeze(HTE(lat1fram:lat2fram,longfram)),[1 nz]);
tmpHTE = permute(tmpHTE,[2 1]);
tmpz = repmat(dz(1:50),[1 n]); 
sA4 = tmpHTE.*tmpz/100^2;

x = (1900:2099);

%% Plot mean plus spatial differences

%subplot(2,2,[1 2])
subplot(3,2,[1 2 3 4])

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
legend('CCSM3','CCSM4','location','southwest')
ylabel('Energy flux (TeraWatts = 10^{12} W)')

sublot(3,2,5)

index = find(FM3==0); FM3(index) = NaN;
pcolor(HF,-z3(1:30),(squeeze(mean(FM3(end-50:end,:,:).*F3conv200(1:51,:,:)))-squeeze(mean(FM3(1:50,:,:).*F3conv200(1:50,:,:))))./sA3*10^6); shading interp
xlim([-50 500])
ylim([-2600 0])
title('CCSM3')
caxis([-0.5 1])

sublot(3,2,6)

pcolor(HF,-z4(1:50),(squeeze(mean(FM4(end-50:end,:,:).*F4conv200(1:51,:,:))) - squeeze(mean(FM4(1:50,:,:).*F4conv200(1:50,:,:))))./sA4*10^6); shading interp
xlim([-50 500])
ylim([-2600 0])
xticklabels([])
title('CCSM4')
caxis([-0.5 1])

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-0.5 1])

% print('framHF','-djpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



tmp = nansum(nansum(FM4.*F4conv200,3),2);
polyfit(x(100:end)',tmp(100:end),1)

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
legend('CCSM3','CCSM4','location','southwest')
title('Fram Strait')
ylabel('Energy flux (TeraWatts = 10^{12} W)')
% print('FramM','-djpeg')


tmp = zeros(lat2fram-lat1fram+1,1);
for i = 2:lat2fram-lat1fram+1
	tmp(i) = sum(HTE(lat1fram:lat1fram+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(4);

addpath /glade/u/home/renaud/scripts
ncload b30.040g.ES01.pop.h.2079-08.nc HTE HTN dz
[nt nz n] = size(Fb);
tmpHTE = repmat(squeeze(HTE(lat1fram:lat2fram,longfram)),[1 nz]);
tmpHTE = permute(tmpHTE,[2 1]);
tmpz = repmat(dz(1:30),[1 n]);
sA3 = tmpHTE.*tmpz/100^2;
ncload b40.20th.track1.1deg.006.pop.h.2005-08.nc dz
[nt nz n] = size(F12);
tmpHTE = repmat(squeeze(HTE(lat1fram:lat2fram,longfram)),[1 nz]);
tmpHTE = permute(tmpHTE,[2 1]);
tmpz = repmat(dz(1:50),[1 n]); 
sA4 = tmpHTE.*tmpz/100^2;

figure('position', [0, 0, 560, 550])
subplot(2,2,1)
index = find(FM3==0); FM3(index) = NaN;
pcolor(HF,-z3(1:30),squeeze(mean(FM3(1:50,:,:).*F3conv200(1:50,:,:)))./sA3*10^6); shading interp
xlim([-50 500])
ylim([-2600 0])
title('CCSM3 1900-1950')
caxis([-0.5 1])
subplot(2,2,2)
pcolor(HF,-z3(1:30),squeeze(mean(FM3(end-50:end,:,:).*F3conv200(1:51,:,:)))./sA3*10^6); shading interp
xlim([-50 500])
ylim([-2600 0])
title('CCSM3 2050-2099')
caxis([-0.5 1])
subplot(2,2,3)
index = find(FM4==0); FM4(index) = NaN;
pcolor(HF,-z4(1:50),squeeze(mean(FM4(1:50,:,:).*F4conv200(1:50,:,:)))./sA4*10^6); shading interp
xlim([-50 500])
ylim([-2600 0])
xticklabels([])
title('CCSM4 1900-1950')
caxis([-0.5 1])
subplot(2,2,4)
pcolor(HF,-z4(1:50),squeeze(mean(FM4(end-50:end,:,:).*F4conv200(1:51,:,:)))./sA4*10^6); shading interp
xlim([-50 500])
ylim([-2600 0])
xticklabels([])
title('CCSM4 2050-2099')
caxis([-0.5 1])

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-0.5 1])

%print('FramS','-djpeg')




figure('position', [0, 0, 560, 550])

subplot(2,3,1)
index = find(FM3==0); FM3(index) = NaN;
pcolor(HF,-z3(1:30),squeeze(mean(FM3(1:50,:,:).*F3conv200(1:50,:,:)))./sA3*10^6); shading interp
xlim([-50 500])
ylim([-2600 0])
title('CCSM3 1900-1950')
caxis([-0.5 1])
subplot(2,3,2)
pcolor(HF,-z3(1:30),squeeze(mean(FM3(end-50:end,:,:).*F3conv200(1:51,:,:)))./sA3*10^6); shading interp
xlim([-50 500])
ylim([-2600 0])
title('CCSM3 2050-2099')
caxis([-0.5 1])

subplot(2,3,3)
pcolor(HF,-z3(1:30),squeeze(mean(FM3(end-50:end,:,:).*F3conv200(1:51,:,:)))./sA3*10^6-squeeze(mean(FM3(1:50,:,:).*F3conv200(1:50,:,:)))./sA3*10^6); shading interp
xlim([-50 500])
ylim([-2600 0])
title('\Delta 3')
caxis([-0.5 1])

subplot(2,3,4)
index = find(FM4==0); FM4(index) = NaN;
pcolor(HF,-z4(1:50),squeeze(mean(FM4(1:50,:,:).*F4conv200(1:50,:,:)))./sA4*10^6); shading interp
xlim([-50 500])
ylim([-2600 0])
xticklabels([])
title('CCSM4 1900-1950')
caxis([-0.5 1])
subplot(2,3,5)
pcolor(HF,-z4(1:50),squeeze(mean(FM4(end-50:end,:,:).*F4conv200(1:51,:,:)))./sA4*10^6); shading interp
xlim([-50 500])
ylim([-2600 0])
xticklabels([])
title('CCSM4 2050-2099')
caxis([-0.5 1])

subplot(2,3,6)
pcolor(HF,-z4(1:50),squeeze(mean(FM4(end-50:end,:,:).*F4conv200(1:51,:,:)))./sA4*10^6-squeeze(mean(FM4(1:50,:,:).*F4conv200(1:50,:,:)))./sA4*10^6); shading interp
xlim([-50 500])
ylim([-2600 0])
xticklabels([])
title('\Delta 4')
caxis([-0.5 1])

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-0.5 1])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%    Barents        %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


BAM3 = (BAb+BAc+BAe+BAf+BAg)/5;
BAM4 = (BA5+BA6+BA7+BA8+BA9+BA12)/6;

x = (1900:2099);

tmp = nansum(nansum(BAM4.*BA4conv200,3),2);
mean(tmp(97:107))

tmp = nansum(nansum(BAM3.*BA3conv200,3),2);
polyfit(x(1:80),tmp(1:80)',1)
polyfit(x(80:170),tmp(80:170)',1)
polyfit(x(170:end),tmp(170:end)',1)
tmp = nansum(nansum(BAM4.*BA4conv200,3),2);
polyfit(x(80:end),tmp(80:end)',1)



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
ylim([-10 175])
legend('CCSM3','CCSM4','location','northwest')
title('Barents Sea Opening')
ylabel('Energy flux (TeraWatts = 10^{12} W)')
% print('BarentsM','-djpeg')


lat1barents = 334;
lat2barents = 369;
longbarents = 100;
addpath /glade/u/home/renaud/scripts
ncload b30.040g.ES01.pop.h.2079-08.nc HTE dz
z3 = z_w/100; 
[nt nz n] = size(BAb);
tmpHTE = repmat(squeeze(HTE(lat1barents:lat2barents,longbarents)),[1 nz]);
tmpHTE = permute(tmpHTE,[2 1]);
tmpz = repmat(dz(1:16),[1 n]);
sA3 = tmpHTE.*tmpz/100^2;
ncload b40.20th.track1.1deg.006.pop.h.2005-08.nc dz
z4 = z_w/100; 
[nt nz n] = size(BA12);
tmpHTE = repmat(squeeze(HTE(lat1barents:lat2barents,longbarents)),[1 nz]);
tmpHTE = permute(tmpHTE,[2 1]);
tmpz = repmat(dz(1:30),[1 n]); 
sA4 = tmpHTE.*tmpz/100^2;

tmp = zeros(lat2barents-lat1barents+1,1);
for i = 2:lat2barents-lat1barents+1
	tmp(i) = sum(HTE(lat1barents:lat1barents+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(3);

figure('position', [0, 0, 560, 550])
subplot(2,2,1)
index = find(BAM3==0); BAM3(index) = NaN;
pcolor(HF,-z3(1:16),squeeze(mean(BAM3(1:50,:,:).*BA3conv200(1:50,:,:)))./sA3*10^6); shading interp
xlim([-50 700])
ylim([-260 0])
title('CCSM3 1900-1950')
caxis([-1 3])
subplot(2,2,2)
pcolor(HF,-z3(1:16),squeeze(mean(BAM3(end-50:end,:,:).*BA3conv200(1:51,:,:)))./sA3*10^6); shading interp
xlim([-50 700])
ylim([-260 0])
title('CCSM3 2050-2099')
caxis([-1 3])
subplot(2,2,3)
index = find(BAM4==0); BAM4(index) = NaN;
pcolor(HF,-z4(1:30),squeeze(mean(BAM4(1:50,:,:).*BA4conv200(1:50,:,:)))./sA4*10^6); shading interp
xlim([-50 700])
ylim([-260 0])
xticklabels([])
title('CCSM4 1900-1950')
caxis([-1 3])
subplot(2,2,4)
pcolor(HF,-z4(1:30),squeeze(mean(BAM4(end-50:end,:,:).*BA4conv200(1:51,:,:)))./sA4*10^6); shading interp
xlim([-50 700])
ylim([-260 0])
xticklabels([])
title('CCSM4 2050-2099')
caxis([-1 3])

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-1 3])

%print('BarentsS','-djpeg')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%    CAA        %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


CM3 = (Cb+Cc+Ce+Cf+Cg)/5;
CM4 = (C5+C6+C7+C8+C9+C12)/6;

x = (1900:2099);

tmp = squeeze(nansum(nansum(CM3.*C3conv200,3),2));
polyfit(x(1:100),tmp(1:100)',1)
polyfit(x(100:end),tmp(100:end)',1)

tmp = squeeze(nansum(nansum(CM4.*C4conv200,3),2));
polyfit(x(1:100),tmp(1:100)',1)
polyfit(x(100:end),tmp(100:end)',1)


plot(x,nansum(nansum(-Cb.*C3conv200,3),2),'b',...
	x,nansum(nansum(-C5.*C4conv200,3),2),'r',...
	x,nansum(nansum(-Cc.*C3conv200,3),2),'b',...
	x,nansum(nansum(-Ce.*C3conv200,3),2),'b',...
	x,nansum(nansum(-Cf.*C3conv200,3),2),'b',...
	x,nansum(nansum(-Cg.*C3conv200,3),2),'b',...
	x,nansum(nansum(-C6.*C4conv200,3),2),'r',...
	x,nansum(nansum(-C7.*C4conv200,3),2),'r',...
	x,nansum(nansum(-C8.*C4conv200,3),2),'r',...
	x,nansum(nansum(-C9.*C4conv200,3),2),'r',...
	x,nansum(nansum(-C12.*C4conv200,3),2),'r')
grid on 
hold on
plot(x,nansum(nansum(-CM3.*C3conv200,3),2),'b',...
	x,nansum(nansum(-CM4.*C4conv200,3),2),'r','linewidth',3)
hold off
legend('CCSM3','CCSM4','location','northeast')
title('Canadian Arctic Archipelago')
ylabel('Energy flux (TeraWatts = 10^{12} W)')
% print('CAAM','-djpeg')




lat1CAA = 333;
lat2CAA = 384;
longCAA = 230;

addpath /glade/u/home/renaud/scripts
ncload b30.040g.ES01.pop.h.2079-08.nc HTE dz z_w
z3 = z_w/100; 
[nt nz n] = size(Cb);
tmpHTE = repmat(squeeze(HTE(lat1CAA:lat2CAA,longCAA)),[1 nz]);
tmpHTE = permute(tmpHTE,[2 1]);
tmpz = repmat(dz(1:16),[1 n]);
sA3 = tmpHTE.*tmpz/100^2;
ncload b40.20th.track1.1deg.006.pop.h.2005-08.nc dz z_w
z4 = z_w/100; 
[nt nz n] = size(C12);
tmpHTE = repmat(squeeze(HTE(lat1CAA:lat2CAA,longCAA)),[1 nz]);
tmpHTE = permute(tmpHTE,[2 1]);
tmpz = repmat(dz(1:30),[1 n]); 
sA4 = tmpHTE.*tmpz/100^2;

tmp = zeros(lat2CAA-lat1CAA+1,1);
for i = 2:lat2CAA-lat1CAA+1
	tmp(i) = sum(HTE(lat1CAA:lat1CAA+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(3);

figure('position', [0, 0, 560, 550])
subplot(2,2,1)
index = find(CM3==0); CM3(index) = NaN;
pcolor(HF,-z3(1:16),squeeze(mean(-CM3(1:50,:,:).*C3conv200(1:50,:,:)))./sA3*10^6); shading interp
xlim([-50 1500])
ylim([-350 0])
title('CCSM3 1900-1950')
caxis([-0.1 1])
subplot(2,2,2)
pcolor(HF,-z3(1:16),squeeze(mean(-CM3(end-50:end,:,:).*C3conv200(1:51,:,:)))./sA3*10^6); shading interp
xlim([-50 1500])
ylim([-350 0])
title('CCSM3 2050-2099')
caxis([-0.1 1])
subplot(2,2,3)
index = find(CM4==0); CM4(index) = NaN;
pcolor(HF,-z4(1:30),squeeze(mean(-CM4(1:50,:,:).*C4conv200(1:50,:,:)))./sA4*10^6); shading interp
xlim([-50 1500])
ylim([-350 0])
xticklabels([])
title('CCSM4 1900-1950')
caxis([-0.1 1])
subplot(2,2,4)
pcolor(HF,-z4(1:30),squeeze(mean(-CM4(end-50:end,:,:).*C4conv200(1:51,:,:)))./sA4*10^6); shading interp
xlim([-50 1500])
ylim([-350 0])
xticklabels([])
title('CCSM4 2050-2099')
caxis([-0.1 1])

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-0.1 1])

%print('CAAS','-djpeg')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%    Bering       %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


BEM3 = (BEb+BEc+BEe+BEf+BEg)/5;
BEM4 = (BE5+BE6+BE7+BE8+BE9+BE12)/6;

x = (1900:2099);

tmp = squeeze(nansum(nansum(BEM3.*BE3conv200,3),2));
polyfit(x(1:100),tmp(1:100)',1)
polyfit(x(100:end),tmp(100:end)',1)

tmp = squeeze(nansum(nansum(BEM4.*BE4conv200,3),2));
polyfit(x(1:100),tmp(1:100)',1)
polyfit(x(100:end),tmp(100:end)',1)

plot(x,nansum(nansum(BEb.*BE3conv200,3),2),'b',...
	x,nansum(nansum(BE5.*BE4conv200,3),2),'r',...
	x,nansum(nansum(BEc.*BE3conv200,3),2),'b',...
	x,nansum(nansum(BEe.*BE3conv200,3),2),'b',...
	x,nansum(nansum(BEf.*BE3conv200,3),2),'b',...
	x,nansum(nansum(BEg.*BE3conv200,3),2),'b',...
	x,nansum(nansum(BE6.*BE4conv200,3),2),'r',...
	x,nansum(nansum(BE7.*BE4conv200,3),2),'r',...
	x,nansum(nansum(BE8.*BE4conv200,3),2),'r',...
	x,nansum(nansum(BE9.*BE4conv200,3),2),'r',...
	x,nansum(nansum(BE12.*BE4conv200,3),2),'r')
grid on 
hold on
plot(x,nansum(nansum(BEM3.*BE3conv200,3),2),'b',...
	x,nansum(nansum(BEM4.*BE4conv200,3),2),'r','linewidth',3)
hold off
ylim([-5 20])
legend('CCSM3','CCSM4','location','northwest')
title('Barents Sea Opening')
ylabel('Energy flux (TeraWatts = 10^{12} W)')
% print('BeringM','-djpeg')

latbering = 333;
long1bering = 198;
long2bering = 202;
addpath /glade/u/home/renaud/scripts
ncload b30.040g.ES01.pop.h.2079-08.nc HTN dz z_w
z3 = z_w/100; 
[nt nz n] = size(BEb);
tmpHTN = repmat(squeeze(HTN(latbering,long1bering:long2bering))',[1 nz]);
tmpHTN = permute(tmpHTN,[2 1]);
tmpz = repmat(dz(1:6),[1 n]);
sA3 = tmpHTN.*tmpz/100^2;
ncload b40.20th.track1.1deg.006.pop.h.2005-08.nc dz z_w
z4 = z_w/100; 
[nt nz n] = size(BE12);
tmpHTN = repmat(squeeze(HTN(latbering,long1bering:long2bering))',[1 nz]);
tmpHTN = permute(tmpHTN,[2 1]);
tmpz = repmat(dz(1:6),[1 n]); 
sA4 = tmpHTN.*tmpz/100^2;

tmp = zeros(long2bering-long1bering+1,1);
for i = 2:long2bering-long1bering+1
	tmp(i) = sum(HTN(long1bering:long1bering+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(2);

figure('position', [0, 0, 560, 550])
subplot(2,2,1)
index = find(BEM3==0); BEM3(index) = NaN;
pcolor(HF,-z3(1:6),squeeze(mean(BEM3(1:50,:,:).*BE3conv200(1:50,:,:)))./sA3*10^6); shading interp
xlim([-50 300])
ylim([-50 0])
title('CCSM3 1900-1950')
caxis([-1 3])
subplot(2,2,2)
pcolor(HF,-z3(1:6),squeeze(mean(BEM3(end-50:end,:,:).*BE3conv200(1:51,:,:)))./sA3*10^6); shading interp
xlim([-50 300])
ylim([-50 0])
title('CCSM3 2050-2099')
caxis([-1 3])
subplot(2,2,3)
index = find(BEM4==0); BEM4(index) = NaN;
pcolor(HF,-z4(1:6),squeeze(mean(BEM4(1:50,:,:).*BE4conv200(1:50,:,:)))./sA4*10^6); shading interp
xlim([-50 300])
ylim([-50 0])
xticklabels([])
title('CCSM4 1900-1950')
caxis([-1 3])
subplot(2,2,4)
pcolor(HF,-z4(1:6),squeeze(mean(BEM4(end-50:end,:,:).*BE4conv200(1:51,:,:)))./sA4*10^6); shading interp
xlim([-50 300])
ylim([-50 0])
xticklabels([])
title('CCSM4 2050-2099')
caxis([-1 3])

colorbar('off')
axes('Position', [0.3 0 0.43 0.3], 'Visible', 'off');
colorbar('southoutside');
caxis([-1 3])

%print('BeringS','-djpeg')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = nansum(nansum(FM3.*F3conv200,3),2)+nansum(nansum(BAM3.*BA3conv200,3),2)-nansum(nansum(CM3.*C3conv200,3),2)+nansum(nansum(BEM3.*BE3conv200,3),2);
x = (1900:1:2099);
plot(x,nansum(nansum(FM3.*F3conv200,3),2),x,nansum(nansum(BEM3.*BE3conv200,3),2),x,nansum(nansum(BAM3.*BA3conv200,3),2),x,-nansum(nansum(CM3.*C3conv200,3),2),x,t,'linewidth',2)
legend('Fram','Bering','BSO','CAA','Total','location','northwest')
grid on
ylabel('TeraWatt')
title('Arctic heat transport budget, CCSM3')
print('BH3','-djpeg')




t = nansum(nansum(FM4.*F4conv200,3),2)+nansum(nansum(BAM4.*BA4conv200,3),2)-nansum(nansum(CM4.*C4conv200,3),2)+nansum(nansum(BEM4.*BE4conv200,3),2);
x = (1900:1:2099);
plot(x,nansum(nansum(FM4.*F4conv200,3),2),x,nansum(nansum(BEM4.*BE4conv200,3),2),x,nansum(nansum(BAM4.*BA4conv200,3),2),x,-nansum(nansum(CM4.*C4conv200,3),2),x,t,'linewidth',2)
legend('Fram','Bering','BSO','CAA','Total','location','northwest')
grid on
ylabel('TeraWatt')
title('Arctic heat transport budget, CCSM4')
print('BH4','-djpeg')







