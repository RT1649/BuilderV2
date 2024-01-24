#!/bin/bash
rccache() {
cd /tmp
rm ccache.tar.gz
}
echo "Removing Old CCACHE"
rccache

compress() {
time tar --use-compress-program="pigz -k -$2 " -cf $1.tar.gz $1 ccache 1
}
echo "Compressing New CCACHE"
time compress ccache 1

uccache() {
curl --upload-file ./ccache.tar.gz https://transfer.sh/ccache.tar.gz

}
echo "Uploading CCACHE"
uccache

rom_upload() {
cd ~/
cd out/target/product/* && curl --upload-file ./crDroidAndroid-13.0-20240124-fleur-v9.13.zip https://transfer.sh/crDroidAndroid-13.0-20240124-fleur-v9.13.zip && curl --upload-file ./boot.img https://transfer.sh/boot.img
}
echo "Uploading Rom & Boot From /Out"
rom_upload
