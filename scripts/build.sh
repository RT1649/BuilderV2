#!/bin/bash
build() {
source build/envsetup.sh
lunch $MAKEFILENAME-$VARIENT
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
export SKIP_ABI_CHECKS=true
export ALLOW_MISSING_DEPENDENCIES=true
ccache -M 50G
ccache -o compression=true
ccache -z
$TARGET & sleep 85m
}
echo "Initializing Build System"
build
