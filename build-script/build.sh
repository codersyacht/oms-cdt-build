#!/bin/bash
pwd
mkdir -p /opt/ssfs/customization
cp -r ../* /opt/ssfs/customization 
chmod 777 -R /opt/ssfs/customization
chown omsuser:omsuser -R /opt/ssfs/customization
sudo -E -u omsuser /bin/bash
whoami
cd /opt/ssfs/sources
git config --global --replace-all user.name "codersyacht"
git config --global --replace-all user.email "codersyacht@gmail.com"
git add *
git commit -m "Comment V1"
git branch -M main
cat cat /var/run/secrets/openshift.io/source/username
cat /var/run/secrets/openshift.io/source/password
git push -u origin main --force
echo "Export completed"
sleep 500

