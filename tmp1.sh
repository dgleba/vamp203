df#!/usr/bin/env bash
#
date
set -x


wget https://raw.githubusercontent.com/dgleba/vamp203/master/12bootstrap203.sh -P ~
wget https://raw.githubusercontent.com/dgleba/vamp203/master/15import203.sh -P ~
wget https://raw.githubusercontent.com/dgleba/vamp203/master/18django203.sh -P ~
wget https://raw.githubusercontent.com/dgleba/vamp203/master/configv1.sh.example -P ~
wget https://raw.githubusercontent.com/dgleba/vamp203/master/90get.sh -P ~
wget https://raw.githubusercontent.com/dgleba/vamp203/master/90getb.sh -P ~
wget https://raw.githubusercontent.com/dgleba/vamp203/master/tmp1.sh -P ~
wget https://raw.githubusercontent.com/dgleba/vamp203/master/st2 -P ~
wget https://raw.githubusercontent.com/dgleba/vamp203/master/mntv -P ~
chmod +x ~/*.sh



#
#
#



offlinestuff()  {


sudo apt-get remove mysql-server phpmyadmin apache2

mkdir -p /var/www/html/cilist/templates_c
chmod 777 -r /var/www/html/cilist/templates_c
mkdir -p /var/www/html/leanmfg/templates_c

mkdir ~/share203
#sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) share203 ~/share203
sudo mount -t vboxsf  share203 ~/share203
mkdir /var/www/html
sudo mount -t vboxsf  html /var/www/html

wget https://raw.githubusercontent.com/dgleba/vamp203/master/12bootstrap203.sh
wget https://raw.githubusercontent.com/dgleba/vamp203/master/15import203.sh
wget https://raw.githubusercontent.com/dgleba/vamp203/master/18django203.sh
wget https://raw.githubusercontent.com/dgleba/vamp203/master/90get.sh
wget https://raw.githubusercontent.com/dgleba/vamp203/master/start.sh
wget https://raw.githubusercontent.com/dgleba/vamp203/master/tmp1.sh


mkdir ~/share203
#sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) vamp203 ~/share203
sudo mount -t vboxsf  share203 ~/share203
sudo mkdir -p /var/www/html
sudo mount -t vboxsf  html /var/www/html

}

#
date
#
