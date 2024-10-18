#!/bin/bash
yum install telnet -y
mkdir -p /opt/ssfs/customization
cp -r ../* /opt/ssfs/customization 
chmod 777 -R /opt/ssfs/customization
chown omsuser:omsuser -R /opt/ssfs/customization
sudo -E -u omsuser /bin/bash
source ~/.bashrc
sudo cat $PUSH_DOCKERCFG_PATH/.dockerconfigjson > /tmp/.dockercfg
cp -f /opt/ssfs/customization/resources/ydkresources/ydkprefs_export.xml /opt/ssfs/runtime/resources/ydkresources/ydkprefs.xml
cp -f /opt/ssfs/customization/bin/cdtshell.sh_export.in /opt/ssfs/runtime/bin/cdtshell.sh.in
echo "ydkprefs.xml and cdtshell.sh.in are updated"
cd /opt/ssfs/runtime/bin
./setupfiles.sh
echo "setupfiles execution completed"
./cdtshell.sh
echo "CDT export completed"
sleep 500
