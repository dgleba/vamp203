#!/usr/bin/env bash

#
date
set -x


vshare()
{
sudo tee /etc/init/mountvshare.conf <<EOF
description "Test mount"
author      "Your Name"

start on filesystem or runlevel [2345]
stop on shutdown

script

    sleep 8
    mount html
    mount share203

end script

pre-start script
    echo "[`date`] mountvshare start...." >> /var/log/mountvshare.log
end script

pre-stop script
    rm /var/run/mountvshare.pid
    echo "[`date`] .... stop mountvshare" >> /var/log/mountvshare.log
end script
EOF
}
vshare

vshare2 
{
# vshare info
ls /etc/init/m* -la
cat /etc/init/mountvshare.conf 
init-checkconf /etc/init/mountvshare.conf 
sudo service mountvshare restart

}



#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#

saynow 
{
# this function not used.
echo (date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
}

offlinestuff()  {

sudo service testjob start

echo offlinestuff-test-echo
#exit 8

description "A test job file for experimenting with Upstart"
author "Your Name"
start on runlevel [2345]
exec echo Test Job ran at  `date` >> /var/log/testjob.log


echo tmp1
sleep 3



#add shares to fstab
cp /etc/fstab /etc/fstab.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
mkdir -p ~/backup
cp /etc/fstab ~/backup/fstab.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
echo "html      /var/www/html  vboxsf   defaults  0   0" >> /etc/fstab
echo "share203  /home/bun/share203  vboxsf   defaults  0   0" >> /etc/fstab


sudo sed -i "/^exit 0/i	mount.vboxsf share203 /home/$user/share203 vboxsf\nmount.vboxsf html /var/www/html vboxsf\n" /etc/rc.local
#http://askubuntu.com/questions/252853/how-to-mount-a-virtualbox-shared-folder-at-startup


#add shares to fstab
cp /etc/fstab /etc/fstab.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
mkdir -p ~/backup
cp /etc/fstab ~/backup/fstab.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
echo "html      /var/www/html  vboxsf   defaults  0   0" >> /etc/fstab
echo "share203  /home/bun/share203  vboxsf   defaults  0   0" >> /etc/fstab



read -n1 -t4 -p "Press the ENTER key to keep going or wait some seconds....."

#copy config from website files...
#
if [ ! -f /var/www/html/vm/configv1.sh ]; then
    echo "configv1.sh File not found!"

fi
if [ ! -f /var/www/html/z,index.html ]; then 
    echo "Error: website files not found! Exiting. There should at least be /var/www/html/index.html - Please fix this and try again."
		date 
		echo "Hit Enter to Continue, this will continue after some seconds pass..." 
		read readtime1 -n1
		date
	exit 99
fi

sudo cp /var/www/html/vm/configv1.sh ~


# add shares to rc.local
sudo cp /etc/rc.local /etc/rc.local.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
mkdir ~/backup
sudo cp /etc/rc.local ~/backup/rc.local.bak$(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
sudo sed -i "/^exit 0/i	sudo mount -t vboxsf  share203 ~/share203\nsudo mount -t vboxsf  html /var/www/html\n" /etc/rc.local


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

saynow

#

