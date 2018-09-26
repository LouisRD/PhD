%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ice Surface fluxes graph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load SurfIce.mat

[nt nlat nlong] = size(swa);
lwday = nanmean(nanmean(nanmean(reshape(lwda,[12 nt/12 nlat nlong]),4),3),1);
lwoay = nanmean(nanmean(nanmean(reshape(lwoa,[12 nt/12 nlat nlong]),4),3),1);
sway = nanmean(nanmean(nanmean(reshape(swa,[12 nt/12 nlat nlong]),4),3),1);
latay = nanmean(nanmean(nanmean(reshape(lata,[12 nt/12 nlat nlong]),4),3),1);
senay = nanmean(nanmean(nanmean(reshape(sena,[12 nt/12 nlat nlong]),4),3),1);
swAay = nanmean(nanmean(nanmean(reshape(swAa,[12 nt/12 nlat nlong]),4),3),1);

lwdby = nanmean(nanmean(nanmean(reshape(lwdb,[12 nt/12 nlat nlong]),4),3),1);
lwoby = nanmean(nanmean(nanmean(reshape(lwob,[12 nt/12 nlat nlong]),4),3),1);
swby = nanmean(nanmean(nanmean(reshape(swb,[12 nt/12 nlat nlong]),4),3),1);
latby = nanmean(nanmean(nanmean(reshape(latb,[12 nt/12 nlat nlong]),4),3),1);
senby = nanmean(nanmean(nanmean(reshape(senb,[12 nt/12 nlat nlong]),4),3),1);
swAby = nanmean(nanmean(nanmean(reshape(swAb,[12 nt/12 nlat nlong]),4),3),1);

lwdcy = nanmean(nanmean(nanmean(reshape(lwdc,[12 nt/12 nlat nlong]),4),3),1);
lwocy = nanmean(nanmean(nanmean(reshape(lwoc,[12 nt/12 nlat nlong]),4),3),1);
swcy = nanmean(nanmean(nanmean(reshape(swc,[12 nt/12 nlat nlong]),4),3),1);
latcy = nanmean(nanmean(nanmean(reshape(latc,[12 nt/12 nlat nlong]),4),3),1);
sency = nanmean(nanmean(nanmean(reshape(senc,[12 nt/12 nlat nlong]),4),3),1);
swAcy = nanmean(nanmean(nanmean(reshape(swAc,[12 nt/12 nlat nlong]),4),3),1);

lwdey = nanmean(nanmean(nanmean(reshape(lwde,[12 nt/12 nlat nlong]),4),3),1);
lwoey = nanmean(nanmean(nanmean(reshape(lwoe,[12 nt/12 nlat nlong]),4),3),1);
swey = nanmean(nanmean(nanmean(reshape(swe,[12 nt/12 nlat nlong]),4),3),1);
latey = nanmean(nanmean(nanmean(reshape(late,[12 nt/12 nlat nlong]),4),3),1);
seney = nanmean(nanmean(nanmean(reshape(sene,[12 nt/12 nlat nlong]),4),3),1);
swAey = nanmean(nanmean(nanmean(reshape(swAe,[12 nt/12 nlat nlong]),4),3),1);

lwdfy = nanmean(nanmean(nanmean(reshape(lwdf,[12 nt/12 nlat nlong]),4),3),1);
lwofy = nanmean(nanmean(nanmean(reshape(lwof,[12 nt/12 nlat nlong]),4),3),1);
swfy = nanmean(nanmean(nanmean(reshape(swf,[12 nt/12 nlat nlong]),4),3),1);
latfy = nanmean(nanmean(nanmean(reshape(latf,[12 nt/12 nlat nlong]),4),3),1);
senfy = nanmean(nanmean(nanmean(reshape(senf,[12 nt/12 nlat nlong]),4),3),1);
swAfy = nanmean(nanmean(nanmean(reshape(swAf,[12 nt/12 nlat nlong]),4),3),1);

lwdgy = nanmean(nanmean(nanmean(reshape(lwdg,[12 nt/12 nlat nlong]),4),3),1);
lwogy = nanmean(nanmean(nanmean(reshape(lwog,[12 nt/12 nlat nlong]),4),3),1);
swgy = nanmean(nanmean(nanmean(reshape(swg,[12 nt/12 nlat nlong]),4),3),1);
latgy = nanmean(nanmean(nanmean(reshape(latg,[12 nt/12 nlat nlong]),4),3),1);
sengy = nanmean(nanmean(nanmean(reshape(seng,[12 nt/12 nlat nlong]),4),3),1);
swAgy = nanmean(nanmean(nanmean(reshape(swAg,[12 nt/12 nlat nlong]),4),3),1);


lwdy = [lwday' lwdby' lwdcy' lwdey' lwdfy' lwdgy'];
lwoy = [lwoay' lwoby' lwocy' lwoey' lwofy' lwogy'];
swy = [sway' swby' swcy' swey' swfy' swgy'];
laty = [latay' latby' latcy' latey' latfy' latgy'];
seny = [senay' senby' sency' seney' senfy' sengy'];
swAy = [swAay' swAby' swAcy' swAey' swAfy' swAgy'];


t = {'a','b.ES01','c','e','f.ES01','g.ES01'};
ry = [2036 2027 2032 2032 2013 2044];
ryb = 2030;
Mx = 300;
Mn = -49;

x = (1900:2099);
for i=1:6
subplot(2,3,i)
plot(x,lwdy(:,i),x,-lwoy(:,i),x,swy(:,i),x,laty(:,i),x,seny(:,i),'LineWidth',2)
title(t(i))
grid on
hold on
area([ry(i) ry(i)+1], [Mx Mx],'FaceColor', 'k','Linestyle','none');
area([ry(i) ry(i)+1], [Mn Mn],'FaceColor', 'k','Linestyle','none');
end
subplot(2,3,1)
ylabel('W/m^2')
subplot(2,3,4)
ylabel('W/m^2')
subplot(2,3,2)
area([ryb ryb+1], [Mx Mx],'FaceColor', 'k','Linestyle','none');
area([ryb ryb+1], [Mn Mn],'FaceColor', 'k','Linestyle','none');

print('SurfIce','-djpeg')


tot = lwdy+lwoy+swAy+laty+seny;
plot(x,lwdy+lwoy+swAy+laty+seny)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



plot(x,lwday,x,lwoay,x,sway,x,swaay,x,latay,x,senay)
legend('LWd','LWo','SW','SWa','Lat','Sens')



plot(x,lwday+lwoay,x,sway,x,swaay,x,latay,x,senay)
legend('LW','SW','SWa','Lat','Sens')
grid on





plot(x,lwday,x,-lwoay,x,sway,x,swaay)
legend('LWd','LWo','SW','SWa')
grid on


