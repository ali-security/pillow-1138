#!/bin/bash
# install libimagequant

set -x

archive=libimagequant-4.2.0

./download-and-extract.sh $archive https://raw.githubusercontent.com/python-pillow/pillow-depends/90bffcdb49a380afea391ae97fbd04cc523ad022/$archive.tar.gz

pushd $archive/imagequant-sys

cargo install cargo-c
cargo cinstall --prefix=/usr --destdir=.
sudo cp usr/lib/libimagequant.so* /usr/lib/
sudo cp usr/include/libimagequant.h /usr/include/

popd
