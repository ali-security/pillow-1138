#!/bin/bash

set -e

brew install libtiff libjpeg openjpeg libimagequant webp little-cms2 freetype libraqm

PYTHONOPTIMIZE=0 python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712376Z@time-machines-pypi.sealsecurity.io/' cffi
python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712376Z@time-machines-pypi.sealsecurity.io/' coverage
python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712376Z@time-machines-pypi.sealsecurity.io/' defusedxml
python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712376Z@time-machines-pypi.sealsecurity.io/' olefile
python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712376Z@time-machines-pypi.sealsecurity.io/' -U pytest
python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712376Z@time-machines-pypi.sealsecurity.io/' -U pytest-cov
python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712376Z@time-machines-pypi.sealsecurity.io/' -U pytest-timeout
python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712376Z@time-machines-pypi.sealsecurity.io/' pyroma

# TODO Remove condition when NumPy supports 3.12
if ! [ "$GHA_PYTHON_VERSION" == "3.12-dev" ]; then python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712376Z@time-machines-pypi.sealsecurity.io/' numpy ; fi

# extra test images
pushd depends && ./install_extra_test_images.sh && popd
