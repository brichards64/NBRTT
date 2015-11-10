#!/bin/bash

rm -rf build/
mkdir build
cd build
git clone https://github.com/hyperk/hk-hyperk.git
cd hk-hyperk
#git checkout -b tags/v1r1.1 tags/v1r1.1
#echo '2'|./get_release.sh
#source Source_At_Start.sh
#./build.sh build
cd ../../