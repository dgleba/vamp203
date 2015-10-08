#!/bin/bash
set -x
cd
# set defaults
#
mkdir -p _this-vamp203i
#default_hostname="$(hostname)"
userv="albe"
default_hostname="vamp203i"
default_domain="vamp203i.local"

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
apt-get -y install samba 

#backup ssh server config...
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")

mkdir -p /home/$userv/webwork

# install apache 2.5 and php 5.5
sudo apt-get install -y apache2
sudo apt-get install -y php5

sudo apt-get -y install python-pip libapache2-mod-wsgi
sudo pip install django
sudo pip install django-admin-bootstrapped

# install git
sudo apt-get -y install git

echo " DONE; rebooting ... "
# reboot

