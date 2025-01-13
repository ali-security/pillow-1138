#!/bin/bash

# gather the coverage data
python3 -m pip install --index-url 'https://:2023-09-15T13:56:57.712374Z@time-machines-pypi.sealsecurity.io/' coverage
if [[ $MATRIX_DOCKER ]]; then
  python3 -m coverage xml --ignore-errors
else
  python3 -m coverage xml
fi
