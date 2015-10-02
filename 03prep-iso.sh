#!/bin/bash
set -e

md /var/varvamp
cd /var/varvamp/
mkdir vamp203b
cd vamp203b
"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" sharedfolder add "vamp203b" --name vamp203 --hostpath c:/var/vamp203b/ --automount
mkdir c:\var\vamp203b

rm create-unattended-iso.sh
wget https://raw.githubusercontent.com/dgleba/vamp203/master/create-unattended-iso.sh
#https://github.com/dgleba/vamp203/blob/master/create-unattended-iso.sh
chmod +x create-unattended-iso.sh
#  >>>>>>edit it for tmp and iso source
sudo ./create-unattended-iso.sh