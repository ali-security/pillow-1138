#!/bin/bash
# install webp

archive=libwebp-1.3.2

./download-and-extract.sh $archive https://raw.githubusercontent.com/python-pillow/pillow-depends/90bffcdb49a380afea391ae97fbd04cc523ad022/$archive.tar.gz

pushd $archive

./configure --prefix=/usr --enable-libwebpmux --enable-libwebpdemux && make -j4 && sudo make -j4 install

popd
