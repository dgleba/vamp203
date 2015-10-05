#!/bin/bash
set -e

md /var
md /var/varvamp
cd /var/varvamp
mkdir vamp203c
cd vamp203c

rm ./create-unattended-iso.sh

wget https://raw.githubusercontent.com/dgleba/vamp203/master/create-unattended-iso.sh

#test...
#wget https://raw.githubusercontent.com/dgleba/vamp203/master/bootstrap203.sh
#wget https://raw.githubusercontent.com/dgleba/vamp203/master/import203.sh
#wget https://raw.githubusercontent.com/dgleba/vamp203/master/django203.sh
#wget https://raw.githubusercontent.com/dgleba/vamp203/master/start.sh
#wget https://raw.githubusercontent.com/dgleba/vamp203/master/start.sh
#blob is not correct.... https://github.com/dgleba/vamp203/blob/master/create-unattended-iso.sh

chmod +x create-unattended-iso.sh
#  >>>>>>edit it for tmp and iso source
sudo ./create-unattended-iso.sh
