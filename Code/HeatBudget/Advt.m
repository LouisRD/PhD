%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% ADVT = div(UET+VNT) for 1 month
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
addpath /glade/u/home/renaud/scripts

ncload b40.20th.track1.1deg.012.pop.h.1930-01.nc dz UET VNT ADVT ADVT_ISOP ADVT_SUBM TAREA
[nz nlat nlong] = size(UET);
DZ = repmat(dz, [1 nlat nlong]);
AREA = repmat(TAREA,[1 1 nz]);
AREA = permute(AREA,[3 1 2]);
UET = UET.*AREA.*DZ; VNT = VNT.*AREA.*DZ; ADVT = ADVT.*TAREA; ADVT_ISOP = ADVT_ISOP.*TAREA; ADVT_SUBM = ADVT_SUBM.*TAREA;
emw = zeros(nz,nlat,nlong);% east minus west
emw(:,:,2:end) = UET(:,:,2:end) - UET(:,:,1:end-1);
emw(:,:,1) = UET(:,:,1) - UET(:,:,end);
nms = zeros(nz,nlat,nlong); % north minus south
nms(:,2:end,:) = VNT(:,2:end,:) - VNT(:,1:end-1,:);
div = squeeze(sum(emw+nms,1));
delta = abs(div+ADVT);

pcolor(delta); colorbar; shading interp; caxis([10^6 10^8]);
div(1:5,1:5)
ADVT(1:5,1:5)
delta(1:5,1:5)

d = div+ADVT;
subplot(2,2,1)
pcolor(d); colorbar; shading interp; caxis([0 10^7]);
title('delta')
subplot(2,2,2)
pcolor(ADVT); colorbar; shading interp; caxis([0 10^7]);
title('ADVT')
subplot(2,2,3)
pcolor(ADVT_ISOP); colorbar; shading interp; caxis([0 10^7]);
title('ADVT\_ISOP')
subplot(2,2,4)
pcolor(ADVT_SUBM); colorbar; shading interp; caxis([0 10^7]);
title('ADVT\_SUBM')

index = find(div==0);
div(index) = NaN;
subplot(1,2,1)
pcolor(-div); colorbar; shading interp; caxis([-4 4]*10^12);
title('div')
subplot(1,2,2)
pcolor(ADVT); colorbar; shading interp; caxis([-4 4]*10^12);
title('ADVT')































ncload b40.20th.track1.1deg.012.pop.h.UET.185001-185912.nc UET dz
[nt nz nlat nlong] = size(UET);
DZ = repmat(dz, [1 nt nlat nlong]);
DZ = permute(DZ,[2 1 3 4]);
dive = zeros(nt,nz,nlat,nlong);
dive(:,:,:,2:end) = UET(:,:,:,2:end) - UET(:,:,:,1:end-1);
dive(:,:,:,1) = UET(:,:,:,1) - UET(:,:,:,end);
de = squeeze(sum(dive.*DZ,2));

ncload b40.20th.track1.1deg.012.pop.h.VNT.185001-185912.nc VNT
divn = zeros(nt,nz,nlat,nlong);
divn(:,:,2:end,:) = VNT(:,:,2:end,:) - VNT(:,:,1:end-1,:);
dn = squeeze(sum(divn.*DZ,2));

ncload b40.20th.track1.1deg.012.pop.h.ADVT.185001-200512.nc ADVT
ncload b40.20th.track1.1deg.012.pop.h.ADVT_SUBM.185001-200512.nc ADVT_SUBM
ncload b40.20th.track1.1deg.012.pop.h.ADVT_ISOP.185001-200512.nc ADVT_ISOP

d = -(de-dn);
%delta = abs(ADVT(1:120,:,:) - d);
squeeze(ADVT(1,1:5,1:5))
squeeze(d(1,1:5,1:5))


%pcolor(squeeze(max(abs(delta)))); colorbar; shading interp






