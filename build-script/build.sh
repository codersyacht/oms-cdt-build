#!/bin/bash
pwd
yum install expect -y
chmod 777 ./test.sh
cp gitexp /usr/bin/gitexp
chmod 777 /usr/bin/gitexp
mkdir -p /opt/ssfs/customization
cp -r ../* /opt/ssfs/customization 
chmod 777 -R /opt/ssfs/customization
chown omsuser:omsuser -R /opt/ssfs/customization
sudo -E -u omsuser /bin/bash
source ~/.bashrc
sudo cat $PUSH_DOCKERCFG_PATH/.dockerconfigjson > /tmp/.dockercfg
cp -f /opt/ssfs/customization/resources/ydkresources/ydkprefs_export.xml /opt/ssfs/runtime/resources/ydkresources/ydkprefs.xml
cp -f /opt/ssfs/customization/bin/cdtshell.sh_export.in /opt/ssfs/runtime/bin/cdtshell.sh.in
cp -f /opt/ssfs/customization/properties/system_overrides.properties /opt/ssfs/runtime/properties/system_overrides.properties
echo "ydkprefs.xml, cdtshell.sh.in and system_overrides.properties are updated"
cd /opt/ssfs/runtime/bin
./setupfiles.sh
echo "setupfiles execution completed"
./cdtshell.sh
echo "CDT export completed"
whoami
./test.sh
sleep 50000
