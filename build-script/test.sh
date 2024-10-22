#!/bin/bash
pwd

sudo -E -u omsuser /bin/bash
source ~/.bashrc
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

