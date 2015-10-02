#!/usr/bin/env bash
#
date
set -x

mkdir share203
#sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) vamp203 ~/share203
sudo mount -t vboxsf  vamp203 ~/share203
sudo mkdir -p /var/www/html
sudo mount -t vboxsf  html /var/www/html


function offline  {
wget https://raw.githubusercontent.com/dgleba/vamp203/master/12bootstrap203.sh
wget https://raw.githubusercontent.com/dgleba/vamp203/master/15import203.sh
wget https://raw.githubusercontent.com/dgleba/vamp203/master/18django203.sh
wget https://raw.githubusercontent.com/dgleba/vamp203/master/90get.sh
wget https://raw.githubusercontent.com/dgleba/vamp203/master/start.sh
wget https://raw.githubusercontent.com/dgleba/vamp203/master/tmp1.sh

}

#
date
#