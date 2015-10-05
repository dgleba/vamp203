#!/usr/bin/env bash

date
#echo requested commands...
set -x

#to run this 
#ssh into the vagrant machine
# ./15import203.sh
#

source ~/configv1.sh


mysql -uroot -p$PASSWORD -e "create database cilist"; 
mysql -uroot -p$PASSWORD -e "create database enamesdb"; 
mysql -uroot -p$PASSWORD -e "create database leanmfg"; 
mysql -uroot -p$PASSWORD -e "create database prodrptdb"; 
mysql -uroot -p$PASSWORD -e "create database shift_smsmeer"; 
mysql -uroot -p$PASSWORD -e "create database shiftcsd1"; 
mysql -uroot -p$PASSWORD -e "create database shiftcsd1suprv"; 
mysql -uroot -p$PASSWORD -e "create database shiftcsd2"; 
mysql -uroot -p$PASSWORD -e "create database shiftcsd2suprv"; 


#not a good idea to import 'mysql' database.
#mysql --user=root --password=xx < /var/www/html/backup/mysql/pmdsdata-all-mysql.sql
#
#import one database at a time from the backup of all the mysql data.
#
mysql -uroot -p$PASSWORD --one-database cilist < /var/www/html/backup/mysql/pmdsdata-all-mysql.sql
mysql -uroot -p$PASSWORD --one-database enamesdb < /var/www/html/backup/mysql/pmdsdata-all-mysql.sql
mysql -uroot -p$PASSWORD --one-database leanmfg < /var/www/html/backup/mysql/pmdsdata-all-mysql.sql
mysql -uroot -p$PASSWORD --one-database prodrptdb < /var/www/html/backup/mysql/pmdsdata-all-mysql.sql
mysql -uroot -p$PASSWORD --one-database shift_smsmeer < /var/www/html/backup/mysql/pmdsdata-all-mysql.sql
mysql -uroot -p$PASSWORD --one-database shiftcsd1 < /var/www/html/backup/mysql/pmdsdata-all-mysql.sql
mysql -uroot -p$PASSWORD --one-database shiftcsd1suprv < /var/www/html/backup/mysql/pmdsdata-all-mysql.sql
mysql -uroot -p$PASSWORD --one-database shiftcsd2 < /var/www/html/backup/mysql/pmdsdata-all-mysql.sql
mysql -uroot -p$PASSWORD --one-database shiftcsd2suprv < /var/www/html/backup/mysql/pmdsdata-all-mysql.sql


# use here document to provide input...
#  https://ignaciopp.wordpress.com/2011/08/08/heredoc-tip-execute-mysql-commands-from-shell-with-multiline-scripts-or-queries/
#    heredoc not working just do one line at a time.
mysql -uroot -p$PASSWORD  -e "CREATE USER 'dg417'@'localhost' IDENTIFIED BY '$PASSWORD2';"
mysql -uroot -p$PASSWORD  -e "GRANT USAGE ON *.* TO 'dg417'@'localhost' IDENTIFIED BY '$PASSWORD2' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;"
mysql -uroot -p$PASSWORD  -e "GRANT ALL PRIVILEGES ON prodrptdb.* TO dg417@localhost ;"
mysql -uroot -p$PASSWORD  -e "GRANT ALL PRIVILEGES ON shiftcsd2suprv.* TO dg417@localhost ;"
mysql -uroot -p$PASSWORD  -e "GRANT ALL PRIVILEGES ON shiftcsd1suprv.* TO dg417@localhost ;"
mysql -uroot -p$PASSWORD  -e "GRANT ALL PRIVILEGES ON shiftcsd1.* TO dg417@localhost ;"
mysql -uroot -p$PASSWORD  -e "GRANT ALL PRIVILEGES ON leanmfg.* TO dg417@localhost ;"
mysql -uroot -p$PASSWORD  -e "GRANT ALL PRIVILEGES ON cilist.* TO dg417@localhost ;"
mysql -uroot -p$PASSWORD  -e "GRANT ALL PRIVILEGES ON enamesdb.* TO dg417@localhost ;"
mysql -uroot -p$PASSWORD  -e "GRANT ALL PRIVILEGES ON shift_smsmeer.* TO dg417@localhost ;"


mkdir /var/www/html/cilist/templates_c
mkdir /var/www/html/leanmfg/templates_c
mkdir /var/www/html/prodrpt/templates_c
mkdir /var/www/html/shiftcsd2/templates_c
mkdir /var/www/html/shiftcsd2sup/templates_c
mkdir /var/www/html/shiftcsd1sup/templates_c
mkdir /var/www/html/shiftcsd1/templates_c


chmod -R 777  /var/www/html/cilist/templates_c
chmod -R 777  /var/www/html/leanmfg/templates_c
chmod -R 777  /var/www/html/prodrpt/templates_c
chmod -R 777  /var/www/html/shiftcsd2/templates_c
chmod -R 777  /var/www/html/shiftcsd2sup/templates_c
chmod -R 777  /var/www/html/shiftcsd1sup/templates_c
chmod -R 777  /var/www/html/shiftcsd1/templates_c


date

#
