#!/bin/bash
echo ${processtype}

if [${processtype} == "cdtimport"]
then
echo "Triggering CDT Import"
sleep 100
chmod 777 ./build-import.sh
./build-import.sh
else
echo "Triggering CDT Export"
sleep 100
chmod 777 ./build-export.sh
./build-export.sh
fi
