#!/bin/bash

cd build
source hk-hyperk/Source_At_Start.sh
cd WCSim/
./exe/bin/Linux-g++/WCSim novis.mac
cd sample-root-scripts/
root -l benout.cpp
cp ./ben.root ../../../output/
#cp ./generatorcardfile.root ../../output/
cd ../../

