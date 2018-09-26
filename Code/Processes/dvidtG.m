clear
load dvidt.mat

Da = [YdadtDa' YdadtDb' YdadtDc' YdadtDe' YdadtDf' YdadtDg']/10^14;
Ta = [YdadtTa' YdadtTb' YdadtTc' YdadtTe' YdadtTf' YdadtTg']/10^14;
Dv = [YdvdtDa' YdvdtDb' YdvdtDc' YdvdtDe' YdvdtDf' YdvdtDg']/10^14;
Tv = [YdvdtTa' YdvdtTb' YdvdtTc' YdvdtTe' YdvdtTf' YdvdtTg']/10^14;

a = zeros(6,2);
for i=1:6
a(i,:) = polyfit(x(100:end),Ta(100:end,i)',1);
end
mean(a(:,1))
mean(Ta(end,:))
mean(mean(Ta(1:100,:)))

mean(mean(Tv(1:10,:)))
mean(mean(Tv(end-10:end,:)))





DaR = [YdadtDaR' YdadtDbR' YdadtDcR' YdadtDeR' YdadtDfR' YdadtDgR']/10^14;
TaR = [YdadtTaR' YdadtTbR' YdadtTcR' YdadtTeR' YdadtTfR' YdadtTgR']/10^14;
DvR = [YdvdtDaR' YdvdtDbR' YdvdtDcR' YdvdtDeR' YdvdtDfR' YdvdtDgR']/10^14;
TvR = [YdvdtTaR' YdvdtTbR' YdvdtTcR' YdvdtTeR' YdvdtTfR' YdvdtTgR']/10^14;



t = {'a','b.ES01','c', 'e', 'f.ES01', 'g.ES01'};
rapidb = [131 122 127 127 130 129];
rapida  = [141 125 137 148 150 149];
rapid = [136 130 132 143 145 144];

for i=1:6
	t(i)
	mean(DaR(rapidb(i):rapida(i),i))
	mean(TaR(rapidb(i):rapida(i),i))
	DaR(rapid(i),i)
	TaR(rapid(i),i)
end


for i=1:6
	t(i)
	mean(DvR(rapidb(i):rapida(i),i))
	mean(TvR(rapidb(i):rapida(i),i))
	DvR(rapid(i),i)
	TvR(rapid(i),i)
end



x = (1900:2099);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = (1900:2099);
t = {'a','b.ES01','c', 'e', 'f.ES01', 'g.ES01'};
ry = [2036 2027 2032 2032 2013 2044];
ryb = 2030;
Mx = 12;
Mn= -12;


for i=1:6
	subplot(2,3,i)
	plot(x,Ta(:,i),'r',x,Da(:,i),'b',x,Ta(:,i)+Da(:,i),'k')
	title(t(i))
	grid on
	xticks([1900 1950 2000 2050 2100])
	xticklabels({'1900','','2000','','2100'})
	ylim([-12 12])
	hold on
	area([ry(i) ry(i)+1], [Mx Mx],'FaceColor', 'k','Linestyle','none');
	area([ry(i) ry(i)+1], [Mn Mn],'FaceColor', 'k','Linestyle','none');
end
subplot(2,3,1)
ylabel('10^6 km^2/year')
subplot(2,3,4)
ylabel('10^6 km^2/year')
subplot(2,3,2)
area([ryb ryb+1], [Mx Mx],'FaceColor', 'k','Linestyle','none');
area([ryb ryb+1], [Mn Mn],'FaceColor', 'k','Linestyle','none');

%print('dadt','-djpeg')

Mx = 7;
Mna= -7;
for i=1:6
	subplot(2,3,i)
	plot(x,Tv(:,i),'r',x,Dv(:,i),'b',x,Tv(:,i)+Dv(:,i),'k')
	title(t(i))
	grid on
	xticks([1900 1950 2000 2050 2100])
	xticklabels({'1900','','2000','','2100'})
	ylim([-7 7])
	hold on
	area([ry(i) ry(i)+1], [Mx Mx],'FaceColor', 'k','Linestyle','none');
	area([ry(i) ry(i)+1], [Mn Mn],'FaceColor', 'k','Linestyle','none');
end
subplot(2,3,1)
ylabel('1000 km^3/year')
subplot(2,3,4)
ylabel('1000 km^3/year')
subplot(2,3,2)
area([ryb ryb+1], [Mx Mx],'FaceColor', 'k','Linestyle','none');
area([ryb ryb+1], [Mn Mn],'FaceColor', 'k','Linestyle','none');

%print('dvdt','-djpeg')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:6
	subplot(2,3,i)
	plot(x,Ta(:,i),'r',x,Da(:,i),'b',x,Ta(:,i)+Da(:,i),'k',x,TaR(:,i),':r',x,DaR(:,i),':b',x,TaR(:,i)+DaR(:,i),':k')
	title(t(i))
	grid on
	xticks([1900 1950 2000 2050 2100])
	xticklabels({'1900','','2000','','2100'})
	ylim([-12 12])
	hold on
	area([ry(i) ry(i)+1], [Mx Mx],'FaceColor', 'k','Linestyle','none');
	area([ry(i) ry(i)+1], [Mn Mn],'FaceColor', 'k','Linestyle','none');
end
subplot(2,3,1)
ylabel('10^6 km^2/year')
subplot(2,3,4)
ylabel('10^6 km^2/year')




for i=1:6
	subplot(2,3,i)
	plot(x,Ta(:,i),'r',x,Da(:,i),'b',x,Ta(:,i)+Da(:,i),'k')
	title(t(i))
	grid on
	xticks([1900 1950 2000 2050 2100])
	xticklabels({'1900','','2000','','2100'})
	ylim([-12 12])
	hold on
	area([ry(i) ry(i)+1], [Mx Mx],'FaceColor', 'k','Linestyle','none');
	area([ry(i) ry(i)+1], [Mn Mn],'FaceColor', 'k','Linestyle','none');
end
subplot(2,3,1)
ylabel('10^6 km^2/year')
subplot(2,3,4)
ylabel('10^6 km^2/year')
%print('dadt','-djpeg')


for i=1:6
	subplot(2,3,i)
	plot(x,TaR(:,i),'r',x,DaR(:,i),'b',x,TaR(:,i)+DaR(:,i),'k')
	title(t(i))
	grid on
	ylim([-4 4])
	xlim([x(rapidb(i)) x(rapida(i))])
end
subplot(2,3,1)
ylabel('10^6 km^2/year')
subplot(2,3,4)
ylabel('10^6 km^2/year')

for i=1:6
	subplot(2,3,i)
	plot(x,TvR(:,i),'r',x,DvR(:,i),'b',x,TvR(:,i)+DvR(:,i),'k')
	title(t(i))
	grid on
	ylim([-4 4])
	xlim([x(rapidb(i)) x(rapida(i))])
end
subplot(2,3,1)
ylabel('1000 km^3/year')
subplot(2,3,4)
ylabel('1000 km^3/year')


for i=1:6
	subplot(2,3,i)
	plot(x,Tv(:,i),'r',x,Dv(:,i),'b',x,Tv(:,i)+Dv(:,i),'k',x,TvR(:,i),':r',x,DvR(:,i),':b',x,TvR(:,i)+DvR(:,i),':k')
	title(t(i))
	grid on
	xticks([1900 1950 2000 2050 2100])
	xticklabels({'1900','','2000','','2100'})
	ylim([-7 7])
end
subplot(2,3,1)
ylabel('1000 km^3/year')
subplot(2,3,4)
ylabel('1000 km^3/year')

for i=1:6
	subplot(2,3,i)
	plot(x,Tv(:,i),'r',x,Dv(:,i),'b',x,Tv(:,i)+Dv(:,i),'k')
	title(t(i))
	grid on
	xticks([1900 1950 2000 2050 2100])
	xticklabels({'1900','','2000','','2100'})
	ylim([-7 7])
end
subplot(2,3,1)
ylabel('1000 km^3/year')
subplot(2,3,4)
ylabel('1000 km^3/year')
%print('dvdt','-djpeg')

for i=1:6
	subplot(2,3,i)
	plot(x,TvR(:,i),'r',x,DvR(:,i),'b',x,TvR(:,i)+DvR(:,i),'k')
	title(t(i))
	grid on
	xticks([1900 1950 2000 2050 2100])
	xticklabels({'1900','','2000','','2100'})
	ylim([-3 3])
end
subplot(2,3,1)
ylabel('1000 km^3/year')
subplot(2,3,4)
ylabel('1000 km^3/year')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






x = (1900:2099);

subplot(2,2,1) % % m^2 -> million km^2
plot(x,YdadtTa/10^14,'r',x,YdadtTb/10^14,'r',x,YdadtTc/10^14,'r',x,YdadtTe/10^14,'r',x,YdadtTf/10^14,'r',x,YdadtTg/10^14,'r',x,YdadtDa/10^14,'b',x,YdadtDb/10^14,'b',x,YdadtDc/10^14,'b',x,YdadtDe/10^14,'b',x,YdadtDf/10^14,'b',x,YdadtDg/10^14,'b',x,YdadtDa/10^14+YdadtTa/10^14,'k',x,YdadtDb/10^14+YdadtTb/10^14,'k',x,YdadtDc/10^14+YdadtTc/10^14,'k',x,YdadtDe/10^14+YdadtTe/10^14,'k',x,YdadtDf/10^14+YdadtTf/10^14,'k',x,YdadtDg/10^14+YdadtTg/10^14,'k')
hold on
plot(x,mean(Ta'),'r',x,mean(Da'),'b',x,mean(Ta'+Da'),'k','LineWidth',2)
ylabel('10^6 km^2/year')
title('Arctic Ocean')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


subplot(1,2,1)
plot(x,YdvdtTa/10^14,'r',x,YdvdtTb/10^14,'r',x,YdvdtTc/10^14,'r',x,YdvdtTe/10^14,'r',x,YdvdtTf/10^14,'r',x,YdvdtTg/10^14,'r',x,YdvdtDa/10^14,'b',x,YdvdtDb/10^14,'b',x,YdvdtDc/10^14,'b',x,YdvdtDe/10^14,'b',x,YdvdtDf/10^14,'b',x,YdvdtDg/10^14,'b',x,YdvdtDa/10^14+YdvdtTa/10^14,'k',x,YdvdtDb/10^14+YdvdtTb/10^14,'k',x,YdvdtDc/10^14+YdvdtTc/10^14,'k',x,YdvdtDe/10^14+YdvdtTe/10^14,'k',x,YdvdtDf/10^14+YdvdtTf/10^14,'k',x,YdvdtDg/10^14+YdvdtTg/10^14,'k')

subplot(1,2,2)
plot(x,mean(Tv'),'r',x,mean(Dv'),'b',x,mean(Tv'+Dv'),'k','LineWidth',2)
hold on
plot(x,max(Tv'),'r',x,max(Dv'),'b',x,max(Tv'+Dv'),'k')
plot(x,min(Tv'),'r',x,min(Dv'),'b',x,min(Tv'+Dv'),'k')


plot(x,mean(Ta'),'r',x,mean(Da'),'b',x,mean(Ta'+Da'),'k','LineWidth',2)
hold on
plot(x,max(Ta'),'r',x,max(Da'),'b',x,max(Ta'+Da'),'k')
plot(x,min(Ta'),'r',x,min(Da'),'b',x,min(Ta'+Da'),'k')





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,2)
plot(x,YdadtTaR/10^14,'r',x,YdadtTbR/10^14,'r',x,YdadtTcR/10^14,'r',x,YdadtTeR/10^14,'r',x,YdadtTfR/10^14,'r',x,YdadtTgR/10^14,'r',x,YdadtDaR/10^14,'b',x,YdadtDbR/10^14,'b',x,YdadtDcR/10^14,'b',x,YdadtDeR/10^14,'b',x,YdadtDfR/10^14,'b',x,YdadtDgR/10^14,'b',x,YdadtDaR/10^14+YdadtTaR/10^14,'k',x,YdadtDbR/10^14+YdadtTbR/10^14,'k',x,YdadtDcR/10^14+YdadtTcR/10^14,'k',x,YdadtDeR/10^14+YdadtTeR/10^14,'k',x,YdadtDfR/10^14+YdadtTfR/10^14,'k',x,YdadtDgR/10^14+YdadtTgR/10^14,'k')
title('Rapid loss region')


subplot(2,2,3) % m^3 -> 1000 km^3
plot(x,YdvdtTa/10^14,'r',x,YdvdtTb/10^14,'r',x,YdvdtTc/10^14,'r',x,YdvdtTe/10^14,'r',x,YdvdtTf/10^14,'r',x,YdvdtTg/10^14,'r',x,YdvdtDa/10^14,'b',x,YdvdtDb/10^14,'b',x,YdvdtDc/10^14,'b',x,YdvdtDe/10^14,'b',x,YdvdtDf/10^14,'b',x,YdvdtDg/10^14,'b',x,YdvdtDa/10^14+YdvdtTa/10^14,'k',x,YdvdtDb/10^14+YdvdtTb/10^14,'k',x,YdvdtDc/10^14+YdvdtTc/10^14,'k',x,YdvdtDe/10^14+YdvdtTe/10^14,'k',x,YdvdtDf/10^14+YdvdtTf/10^14,'k',x,YdvdtDg/10^14+YdvdtTg/10^14,'k')
ylabel('1000 km^3/year')


subplot(2,2,4)
plot(x,YdvdtTaR/10^14,'r',x,YdvdtTbR/10^14,'r',x,YdvdtTcR/10^14,'r',x,YdvdtTeR/10^14,'r',x,YdvdtTfR/10^14,'r',x,YdvdtTgR/10^14,'r',x,YdvdtDaR/10^14,'b',x,YdvdtDbR/10^14,'b',x,YdvdtDcR/10^14,'b',x,YdvdtDeR/10^14,'b',x,YdvdtDfR/10^14,'b',x,YdvdtDgR/10^14,'b',x,YdvdtDaR/10^14+YdvdtTaR/10^14,'k',x,YdvdtDbR/10^14+YdvdtTbR/10^14,'k',x,YdvdtDcR/10^14+YdvdtTcR/10^14,'k',x,YdvdtDeR/10^14+YdvdtTeR/10^14,'k',x,YdvdtDfR/10^14+YdvdtTfR/10^14,'k',x,YdvdtDgR/10^14+YdvdtTgR/10^14,'k')








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = {'a','b.ES01','c', 'e', 'f.ES01', 'g.ES01'};

for i=1:6
	subplot(2,3,i)
	plot(x,Ta(:,i),'r',x,Da(:,i),'b',x,Ta(:,i)+Da(:,i),'k')
	title(t(i))
end







plot(x,YdadtTa/10^14,'r',x,YdadtTb/10^14,'r',x,YdadtTc/10^14,'r',x,YdadtTe/10^14,'r',x,YdadtTf/10^14,'r',x,YdadtTg/10^14,'r',x,YdadtDa/10^14,'b',x,YdadtDb/10^14,'b',x,YdadtDc/10^14,'b',x,YdadtDe/10^14,'b',x,YdadtDf/10^14,'b',x,YdadtDg/10^14,'b',x,YdadtDa/10^14+YdadtTa/10^14,'k',x,YdadtDb/10^14+YdadtTb/10^14,'k',x,YdadtDc/10^14+YdadtTc/10^14,'k',x,YdadtDe/10^14+YdadtTe/10^14,'k',x,YdadtDf/10^14+YdadtTf/10^14,'k',x,YdadtDg/10^14+YdadtTg/10^14,'k')






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plot(x,yda/100,'b',x,ydb/100,'r',x,ydc/100,'y',x,yde/100,'g',x,ydf/100,'c',x,ydg/100,'k', x,yta/100,'b',x,yda/100+yta/100,'b',x,ytb/100,'r',x,ydb/100+ytb/100,'r',x,ytc/100,'y',x,ydc/100+ytc/100,'y',x,yte/100,'g',x,yde/100+yte/100,'g',x,ytf/100,'c',x,ydf/100+ytf/100,'c',x,ytg/100,'k',x,ydg/100+ytg/100,'k')
grid on
ylabel('m^3/year')
title('Yearly-average of the termodynamic and dynamic tendency of the SIV')
%legend('a','b','c','e','f','g','Location','EastOutside')
text(1930,7*10^12,'Thermodynamics')
%text(1910,0.1*10,'Yearly tendency SIA')
text(1930,-7*10^12,'Dynamics')
% print('TvsD_aiceVol','-djpeg')


x = (1900:2099);
plot(x,yda/10^14,'b',x,ydb/10^14,'r',x,ydc/10^14,'y',x,yde/10^14,'g',x,ydf/10^14,'c',x,ydg/10^14,'k', x,yta/10^14,'b',x,yda/10^14+yta/10^14,'b',x,ytb/10^14,'r',x,ydb/10^14+ytb/10^14,'r',x,ytc/10^14,'y',x,ydc/10^14+ytc/10^14,'y',x,yte/10^14,'g',x,yde/10^14+yte/10^14,'g',x,ytf/10^14,'c',x,ydf/10^14+ytf/10^14,'c',x,ytg/10^14,'k',x,ydg/10^14+ytg/10^14,'k')
grid on
ylabel('10^6 km^2/year')
title('Yearly-average of the termodynamic and dynamic tendency of the SIA')
%legend('a','b','c','e','f','g','Location','EastOutside')
text(1910,1.2*10,'Thermodynamics')
text(1910,0.1*10,'Yearly tendency SIA')
text(1910,-0.8*10,'Dynamics')
% print('TvsD_aice','-djpeg')




