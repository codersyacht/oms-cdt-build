#!/bin/bash
pwd
yum install expect -y
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
EOF
whoami
cd /opt/ssfs/sources

export GIT_USER=$(cat /var/run/secrets/openshift.io/source/username)
export GIT_PASS=$(cat /var/run/secrets/openshift.io/source/password)

git config --global --replace-all user.name ${GIT_USER}
git config --global --replace-all user.email ${GIT_USER}@gmail.com
git remote set-url origin https://${GIT_USER}@github.com/codersyacht/oms-cdt-build.git
git add *
git commit -m "Comment V1"
gitexp ${GIT_PASS} git push -u origin main --force
sleep 50000

