% Verification of all the surface fluxes in the ice model.
clear
addpath /glade/u/home/renaud/scripts

lat1 = 333;
lat2 = 384;
latt1 = 53;
latt2 = 104;
long1 = 100;
long2 = 230;

ncload b30.030b.ES01.csim.h.1912-11.nc
delta = Fhnet - (Fswabs + Flwdn + Flwout + Flat + Fsens);
squeeze(delta(1:5,1:5))




