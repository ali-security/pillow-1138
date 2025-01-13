#!/usr/bin/env bash
# install raqm


archive=libraqm-0.10.1

./download-and-extract.sh $archive https://raw.githubusercontent.com/python-pillow/pillow-depends/90bffcdb49a380afea391ae97fbd04cc523ad022/$archive.tar.gz

pushd $archive

meson build --prefix=/usr && sudo ninja -C build install

popd

