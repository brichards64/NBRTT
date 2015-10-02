#!/bin/bash

rm -rf build/
mkdir build
cd build
git clone https://github.com/TITUSHK/ts-titus.git
cd ts-titus
echo '0'|./get_release.sh
./build.sh ALL build
cd ../../