#!/usr/bin/env bash

date
set -x

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

# got error - use apt-get instead.......  sudo pip install mysql-python
sudo apt-get  -y install python-mysqldb

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# install ftp server...
#    https://help.ubuntu.com/lts/serverguide/ftp-server.html
apt-get -y install vsftpd
# uncomment #write_enable=YES
sudo sed -i "s@#write_enable=YES@write_enable=YES@g" /etc/vsftpd.conf


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# install sendmail...
#    http://askubuntu.com/questions/47609/how-to-have-my-php-send-mail
sudo apt-get -y install ssmtp

#  edit /etc/ssmtp/ssmtp.conf -- edit  mailhub=mail
sudo sed -i "s@mailhub=mail@mailhub=MESG01.stackpole.ca@g"  /etc/ssmtp/ssmtp.conf

# edit /etc/php5/apache2/php.ini
# sudo nano /etc/php5/apache2/php.ini
sudo sed -i "s@;sendmail_path =@sendmail_path = /usr/sbin/sendmail -t@g"  /etc/php5/apache2/php.ini

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# enable mod_rewrite
sudo a2enmod rewrite

# restart apache
service apache2 restart


# install Composer
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

#mkdir -p /var/www/html

#
date
#
