#!/bin/sh
echo '***'
echo '***  Building Attitude Adjustment in openwrt-aa '
echo '***' 
cd openwrt-aa

rm -rf bin/ar71xx/* #remove old images

scripts/feeds update -a 
scripts/feeds install -a
cp ../configs/config-aa .config

# Version-Strings codieren
#make CONFIG_VERSION_NUMBER="${BUILD_ID} (ff-kbu-master-aa-continuous)" -j16
#make clean
if [[ -z "$VERSION" ]]; then
	VERSION=$BUILD_ID
fi
        
make CONFIG_VERSION_NUMBER="${VERSION}" -j 8
        
 