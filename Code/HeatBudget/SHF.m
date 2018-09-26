%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% SHF verification
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
addpath /glade/u/home/renaud/scripts


ncload b40.20th.track1.1deg.012.pop.h.EVAP_F.185001-200512.nc EVAP_F latent_heat_vapor
evap = EVAP_F(1,:,:)*latent_heat_vapor;
ncload b40.20th.track1.1deg.012.pop.h.IOFF_F.185001-200512.nc IOFF_F latent_heat_fusion
ioff = IOFF_F(1,:,:)*latent_heat_fusion/10^4;
ncload b40.20th.track1.1deg.012.pop.h.LWDN_F.185001-200512.nc LWDN_F
lwdn = LWDN_F(1,:,:);
ncload b40.20th.track1.1deg.012.pop.h.LWUP_F.185001-200512.nc LWUP_F
lwup = LWUP_F(1,:,:);
ncload b40.20th.track1.1deg.012.pop.h.MELTH_F.185001-200512.nc MELTH_F
melt = MELTH_F(1,:,:);
ncload b40.20th.track1.1deg.012.pop.h.SENH_F.185001-200512.nc SENH_F
sens = SENH_F(1,:,:);
ncload b40.20th.track1.1deg.012.pop.h.SHF.185001-200512.nc SHF
s = SHF(1,:,:);
ncload b40.20th.track1.1deg.012.pop.h.SHF_QSW.185001-200512.nc SHF_QSW
sw = SHF_QSW(1,:,:);
ncload b40.20th.track1.1deg.012.pop.h.SNOW_F.185001-200512.nc SNOW_F
snow = SNOW_F(1,:,:)*latent_heat_fusion/10^4;

delta = s - (evap+lwdn+lwup+melt+sens+sw-ioff-snow);

pcolor(squeeze(delta));shading interp;colorbar
title('SHF error')
% print('SHFerr','-djpeg')

