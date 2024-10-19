#!/bin/bash
pwd
mkdir -p /opt/ssfs/customization
cp -r ../* /opt/ssfs/customization 
chmod 777 -R /opt/ssfs/customization
chown omsuser:omsuser -R /opt/ssfs/customization
sudo -E -u omsuser /bin/bash
whoami
cd /opt/ssfs/sources
cat /var/run/secrets/openshift.io/source/username
cat /var/run/secrets/openshift.io/source/password
export GIT_USER="codersyacht"
export GIT_PASS="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"

cp ./properties/system_overrides.properties ./CDTData/system_overrides.properties

git config --global --replace-all user.name "codersyacht"
git config --global --replace-all user.email "codersyacht@gmail.com"
config --global user.password "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"
git config --global github.token "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"

git remote set-url origin git+ssh://git@github.com/codersyacht/oms-cdt-build.git
git add *
git commit -m "Comment V1"
git branch -M main

git push -u origin main --force
echo "Export completed"
sleep 50000

