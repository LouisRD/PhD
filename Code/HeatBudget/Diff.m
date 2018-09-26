clear
addpath /glade/u/home/renaud/scripts

ncload b40.20th.track1.1deg.012.pop.h.HDIFE_TEMP.185001-185912.nc HDIFE_TEMP dz
[nt nz nlat nlong] = size(HDIFE_TEMP);
DZ = repmat(dz, [1 nt nlat nlong]);
DZ = permute(DZ,[2 1 3 4]);
dive = zeros(nt,nz,nlat,nlong);
dive(:,:,:,2:end) = HDIFE_TEMP(:,:,:,2:end) - HDIFE_TEMP(:,:,:,1:end-1);
dive(:,:,:,1) = HDIFE_TEMP(:,:,:,1) - HDIFE_TEMP(:,:,:,end);
de = squeeze(sum(dive.*DZ,2));

ncload b40.20th.track1.1deg.012.pop.h.HDIFN_TEMP.185001-185912.nc HDIFN_TEMP
divn = zeros(nt,nz,nlat,nlong);
divn(:,:,2:end,:) = HDIFN_TEMP(:,:,2:end,:) - HDIFN_TEMP(:,:,1:end-1,:);
dn = squeeze(sum(divn.*DZ,2));

ncload b40.20th.track1.1deg.012.pop.h.HDIFT.185001-200512.nc HDIFT
delta = HDIFT(1:120,:,:) - (de+dn);


pcolor(squeeze(max(abs(d)))); colorbar; shading interp






ncload b40.20th.track1.1deg.012.pop.h.ADVT_SUBM.185001-200512.nc ADVT_SUBM
ncload b40.20th.track1.1deg.012.pop.h.ADVT_ISOP.185001-200512.nc ADVT_ISOP

HDIFT(1,1:8,1)
div(1,1:8,1)
ADVT_ISOP(1,1:8,1)
ADVT_SUBM(1,1:8,1)
delta(1,1:8,1)




