
clear
load Export.mat


x = (1900:2099);

subplot(2,3,1)
area([2036 2037], [15 15],'FaceColor', 'k','Linestyle','none');
hold on
area([2036 2037], [-15 -15],'FaceColor', 'k','Linestyle','none');
plot(x,-aFI/10^12,x,-aBAI/10^12,x,aCI/10^12,x,-aBEI/10^12)
title('a')
xlim([1900 2100])
ylim([-0.1 0.7]*10)
yticks([-1:7])
set(gca,'xtick',[1900 1950 2000 2050 2100],'xticklabel',{'1900','','2000','','2100'})
grid on
ylabel('1000 km^3/y')
% legend('Fram','Barents','CAA','Bering')

subplot(2,3,2)
area([2027 2028], [15 15],'FaceColor', 'k','Linestyle','none');
hold on
area([2027 2028], [-15 -15],'FaceColor', 'k','Linestyle','none');
area([2030 2031], [15 15],'FaceColor', 'k','Linestyle','none');
area([2030 2031], [-15 -15],'FaceColor', 'k','Linestyle','none');
plot(x,-bFI/10^12,x,-bBAI/10^12,x,bCI/10^12,x,-bBEI/10^12)
xlim([1900 2100])
title({'Arctic Ocean gates sea-ice export','b.ES01'})
ylim([-0.1 0.7]*10)
yticks([-1:7])
set(gca,'xtick',[1900 1950 2000 2050 2100],'xticklabel',{'1900','','2000','','2100'})
grid on

subplot(2,3,3)
area([2032 2033], [15 15],'FaceColor', 'k','Linestyle','none');
hold on
area([2032 2033], [-15 -15],'FaceColor', 'k','Linestyle','none');
plot(x,-cFI/10^12,x,-cBAI/10^12,x,cCI/10^12,x,-cBEI/10^12)
title('c')
xlim([1900 2100])
ylim([-0.1 0.7]*10)
yticks([-1:7])
set(gca,'xtick',[1900 1950 2000 2050 2100],'xticklabel',{'1900','','2000','','2100'})
grid on

subplot(2,3,4)
area([2032 2033], [15 15],'FaceColor', 'k','Linestyle','none');
hold on
area([2032 2033], [-15 -15],'FaceColor', 'k','Linestyle','none');
plot(x,-eFI/10^12,x,-eBAI/10^12,x,eCI/10^12,x,-eBEI/10^12)
title('e')
xlim([1900 2100])
ylim([-0.1 0.7]*10)
yticks([-1:7])
set(gca,'xtick',[1900 1950 2000 2050 2100],'xticklabel',{'1900','','2000','','2100'})
grid on
ylabel('1000 km^3/y')

subplot(2,3,5)
area([2013 2015], [15 15],'FaceColor', 'k','Linestyle','none');
hold on
area([2013 2015], [-15 -15],'FaceColor', 'k','Linestyle','none');
plot(x,-fFI/10^12,x,-fBAI/10^12,x,fCI/10^12,x,-fBEI/10^12)
title('f.ES01')
xlim([1900 2100])
ylim([-0.1 0.7]*10)
yticks([-1:7])
set(gca,'xtick',[1900 1950 2000 2050 2100],'xticklabel',{'1900','','2000','','2100'})
grid on

subplot(2,3,6)
area([2044 2045], [15 15],'FaceColor', 'k','Linestyle','none');
hold on
area([2044 2045], [-15 -15],'FaceColor', 'k','Linestyle','none');
plot(x,-gFI/10^12,x,-gBAI/10^12,x,gCI/10^12,x,-gBEI/10^12)
title('g.ES01')
xlim([1900 2100])
ylim([-0.1 0.7]*10)
yticks([-1:7])
set(gca,'xtick',[1900 1950 2000 2050 2100],'xticklabel',{'1900','','2000','','2100'})
grid on

% print('Export2','-djpeg')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


tmp = mean([aFIy' bFIy' cFIy' eFIy' fFIy' gFIy'],2);
mean(tmp(1:10))

tmp = mean([aBAIy' bBAIy' cBAIy' eBAIy' fBAIy' gBAIy'],2);
mean(tmp(1:10))

tmp = mean([aCIy' bCIy' cCIy' eCIy' fCIy' gCIy'],2);
mean(tmp(1:10))

tmp = mean([aBEIy' bBEIy' cBEIy' eBEIy' fBEIy' gBEIy'],2);
mean(tmp(1:10))


tmp = [aFIy' bFIy' cFIy' eFIy' fFIy' gFIy'];

x = (1900:2099);
al = polyfit(x(1:100),aFIy(1:100),1);
bl = polyfit(x(1:100),bFIy(1:100),1);
cl = polyfit(x(1:100),cFIy(1:100),1);
el = polyfit(x(1:100),eFIy(1:100),1);
fl = polyfit(x(1:100),fFIy(1:100),1);
gl = polyfit(x(1:100),gFIy(1:100),1);
min([al(1) bl(1) cl(1) el(1) fl(1) gl(1)])
max([al(1) bl(1) cl(1) el(1) fl(1) gl(1)])
mean([al(1) bl(1) cl(1) el(1) fl(1) gl(1)])



plot(x(100:end),log(-aFIy(100:end)),x(100:end),log(-bFIy(100:end)),x(100:end),log(-cFIy(100:end)),x(100:end),log(-eFIy(100:end)),x(100:end),log(-fFIy(100:end)),x(100:end),log(-gFIy(100:end)))

ae = polyfit(x(100:180),log(-aFIy(100:180)),1);
be = polyfit(x(100:180),log(-bFIy(100:180)),1);
ce = polyfit(x(100:180),log(-cFIy(100:180)),1);
ee = polyfit(x(100:180),log(-eFIy(100:180)),1);
fe = polyfit(x(100:180),log(-fFIy(100:180)),1);
ge = polyfit(x(100:180),log(-gFIy(100:180)),1);
min([ae(1) be(1) ce(1) ee(1) fl(1) ge(1)])
max([ae(1) be(1) ce(1) ee(1) fl(1) ge(1)])
mean([ae(1) be(1) ce(1) ee(1) fl(1) ge(1)])


min([ae(1) be(1) ce(1) ee(1) ge(1)])
max([ae(1) be(1) ce(1) ee(1) ge(1)])
mean([ae(1) be(1) ce(1) ee(1) ge(1)])



tmp = [aFIy' bFIy' cFIy' eFIy' fFIy' gFIy'];
mean(mean(tmp(180:end,:)))
max(mean(tmp(180:end,:)))
min(mean(tmp(180:end,:)))




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plot(x,aBAI/10^12,x,bBAI/10^12,x,cBAI/10^12,x,eBAI/10^12,x,fBAI/10^12,x,gBAI/10^12)


x = (1900:2099);
al = polyfit(x(1:180),aBAIy(1:180),1);
bl = polyfit(x(1:180),bBAIy(1:180),1);
cl = polyfit(x(1:180),cBAIy(1:180),1);
el = polyfit(x(1:180),eBAIy(1:180),1);
fl = polyfit(x(1:180),fBAIy(1:180),1);
gl = polyfit(x(1:180),gBAIy(1:180),1);
min([al(1) bl(1) cl(1) el(1) fl(1) gl(1)])
max([al(1) bl(1) cl(1) el(1) fl(1) gl(1)])
mean([al(1) bl(1) cl(1) el(1) fl(1) gl(1)])


plot(x,aCI/10^12,x,bCI/10^12,x,cCI/10^12,x,eCI/10^12,x,fCI/10^12,x,gCI/10^12)

x = (1900:2099);
al = polyfit(x(1:180),aBAIy(1:180),1);
bl = polyfit(x(1:180),bBAIy(1:180),1);
cl = polyfit(x(1:180),cBAIy(1:180),1);
el = polyfit(x(1:180),eBAIy(1:180),1);
fl = polyfit(x(1:180),fBAIy(1:180),1);
gl = polyfit(x(1:180),gBAIy(1:180),1);
min([al(1) bl(1) cl(1) el(1) fl(1) gl(1)])
max([al(1) bl(1) cl(1) el(1) fl(1) gl(1)])
mean([al(1) bl(1) cl(1) el(1) fl(1) gl(1)])














