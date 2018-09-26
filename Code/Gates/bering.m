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

tmp = zeros(long2bering-long1bering+1,1);
for i = 2:long2bering-long1bering+1
	tmp(i) = sum(HTN(long1bering:long1bering+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(2);

BEM3 = (BEb+BEc+BEe+BEf+BEg)/5;
BEM4 = (BE5+BE6+BE7+BE8+BE9+BE12)/6;
BEV3 = (BEbV+BEeV+BEfV+BEgV).*sA3/4;
BEV4 = (BE5V+BE6V+BE7V+BE8V+BE9V+BE12V).*sA4/6;
BET3 = (BEbT+BEcT+BEeT+BEfT+BEgT)/5;
BET4 = (BE5T+BE6T+BE7T+BE8T+BE9+BE12T)/6;

x = (1900:2099);


subplot(3,1,1)

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
yticks((0:5:20))
yticklabels({0,'',10,'',20})
title('Energy transport','FontWeight','Normal')
ylabel('TW')


subplot(3,1,2)
plot(x,nansum(nansum(BEV3,3),2),'b',x,nansum(nansum(BEV4,3),2),'r','Linewidth',3)
hold on
plot(x,nansum(nansum(BEbV.*sA3,3),2),'b',x,nansum(nansum(BEeV.*sA3,3),2),'b',x,nansum(nansum(BEfV.*sA3,3),2),'b',x,nansum(nansum(BEgV.*sA3,3),2),'b')

plot(x,nansum(nansum(BE5V.*sA4,3),2),'r',x,nansum(nansum(BE6V.*sA4,3),2),'r',x,nansum(nansum(BE7V.*sA4,3),2),'r',x,nansum(nansum(BE8V.*sA4,3),2),'r',x,nansum(nansum(BE9V.*sA4,3),2),'r',x,nansum(nansum(BE12V.*sA4,3),2),'r')
hold off
title('Volume transport','FontWeight','Normal')
ylabel('Sv')
yticks((0:0.5:2))
yticklabels({0,'',1,'',2})
grid on
%yticks((0:25:150))




subplot(3,1,3)
plot(x,nanmean(nanmean(BET3,3),2),'b',x,nanmean(nanmean(BET4,3),2),'r','Linewidth',3)
hold on
plot(x,nanmean(nanmean(BEbT,3),2),'b',x,nanmean(nanmean(BEcT,3),2),'b',x,nanmean(nanmean(BEeT,3),2),'b',x,nanmean(nanmean(BEfT,3),2),'b',x,nanmean(nanmean(BEgT,3),2),'b')
plot(x,nanmean(nanmean(BE5T,3),2),'r',x,nanmean(nanmean(BE6T,3),2),'r',x,nanmean(nanmean(BE7T,3),2),'r',x,nanmean(nanmean(BE8T,3),2),'r',x,nanmean(nanmean(BE9T,3),2),'r',x,nanmean(nanmean(BE12T,3),2),'r')
hold off
xticks((1900:50:2100))
title('Temperature','FontWeight','Normal')
ylabel('^\circ C')
ylim([-2 5])
yticks((-2:1:5))
yticklabels({-2,'',0,'',2,'',4,''})
grid on


% print('BeringM2','-djpeg')



