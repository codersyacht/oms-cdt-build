#!/bin/bash
echo ${processtype}

if [${processtype} -eq "cdtimport"]
then
echo "Triggering CDT Import"
chmod 777 ./build-import.sh
./build-import.sh
else
echo "Triggering CDT Export"
chmod 777 ./build-export.sh
./build-export.sh
fi
