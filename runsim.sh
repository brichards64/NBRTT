#!/bin/bash

cd build
source ts-titus/Source_At_Start.sh


cd ts-WChSandBox
./bin/Linux-g++/WChSandBox MainRun.mac
unlink ../../output/FullEvent.root
unlink ../../output/generatorcardfile.root
ln -s `pwd`/FullEvent.root ../../output/
ln -s `pwd`/generatorcardfile.root ../../output/


cd ../ts-WChRecoSandBox/
echo -e "gSystem->Load(\"./lib/libWCLAnalysis.so\") \n .x ./scripts/PhotonMask_12in.C "| root -b
echo -e "gSystem->Load(\"./lib/libWCLAnalysis.so\") \n .x ./scripts/SandFit.C "| root -b
unlink ../../output/out.root
unlink ../../output/testout2.root
ln -s `pwd`/out.root ../../output/
ln -s `pwd`/testout2.root ../../output/

cd ../../

