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



tmp = zeros(lat2CAA-lat1CAA+1,1);
for i = 2:lat2CAA-lat1CAA+1
	tmp(i) = sum(HTE(lat1CAA:lat1CAA+i-1))/100/1000;
end
HF = fliplr(tmp'); HF = HF-tmp(3);


Cu3 = (CbU+CcU+CeU+CfU+CgU)/5;
Cu4 = (C5U+C6U+C7U+C8U+C9U+C12U)/6;


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


index = find(CbU==0); tmpTb = CbT; tmpTb(index)= NaN;
indexOut = find(CbU>0); tmpTIn = tmpTb; tmpTIn(indexOut) = NaN; tmpTInb = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(CbU<0); tmpTOut = tmpTb; tmpTOut(indexIn) = NaN; tmpTOutb = nanmean(nanmean(tmpTOut,3),2);

index = find(CcU==0); tmpTc = CcT; tmpTc(index)= NaN;
indexOut = find(CcU>0); tmpTIn = tmpTc; tmpTIn(indexOut) = NaN; tmpTInc = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(CcU<0); tmpTOut = tmpTc; tmpTOut(indexIn) = NaN; tmpTOutc = nanmean(nanmean(tmpTOut,3),2);

index = find(CeU==0); tmpTe = CeT; tmpTe(index)= NaN;
indexOut = find(CeU>0); tmpTIn = tmpTe; tmpTIn(indexOut) = NaN; tmpTIne = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(CeU<0); tmpTOut = tmpTe; tmpTOut(indexIn) = NaN; tmpTOute = nanmean(nanmean(tmpTOut,3),2);

index = find(CfU==0); tmpTf = CfT; tmpTf(index)= NaN;
indexOut = find(CfU>0); tmpTIn = tmpTf; tmpTIn(indexOut) = NaN; tmpTInf = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(CfU<0); tmpTOut = tmpTf; tmpTOut(indexIn) = NaN; tmpTOutf = nanmean(nanmean(tmpTOut,3),2);

index = find(CgU==0); tmpTg = CgT; tmpTg(index)= NaN;
indexOut = find(CgU>0); tmpTIn = tmpTg; tmpTIn(indexOut) = NaN; tmpTIng = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(CgU<0); tmpTOut = tmpTg; tmpTOut(indexIn) = NaN; tmpTOutg = nanmean(nanmean(tmpTOut,3),2);

CT3 = (tmpTb+tmpTc+tmpTe+tmpTf+tmpTg)/5;
CT3In = (tmpTInb+tmpTInc+tmpTIne+tmpTInf+tmpTIng)/5;
CT3Out = (tmpTOutb+tmpTOutc+tmpTOute+tmpTOutf+tmpTOutg)/5;


index = find(C5U==0); tmpT5 = C5T; tmpT5(index)= NaN;
indexOut = find(C5U>0); tmpTIn = tmpT5; tmpTIn(indexOut) = NaN; tmpTIn5 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(C5U<0); tmpTOut = tmpT5; tmpTOut(indexIn) = NaN; tmpTOut5 = nanmean(nanmean(tmpTOut,3),2);

index = find(C6U==0); tmpT6 = C6T; tmpT6(index)= NaN;
indexOut = find(C6U>0); tmpTIn = tmpT6; tmpTIn(indexOut) = NaN; tmpTIn6 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(C6U<0); tmpTOut = tmpT6; tmpTOut(indexIn) = NaN; tmpTOut6 = nanmean(nanmean(tmpTOut,3),2);

index = find(C7U==0); tmpT7 = C7T; tmpT7(index)= NaN;
indexOut = find(C7U>0); tmpTIn = tmpT7; tmpTIn(indexOut) = NaN; tmpTIn7 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(C7U<0); tmpTOut = tmpT7; tmpTOut(indexIn) = NaN; tmpTOut7 = nanmean(nanmean(tmpTOut,3),2);

index = find(C8U==0); tmpT8 = C8T; tmpT8(index)= NaN;
indexOut = find(C8U>0); tmpTIn = tmpT8; tmpTIn(indexOut) = NaN; tmpTIn8 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(C8U<0); tmpTOut = tmpT8; tmpTOut(indexIn) = NaN; tmpTOut8 = nanmean(nanmean(tmpTOut,3),2);

index = find(C9U==0); tmpT9 = C9T; tmpT9(index)= NaN;
indexOut = find(C9U>0); tmpTIn = tmpT9; tmpTIn(indexOut) = NaN; tmpTIn9 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(C9U<0); tmpTOut = tmpT9; tmpTOut(indexIn) = NaN; tmpTOut9 = nanmean(nanmean(tmpTOut,3),2);

index = find(C12U==0); tmpT12 = C12T; tmpT12(index)= NaN;
indexOut = find(C12U>0); tmpTIn = tmpT12; tmpTIn(indexOut) = NaN; tmpTIn12 = nanmean(nanmean(tmpTIn,3),2);
indexIn = find(C12U<0); tmpTOut = tmpT12; tmpTOut(indexIn) = NaN; tmpTOut12 = nanmean(nanmean(tmpTOut,3),2);

CT4 = (tmpT5+tmpT6+tmpT7+tmpT8+tmpT9+tmpT12)/6;
CT4In = (tmpTIn5+tmpTIn6+tmpTIn7+tmpTIn8+tmpTIn9+tmpTIn12)/6;
CT4Out = (tmpTOut5+tmpTOut6+tmpTOut7+tmpTOut8+tmpTOut9+tmpTOut12)/6;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%


CM3 = (Cb+Cc+Ce+Cf+Cg)/5;
CM4 = (C5+C6+C7+C8+C9+C12)/6;

x = (1900:2099);


subplot(4,2,[1 2])

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
%legend('CCSM3','CCSM4','location','southwest')
ylabel('TW')
ylim([-2 13])
yticks((0:4:12))
title('Energy transport','FontWeight','Normal')

subplot(4,2,3)
plot(x,-nansum(nansum(CU3,3),2),'b',x,-nansum(nansum(CU4,3),2),'r','Linewidth',3)
hold on
plot(x,-nansum(nansum(tmpb,3),2),'b',x,-nansum(nansum(tmpc,3),2),'b',x,-nansum(nansum(tmpe,3),2),'b',x,-nansum(nansum(tmpf,3),2),'b',x,-nansum(nansum(tmpg,3),2),'b')
plot(x,-nansum(nansum(tmp5,3),2),'r',x,-nansum(nansum(tmp6,3),2),'r',x,-nansum(nansum(tmp7,3),2),'r',x,-nansum(nansum(tmp8,3),2),'r',x,-nansum(nansum(tmp9,3),2),'r',x,-nansum(nansum(tmp12,3),2),'r')
hold off
title('Volume transport','FontWeight','Normal')
xticks((1900:50:2100))
xticklabels({'','','','',''})
ylabel('Sv')
ylim([-2.2 0])
yticks((-2:1:0))
grid on

subplot(4,2,5)
plot(x,-CU3In,'b',x,-CU4In,'r','Linewidth',3)
%legend('CCSM3','CCSM4','location','northwest')
hold on
plot(x,-tmpInb,'b',x,-tmpInc,'b',x,-tmpIne,'b',x,-tmpInf,'b',x,-tmpIng,'b')
plot(x,-tmpIn5,'r',x,-tmpIn6,'r',x,-tmpIn7,'r',x,-tmpIn8,'r',x,-tmpIn9,'r',x,-tmpIn12,'r')
hold off
title('Inflow','FontWeight','Normal')
xticks((1900:50:2100))
xticklabels({'','','','',''})
%yticks((0:2:10))
%ylim([0 10])
ylabel('Sv')
ylim([0 0.15])
yticks((0:0.05:0.15))
grid on

subplot(4,2,7);
plot(x,CU3Out,'b',x,CU4Out,'r','Linewidth',3)
hold on
plot(x,tmpOutb,'b',x,tmpOutc,'b',x,tmpOute,'b',x,tmpOutf,'b',x,tmpOutg,'b')
plot(x,tmpOut5,'r',x,tmpOut6,'r',x,tmpOut7,'r',x,tmpOut8,'r',x,tmpOut9,'r',x,tmpOut12,'r')
hold off
title('Outflow','FontWeight','Normal')
xticks((1900:50:2100))
ylim([0 2.2])
yticks((0:2))
ylabel('Sv')
grid on



subplot(4,2,4)
plot(x,nanmean(nanmean(CT3,3),2),'b',x,nanmean(nanmean(CT4,3),2),'r','Linewidth',3)
hold on
plot(x,nanmean(nanmean(tmpTb,3),2),'b',x,nanmean(nanmean(tmpTc,3),2),'b',x,nanmean(nanmean(tmpTe,3),2),'b',x,nanmean(nanmean(tmpTf,3),2),'b',x,nanmean(nanmean(tmpTg,3),2),'b')
plot(x,nanmean(nanmean(tmpT5,3),2),'r',x,nanmean(nanmean(tmpT6,3),2),'r',x,nanmean(nanmean(tmpT7,3),2),'r',x,nanmean(nanmean(tmpT8,3),2),'r',x,nanmean(nanmean(tmpT9,3),2),'r',x,nanmean(nanmean(tmpT12,3),2),'r')
hold off
title('Temperature','FontWeight','Normal')
xticks((1900:50:2100))
xticklabels({'','','','',''})
ylabel('^\circ C')
ylim([-1.5 0.5])
yticks((-1.5:0.5:0.5))
yticklabels({'',-1,'',0,''})
grid on



subplot(4,2,6)
plot(x,CT3In,'b',x,CT4In,'r','Linewidth',3)
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
ylim([-2 0.3])
grid on


subplot(4,2,8);
plot(x,CT3Out,'b',x,CT4Out,'r','Linewidth',3)
hold on
plot(x,tmpTOutb,'b',x,tmpTOutc,'b',x,tmpTOute,'b',x,tmpTOutf,'b',x,tmpTOutg,'b')
plot(x,tmpTOut5,'r',x,tmpTOut6,'r',x,tmpTOut7,'r',x,tmpTOut8,'r',x,tmpTOut9,'r',x,tmpTOut12,'r')
hold off
title('Outflow','FontWeight','Normal')
xticks((1900:50:2100))
ylabel('^\circ C')
%yticks((-10:2:0))
ylim([-1.5 0.5])
grid on

% print('caaM','-djpeg')




