#!/usr/bin/env bash

#Note: vbox shares are not available till it reboots after start.sh script runs.
#
#David Gleba 2015-10-01 03:15PM

date
set -x

#PROJECTFOLDER='project'

# mount vbox shares...
#
mkdir -p ~/share203
if mount | grep /share203 > /dev/null; then
    echo "its mounted"
else
    echo "not, so mount it"
	sudo mount -t vboxsf  share203 ~/share203
fi
#sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) vamp203 ~/share203
#
sudo mkdir -p /var/www/html
if mount | grep /var/www/html > /dev/null; then
    echo "already mounted"
else
    echo "now mount it"
	sudo mount -t vboxsf  html /var/www/html
fi


#copy config from website files...
#
if [ ! -f /var/www/html/vm/configv1.sh ]; then
    echo "Error: configv1.sh File not found!"
fi
if [ ! -f /var/www/html/index.html ]; then
       echo "Error: website files not found! Exiting. There should at least be /var/www/html/index.html - Please fix this and try again."
	exit 99
fi

sudo cp /var/www/html/vm/configv1.sh ~

sleep 9

source ~/configv1.sh


# create project folder
#sudo mkdir "/var/www/html/${PROJECTFOLDER}"

# update / upgrade
#sudo apt-get update
#sudo apt-get -y upgrade

# install apache 2.5 and php 5.5
sudo apt-get install -y apache2
sudo apt-get install -y php5

# install mysql and give password to installer
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
sudo apt-get -y install mysql-server

#should this have a -y???
sudo apt-get install -y php5-mysql

# install phpmyadmin and give password(s) to installer
# for simplicity I'm using the same password for mysql and phpmyadmin
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
sudo apt-get -y install phpmyadmin

sudo apt-get -y install python-pip libapache2-mod-wsgi
sudo pip install django

sudo pip install django-admin-bootstrapped
# got error - use apt-get instead.......  sudo pip install mysql-python
sudo apt-get  -y install python-mysqldb



#	# setup hosts file
#	VHOST=$(cat <<EOF
#	<VirtualHost *:80>
#		DocumentRoot "/var/www/html/${PROJECTFOLDER}"
#		<Directory "/var/www/html/${PROJECTFOLDER}">
#			AllowOverride All
#			Require all granted
#		</Directory>
#	</VirtualHost>
#	EOF
#	)
#	echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf


# enable mod_rewrite
sudo a2enmod rewrite

# restart apache
service apache2 restart

# install git
sudo apt-get -y install git

# install Composer
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

sudo apt-get -y install mc


# comment these out to just run this manually after boot. just need it once. renamed to import198.sh
#sudo ./15import198.sh
#sudo ./18django198.sh

#
date
#
