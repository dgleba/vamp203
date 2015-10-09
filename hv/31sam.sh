#!/usr/bin/env bash

smb() {

#need configv1.sh.......
source ~/configv1.sh

sudo apt-get -y install samba

#backup server config...
mkdir ~/backup
cp /etc/samba/smb.conf /etc/samba/smb.conf.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
cp /etc/samba/smb.conf    ~backup/smb.conf.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")

cd
mkdir webwork
mkdir /var/www/html

cat <<EOF >> /etc/samba/smb.conf
# -------------------------------------------------------------------
# shares
#
[webwork]
path = /home/$userv/webwork
browsable =yes
writable = yes
guest ok = no
read only = no
valid users = $userv
# sudo smbpasswd -a $userv
# http://www.cyberciti.biz/tips/how-do-i-set-permissions-to-samba-shares.html
# https://www.howtoforge.com/samba-server-ubuntu-14.04-lts
#
[html]
path = /var/www/html
browsable =yes
writable = yes
guest ok = no
read only = no
valid users = $userv
# sudo smbpasswd -a $userv
# http://www.cyberciti.biz/tips/how-do-i-set-permissions-to-samba-shares.html
# https://www.howtoforge.com/samba-server-ubuntu-14.04-lts
#

EOF

sudo service smbd restart


}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

saynow() {
date
}

offlinestuff()  {
#exit 8
echo offline
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

saynow
set -x
smb
date
