
clear 
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

lat1fram = 370;
lat2fram = 384;
longfram = 100;

lat1barents = 334;
lat2barents = 369;
longbarents = 100;

latbering = 333;
long1bering = 198;
long2bering = 203;

lat1CAA = 333;
lat2CAA = 384;
longCAA = 230;

ncload b30.040g.ES01.pop.h.2079-08.nc TEMP TLAT TLONG HTE HTN z_w
z3 = z_w/100; 
T3 = TEMP;
ncload b40.20th.track1.1deg.006.pop.h.2005-08.nc TEMP z_w
T4 = TEMP;
z4 = z_w/100; 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	Fram
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x3 = [3 3 4 4 5 5 6 6 8 8 9 9 10 10 11 11 12 12 13 13]-1;
y3 = [0 12 12 17 17 20 20 28 28 21 21 16 16 12 12 9 9 4 4 0];

subplot(1,2,1)
pcolor(squeeze(T3(:,lat1fram:lat2fram,longfram)))
hold on
plot(x3,y3+1,'k','linewidth',3)
hold off
subplot(1,2,2)
pcolor(HF,-z3,squeeze(T3(:,lat1fram:lat2fram,longfram))); shading interp
hold on
plot(HF(x3),-z3(y3+1))
hold off
ylim([-500 0])

x4 = [2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 12 12];
y4 = [2 11 11 30 30 37 37 43 43 48 48 43 43 29 29 16 16 15 15 2]-2;

subplot(1,2,1)
pcolor(squeeze(T4(:,lat1fram:lat2fram,longfram)))
hold on
plot(x4,y4+1,'k','linewidth',3)
hold off
subplot(1,2,2)
pcolor(HF,-z4,squeeze(T4(:,lat1fram:lat2fram,longfram))); shading interp
hold on
plot(HF(x4),-z4(y4+1))
hold off
ylim([-2600 0])

tmp = zeros(lat2fram-lat1fram+1,1);
for i = 2:lat2fram-lat1fram+1
	tmp(i) = sum(HTE(lat1fram:lat1fram+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(4);

trapz(HF(x3),-z3(y3+1))/1000
trapz(HF(x4),-z4(y4+1))/1000

plot(HF(x3),-z3(y3+1),HF(x4),-z4(y4+1),'linewidth',2)
grid on
xlabel('Width (km)')
ylabel('Depth (m)')
xlim([-50 500])
ylim([-3300 0])
title('Fram Strait')
legend('CCSM3','CCSM4','location','southeast')
text(50,-350,'Yerkman Plateau','horizontalalignment','center')
text(50,-230,'\uparrow','horizontalalignment','center')
% print('Fram','-djpeg')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	Barents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tmp = zeros(lat2barents-lat1barents+1,1);
for i = 2:lat2barents-lat1barents+1
	tmp(i) = sum(HTE(lat1barents:lat1barents+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(3);

x3 = [11 11 12 12 15 15 16 16 19 19 20 20 21 21 22 22 23 23 26 26 27 27 28 28 31 31 32 32 33 33 34 34];
y3 = [2 4 4 2 2 11 11 2 2 9 9 12 12 14 14 15 15 16 16 15 15 14 14 13 13 14 14 13 13 11 11 2]-2;
subplot(1,2,1)
pcolor(squeeze(T3(:,lat1barents:lat2barents,longbarents)))
hold on
plot(x3,y3+1,'k','linewidth',3)
hold off
subplot(1,2,2)
pcolor(HF,-z3,squeeze(T3(:,lat1barents:lat2barents,longbarents))); shading interp
hold on
plot(HF(x3),-z3(y3+1))
hold off
ylim([-250 0])


x4 = [11 11 13 13 14 14 15 15 16 16 19 19 20 20 22 22 23 23 24 24 25 25 26 26 27 27 28 28 29 29 31 31 32 32 34 34];
y4 = [2 4 4 5 5 7 7 9 9 2 2 7 7 18 18 20 20 24 24 25 25 24 24 22 22 21 21 20 20 18 18 20 20 10 10 2]-2;
subplot(1,2,1)
pcolor(squeeze(T4(:,lat1barents:lat2barents,longbarents)))
hold on
plot(x4,y4+1,'k','linewidth',3)
hold off
subplot(1,2,2)
pcolor(HF,-z4,squeeze(T4(:,lat1barents:lat2barents,longbarents))); shading interp
hold on
plot(HF(x4),-z4(y4+1))
hold off
ylim([-250 0])



trapz(HF(x3),-z3(y3+1))/1000
trapz(HF(x4),-z4(y4+1))/1000

plot(HF(x3),-z3(y3+1),HF(x4),-z4(y4+1),'linewidth',2)
grid on
xlabel('Width (km)')
ylabel('Depth (m)')
xlim([-50 1100])
ylim([-300 0])
title('Barents Sea Opening')
legend('CCSM3','CCSM4','location','southeast')
text(610,-120,'Novaya Zemlya','horizontalalignment','left')
text(700,-105,'\uparrow')
% print('Barents','-djpeg')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	CAA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tmp = zeros(lat2CAA-lat1CAA+1,1);
for i = 2:lat2CAA-lat1CAA+1
	tmp(i) = sum(HTE(lat1CAA:lat1CAA+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(7);

x3 = [17 17 18 18 19 19 19 19 26 26 26 26 27 27 28 28 32 32 36 36 45 45 46 46 46 46];
y3 = [2 13 13 16 16 16 16 2 2 16 16 16 16 12 12 2 2 15 15 2 2 10 10 10 10 2]-2;
subplot(1,2,1)
pcolor(squeeze(T3(:,lat1CAA:lat2CAA,longCAA)))
hold on
plot(x3,y3+1,'k','linewidth',3)
hold off
ylim([1 20])
subplot(1,2,2)
pcolor(HF,-z3,squeeze(T3(:,lat1CAA:lat2CAA,longCAA))); shading interp
hold on
plot(HF(x3),-z3(y3+1))
hold off
ylim([-250 0])

x4 = [17 17 18 18 19 19 26 26 27 27 32 32 34 34 35 35 36 36 45 45 46 46];
y4 = [2 7 7 27 27 2 2 30 30 2 2 18 18 23 23 22 22 2 2 12 12 2]-2;
pcolor(squeeze(T4(:,lat1CAA:lat2CAA,longCAA)))
hold on
plot(x4,y4+1,'k','linewidth',3)
hold off
ylim([1 20])
subplot(1,2,2)
pcolor(HF,-z4,squeeze(T4(:,lat1CAA:lat2CAA,longCAA))); shading interp
hold on
plot(HF(x4),-z4(y4+1))
hold off
ylim([-360 0])


trapz(HF(x3),-z3(y3+1))/1000
trapz(HF(x4),-z4(y4+1))/1000

plot(HF(x3),-z3(y3+1),HF(x4),-z4(y4+1),'linewidth',2)
grid on
xlabel('Width (km)')
ylabel('Depth (m)')
xlim([-50 1300])
ylim([-350 0])
title('Canadian Arctic Archipelago')
legend('CCSM3','CCSM4','location','southwest')
% print('CAA','-djpeg')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	Bering
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tmp = zeros(long2bering-long1bering+1,1);
for i = 2:long2bering-long1bering+1
	tmp(i) = sum(HTN(long1bering:long1bering+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(3);

x3 = [2 2 3 3 4 4];
y3 = [2 6 6 4 4 2]-2;
subplot(1,2,1)
pcolor(squeeze(T3(:,latbering,long1bering:long2bering)))
hold on
plot(x3,y3+1,'k','linewidth',3)
hold off
ylim([1 20])
subplot(1,2,2)
pcolor(HF,-z3,squeeze(T3(:,latbering,long1bering:long2bering))); shading interp
hold on
plot(HF(x3),-z3(y3+1))
hold off
ylim([-60 0])

x4 = [3 3 4 4];
y4 = [2 5 5 2]-2;
subplot(1,2,1)
pcolor(squeeze(T4(:,latbering,long1bering:long2bering)))
hold on
plot(x4,y4+1,'k','linewidth',3)
hold off
ylim([1 20])
subplot(1,2,2)
pcolor(HF,-z4,squeeze(T4(:,latbering,long1bering:long2bering))); shading interp
hold on
plot(HF(x4),-z4(y4+1))
hold off
ylim([-60 0])


trapz(HF(x3),-z3(y3+1))/1000
trapz(HF(x4),-z4(y4+1))/1000

plot(HF(x3),-z3(y3+1),HF(x4),-z4(y4+1),'linewidth',2)
grid on
xlabel('Width (km)')
ylabel('Depth (m)')
xlim([-25 275])
ylim([-45 0])
title('Bering Strait')
legend('CCSM3','CCSM4','location','southwest')
% print('bering','-djpeg')





