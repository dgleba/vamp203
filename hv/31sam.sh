#!/usr/bin/env bash

one() {

sudo apt-get -y install samba

cd
mkdir share1

cat <<EOF >> /etc/samba/smb.conf
# -------------------------------------------------------------------
[share1]
path = /home/dg/share1
browsable =yes
writable = yes
guest ok = no
read only = no
valid users = dg
# sudo smbpasswd -a dg
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
one
date