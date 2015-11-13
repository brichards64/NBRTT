#!/bin/bash

cd /data/richards/NBRTT/
./build.sh
./runsim.sh

cd Validation
source ../build/ts-titus/Source_At_Start.sh
./newmakewebpage.sh
cd ..

cp -r Validation/* /users/richards/public_html/TITUS