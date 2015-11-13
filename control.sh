#!/bin/bash

cd /data/hyperk/WCSimValidation/NBRTT

./build.sh
./runsim.sh

cd Validation
source ../build/hk-hyperk/Source_At_Start.sh
./newmakewebpage.sh
cd ..

cp -r Validation/* /users/richards/public_html/WCSim/
