#!/bin/bash

set -x

aptget_update()
{
    if [ ! -z $1 ]; then
        echo ""
        echo "Retrying apt-get update..."
        echo ""
    fi
    output=`sudo apt-get update 2>&1`
    echo "$output"
    if [[ $output == *[WE]:\ * ]]; then
        return 1
    fi
}
if [[ $(uname) != CYGWIN* ]]; then
    aptget_update || aptget_update retry || aptget_update retry
fi

set -e

if [[ $(uname) != CYGWIN* ]]; then
    sudo apt-get -qq install libfreetype6-dev liblcms2-dev python3-tk\
                             ghostscript libffi-dev libjpeg-turbo-progs libopenjp2-7-dev\
                             cmake meson imagemagick libharfbuzz-dev libfribidi-dev\
                             sway wl-clipboard
fi

python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712375Z@time-machines-pypi.sealsecurity.io/' --upgrade pip
python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712375Z@time-machines-pypi.sealsecurity.io/' --upgrade wheel
PYTHONOPTIMIZE=0 python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712375Z@time-machines-pypi.sealsecurity.io/' cffi
python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712375Z@time-machines-pypi.sealsecurity.io/' coverage
python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712375Z@time-machines-pypi.sealsecurity.io/' defusedxml
python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712375Z@time-machines-pypi.sealsecurity.io/' olefile
python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712375Z@time-machines-pypi.sealsecurity.io/' -U pytest
python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712375Z@time-machines-pypi.sealsecurity.io/' -U pytest-cov
python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712375Z@time-machines-pypi.sealsecurity.io/' -U pytest-timeout
python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712375Z@time-machines-pypi.sealsecurity.io/' pyroma

if [[ $(uname) != CYGWIN* ]]; then
    # TODO Remove condition when NumPy supports 3.12
    if ! [ "$GHA_PYTHON_VERSION" == "3.12-dev" ]; then python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712375Z@time-machines-pypi.sealsecurity.io/' numpy ; fi

    # PyQt6 doesn't support PyPy3
    if [[ "$GHA_PYTHON_VERSION" != "3.12-dev" && $GHA_PYTHON_VERSION == 3.* ]]; then
        sudo apt-get -qq install libegl1 libxcb-cursor0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 libxcb-shape0 libxkbcommon-x11-0
        python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712375Z@time-machines-pypi.sealsecurity.io/' pyqt6
    fi

    # webp
    pushd depends && ./install_webp.sh && popd

    # libimagequant
    pushd depends && ./install_imagequant.sh && popd

    # raqm
    pushd depends && ./install_raqm.sh && popd

    # extra test images
    pushd depends && ./install_extra_test_images.sh && popd
else
    cd depends && ./install_extra_test_images.sh && cd ..
fi
