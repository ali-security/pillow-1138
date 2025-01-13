#!/usr/bin/env bash
# install raqm


archive=raqm-cmake-99300ff3

./download-and-extract.sh $archive https://raw.githubusercontent.com/python-pillow/pillow-depends/90bffcdb49a380afea391ae97fbd04cc523ad022/$archive.tar.gz

pushd $archive

mkdir build
cd build
cmake ..
make && sudo make install
cd ..

popd

