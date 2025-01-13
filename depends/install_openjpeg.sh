#!/bin/bash
# install openjpeg

archive=openjpeg-2.5.0

./download-and-extract.sh $archive https://raw.githubusercontent.com/python-pillow/pillow-depends/90bffcdb49a380afea391ae97fbd04cc523ad022/$archive.tar.gz

pushd $archive

cmake -DCMAKE_INSTALL_PREFIX=/usr . && make -j4 && sudo make -j4 install

popd
