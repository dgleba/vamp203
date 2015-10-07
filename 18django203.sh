#!/usr/bin/env bash

set -x
date

#to run this 
#ssh into the vagrant machine
# ./django198.sh
# this is from home - /home/vagrant


vhost8985()
{
sudo tee /etc/apache2/sites-available/djangolin1.conf <<EOF
#
# works on vagrant ubuntu vm 2015-09-28_Mon_23.25-PM 
# http://192.168.3.7:8985/django161c/admin/
listen 8985
<VirtualHost *:8985>
    DocumentRoot /var/www/html/django/django161c
    ServerName 127.0.0.1
    #ServerAdmin xx
    #ServerAlias xx
    #ErrorLog /path/to/first/project/logs/error.log
    #CustomLog /path/to/first/project/logs/access.log combined
    #
    Alias /static/ /var/www/html/django/django161c/static/
    #
    WSGIDaemonProcess django161c processes=1 threads=5 display-name=%{GROUP}
    WSGIProcessGroup django161c
    #
    WSGIScriptAlias /django161c /var/www/html/django/apache/django161c.wsgi
    #
    <Directory /var/www/html/django/apache>
       Order deny,allow
       Allow from all
     </Directory>
</VirtualHost>
#
#---
#
############
# works on vagrant ubuntu vm 2015-09-28_Mon_23.25-PM 
# http://192.168.3.5:8986/trakberry/admin/
listen 8986
<VirtualHost *:8986>
    DocumentRoot /var/www/html/django/trakberry
    ServerName 127.0.0.1
    #ServerAdmin xx
    #ServerAlias xx
    #ErrorLog /path/to/first/project/logs/error.log
    #CustomLog /path/to/first/project/logs/access.log combined
    #
    Alias /static/ /var/www/html/django/trakberry/static/
    #
    WSGIDaemonProcess trakberry processes=1 threads=5 display-name=%{GROUP}
    WSGIProcessGroup trakberry
    #
    WSGIScriptAlias /trakberry /var/www/html/django/apache/trakberry-lin.wsgi
    #
    <Directory /var/www/html/django/apache>
       Order deny,allow
       Allow from all
     </Directory>
</VirtualHost>
#
#---
#
############
#http://pmds-data.stackpole.ca:8987/mysite/admin/
#http://192.168.3.5:8987/mysite/admin/
listen 8987
<VirtualHost *:8987>
    DocumentRoot /var/www/html/django/mysite
    ServerName 127.0.0.1
    Alias /static/ /var/www/html/django/mysite/static/
    WSGIDaemonProcess mysite processes=1 threads=5 display-name=%{GROUP}
    WSGIProcessGroup mysite
    WSGIScriptAlias /mysite /var/www/html/django/apache/mysite-lin.wsgi 
    <Directory /var/www/html/django/apache>
        Order deny,allow
        Allow from all
    </Directory>
</VirtualHost>
#
EOF
}


djangosoft()
{
  sleep 1
  #moved to bootstrap.sh..
  #sudo pip install django-admin-bootstrapped
  # got error - use apt-get instead.......  sudo pip install mysql-python
  #sudo apt-get -y install python-mysqldb
}


apache1()
{
  sudo a2dissite djangolin1.conf
  sudo a2ensite djangolin1.conf
  #sudo service apache2 restart
  sudo service apache2 reload
}


#main section.....................................................................

#echo requested commands...
set -x
date

#djangosoft
vhost8985
apache1
updatedb

date

#
