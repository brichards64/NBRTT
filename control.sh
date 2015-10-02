#!/bin/bash
cd /data/richards/NBRTT/
./build.sh
./runsim.sh
cd Validation
./makewebpage.sh
cd ..