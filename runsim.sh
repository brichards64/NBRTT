#!/bin/bash

cd build

source hk-hyperk/Source_At_Start.sh

cd WCSim/
./exe/bin/Linux-g++/WCSim novis.mac

cd sample-root-scripts/

cp ../../../compout/OutputVariables.cpp ./
root -l -b -q OutputVariables.cpp
unlink ../../../output/testvars.root
ln -s `pwd`/testvars.root ../../../output/

cd ../../../

