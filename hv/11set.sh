#!/bin/bash
set -x

# set defaults
#
mkdir -p _this-vamp203h
#default_hostname="$(hostname)"
userv="albe"
default_hostname="vamp203h"
default_domain="vamp203h.local"

mkdir -p tmp
tmp="/home/$userv/tmp"
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/tmp1.sh -P .
chmod +x ~/*.sh

#clear
# check for root privilege
if [ "$(id -u)" != "0" ]; then
   echo " this script must be run as root" 1>&2
   echo
   exit 1
fi

# determine ubuntu version
ubuntu_version=$(lsb_release -cs)


# update repos
apt-get -y update 
#apt-get -y upgrade > /dev/null 2>&1
#apt-get -y dist-upgrade > /dev/null 2>&1
apt-get -y autoremove 
apt-get -y purge 

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

apt-get -y install mc
apt-get -y install locate
apt-get -y install openssh-server 

#backup ssh server config...
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")

mkdir -p /home/$userv/share203
mkdir -p /var/www/html

echo " DONE; rebooting ... "
# reboot

