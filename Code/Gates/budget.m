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


FM3 = (Fb+Fc+Fe+Ff+Fg)/5;
FM4 = (F5+F6+F7+F8+F9+F12)/6;
BAM3 = (BAb+BAc+BAe+BAf+BAg)/5;
BAM4 = (BA5+BA6+BA7+BA8+BA9+BA12)/6;
CM3 = (Cb+Cc+Ce+Cf+Cg)/5;
CM4 = (C5+C6+C7+C8+C9+C12)/6;
BEM3 = (BEb+BEc+BEe+BEf+BEg)/5;
BEM4 = (BE5+BE6+BE7+BE8+BE9+BE12)/6;

addpath /glade/u/home/renaud/scripts
ncload b30.030b.ES01.pop.h.1931-07.nc HTE HTN z_w dz
z3 = z_w/100; 
[nt nz n] = size(FbU);
tmpHTE = repmat(squeeze(HTE(lat1fram:lat2fram,longfram)),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:30),[1 nt n]);
tmpz = permute(tmpz,[2 1 3]);
sA3 = tmpHTE.*tmpz/100^2/10^8;
ncload b40.20th.track1.1deg.012.pop.h.1983-09.nc z_w dz
z4 = z_w/100; 
[nt nz n] = size(F12U);
[nt nz n] = size(F12U);
tmpHTE = repmat(squeeze(HTE(lat1fram:lat2fram,longfram)),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:50),[1 nt n]); 
tmpz = permute(tmpz,[2 1 3]);
sA4 = tmpHTE.*tmpz/100^2/10^8;

FU3 = (FbU+FcU+FeU+FfU+FgU).*sA3/5;
FU4 = (F5U+F6U+F7U+F8U+F9U+F12U).*sA4/6;



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



BAU3 = (BAbU+BAcU+BAeU+BAfU+BAgU).*sA3/5;
BAU4 = (BA5U+BA6U+BA7U+BA8U+BA9U+BA12U).*sA4/6;


lat1CAA = 333;
lat2CAA = 384;
longCAA = 230;

addpath /glade/u/home/renaud/scripts
ncload b30.030b.ES01.pop.h.1931-07.nc HTE HTN z_w dz
z3 = z_w/100; 
[nt nz n] = size(CbU);
tmpHTE = repmat(squeeze(HTE(lat1CAA:lat2CAA,longCAA)),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:16),[1 nt n]);
tmpz = permute(tmpz,[2 1 3]);
sA3 = tmpHTE.*tmpz/100^2/10^6/100;
ncload b40.20th.track1.1deg.012.pop.h.1983-09.nc z_w dz
z4 = z_w/100; 
[nt nz n] = size(C12U);
tmpHTE = repmat(squeeze(HTE(lat1CAA:lat2CAA,longCAA)),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:30),[1 nt n]); 
tmpz = permute(tmpz,[2 1 3]);
sA4 = tmpHTE.*tmpz/100^2/10^6/100;


CU3 = (CbU+CcU+CeU+CfU+CgU).*sA3/5;
CU4 = (C5U+C6U+C7U+C8U+C9U+C12U).*sA4/6;


latbering = 333;
long1bering = 198;
long2bering = 202;
ncload b30.030b.ES01.pop.h.1931-07.nc HTE HTN z_w dz
[nt nz n] = size(BEbV);
tmpHTE = repmat(squeeze(HTN(latbering,long1bering:long2bering)'),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:6),[1 nt n]);
tmpz = permute(tmpz,[2 1 3]);
sA3 = tmpHTE.*tmpz/100^2/10^6/100; % /100^2 = cm^2->m-2, /10^6 = -> Sverdrup

ncload b40.20th.track1.1deg.012.pop.h.1983-09.nc z_w dz
[nt nz n] = size(BE12V);
tmpHTE = repmat(squeeze(HTN(latbering,long1bering:long2bering)'),[1 nt nz]);
tmpHTE = permute(tmpHTE,[2 3 1]);
tmpz = repmat(dz(1:6),[1 nt n]); 
tmpz = permute(tmpz,[2 1 3]);
sA4 = tmpHTE.*tmpz/100^2/10^6/100;

BEV3 = (BEbV+BEcV+BEeV+BEfV+BEgV).*sA3/5;
BEV4 = (BE5V+BE6V+BE7V+BE8V+BE9V+BE12V).*sA4/6;


subplot(2,1,1)
t = nansum(nansum(FM3.*F3conv200,3),2)+nansum(nansum(BAM3.*BA3conv200,3),2)-nansum(nansum(CM3.*C3conv200,3),2)+nansum(nansum(BEM3.*BE3conv200,3),2);
x = (1900:1:2099);
plot(x,nansum(nansum(FM3.*F3conv200,3),2),x,nansum(nansum(BEM3.*BE3conv200,3),2),x,nansum(nansum(BAM3.*BA3conv200,3),2),x,-nansum(nansum(CM3.*C3conv200,3),2),x,t,'linewidth',2)
legend('Fram','Bering','BSO','CAA','Total','location','northwest')
grid on
ylabel('TW')
title('CCSM3 heat transports','FontWeight','Normal')
ylim([-30 160])



subplot(2,1,2)
t = nansum(nansum(FM4.*F4conv200,3),2)+nansum(nansum(BAM4.*BA4conv200,3),2)-nansum(nansum(CM4.*C4conv200,3),2)+nansum(nansum(BEM4.*BE4conv200,3),2);
x = (1900:1:2099);
plot(x,nansum(nansum(FM4.*F4conv200,3),2),x,nansum(nansum(BEM4.*BE4conv200,3),2),x,nansum(nansum(BAM4.*BA4conv200,3),2),x,-nansum(nansum(CM4.*C4conv200,3),2),x,t,'linewidth',2)
grid on
ylabel('TW')
title('CCSM4 heat transports','FontWeight','Normal')
ylim([-5 70])

print('gateht','-djpeg')





subplot(2,1,1)
t = nansum(nansum(FU3,2),3)+nansum(nansum(BAU3,2),3)-nansum(nansum(CU3,2),3)+nansum(nansum(BEV3,2),3);
x = (1900:1:2099);
plot(x,nansum(nansum(FU3,3),2),x,nansum(nansum(BEV3,3),2),x,nansum(nansum(BAU3,3),2),x,-nansum(nansum(CU3,3),2),x,t,'linewidth',2)
legend('Fram','Bering','BSO','CAA','Total','location','northwest')
grid on
ylabel('Sv')
title('CCSM3 Volume Transports ','FontWeight','Normal')
ylim([-7 6])

subplot(2,1,2)
t = nansum(nansum(FU4,2),3)+nansum(nansum(BAU4,2),3)-nansum(nansum(CU4,2),3)+nansum(nansum(BEV4,2),3);
x = (1900:1:2099);
plot(x,nansum(nansum(FU4,3),2),x,nansum(nansum(BEV4,3),2),x,nansum(nansum(BAU4,3),2),x,-nansum(nansum(CU4,3),2),x,t,'linewidth',2)
grid on
ylabel('Sv')
title('CCSM4 Volume Transports ','FontWeight','Normal')
ylim([-3 4])


print('gatevol','-djpeg')

