#!/bin/bash
pwd
yum install zip -y
cd ../CDTData
pwd
unzip CDTData-2024-10-28-08:37:50.zip
sleep 100
mkdir -p /opt/ssfs/customization
cp -r ../* /opt/ssfs/customization 
chmod 777 -R /opt/ssfs/customization
chown omsuser:omsuser -R /opt/ssfs/customization
rm -rf /opt/ssfs/customization/CDTData
mv /opt/ssfs/sources/CDTData/CDTData /opt/ssfs/customization/
sudo -E -u omsuser /bin/bash
source ~/.bashrc
sudo cat $PUSH_DOCKERCFG_PATH/.dockerconfigjson > /tmp/.dockercfg
cp -f /opt/ssfs/customization/resources/ydkresources/ydkprefs_import.xml /opt/ssfs/runtime/resources/ydkresources/ydkprefs.xml
cp -f /opt/ssfs/customization/bin/cdtshell.sh_import.in /opt/ssfs/runtime/bin/cdtshell.sh.in
cp -f /opt/ssfs/customization/properties/system_overrides.properties /opt/ssfs/runtime/properties/system_overrides.properties
echo "ydkprefs.xml, cdtshell.sh.in and system_overrides.properties are updated"
cd /opt/ssfs/runtime/bin
./setupfiles.sh
echo "setupfiles execution completed"
./cdtshell.sh
echo "CDT import completed"
sleep 50000
