#!/bin/bash

cd build
source ts-titus/Source_At_Start.sh
cd ts-WChSandBox
./bin/Linux-g++/WChSandBox MainRun.mac
cp ./FullEvent.root ../../output/
cp ./generatorcardfile.root ../../output/
cd ../../

