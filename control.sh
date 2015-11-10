#!/bin/bash

cd /data/hyperk/WCSimValidation/NBRTT

#./build.sh
./runsim.sh

cd Validation
./newmakewebpage.sh
cd ..

cp -r Validation/* /users/richards/public_html/WCSim/
