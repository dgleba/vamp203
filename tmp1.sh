df#!/usr/bin/env bash
#
date
set -x



# add shares to rc.local
sudo cp /etc/rc.local /etc/rc.local.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
mkdir ~/backup
sudo cp /etc/rc.local ~/backup/rc.local.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
sudo sed -i "/^exit 0/i	sudo mount -t vboxsf  share203 ~/share203\nsudo mount -t vboxsf  html /var/www/html\n" /etc/rc.local


#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#



offlinestuff()  {


#Add a line before exit 0 in rc.local
#no sed '/^exit 0/i\echo deadline > /sys/block/sda/queue/scheduler\necho 1 > /sys/block/sda/queue/iosched/fifo_batch' ~/rc.local   -redir- ~/rc.local
#sed -i "/^exit 0/i\/newly\/inserted\/path\/to\/script3.sh" ~/rc.local
#sed -i "/^exit 0/iline one\nline 2\n" ~/rc.local
#sudo sed -i "/^exit 0/i	sudo mount -t vboxsf  share203 ~/share203\nsudo mount -t vboxsf  html /var/www/htmln" /etc/rc.local
sed -i "/^exit 0/i	sudo mount -t vboxsf  share203 ~/share203\nsudo mount -t vboxsf  html /var/www/htmln" ~/rc.local


wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/12bootstrap203.sh -P ~
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/15import203.sh -P ~
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/18django203.sh -P ~
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/configv1.sh.example -P ~
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/90get.sh -P ~
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/90getb.sh -P ~
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/tmp1.sh -P ~
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/st2 -P ~
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/mntv -P ~
chmod +x ~/*.sh



sudo apt-get remove mysql-server phpmyadmin apache2

mkdir -p /var/www/html/cilist/templates_c
chmod 777 -r /var/www/html/cilist/templates_c
mkdir -p /var/www/html/leanmfg/templates_c

mkdir ~/share203
#sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) share203 ~/share203
sudo mount -t vboxsf  share203 ~/share203
mkdir /var/www/html
sudo mount -t vboxsf  html /var/www/html

wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/12bootstrap203.sh
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/15import203.sh
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/18django203.sh
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/90get.sh
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/start.sh
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/tmp1.sh


mkdir ~/share203
#sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) vamp203 ~/share203
sudo mount -t vboxsf  share203 ~/share203
sudo mkdir -p /var/www/html
sudo mount -t vboxsf  html /var/www/html

}

#
date
#
