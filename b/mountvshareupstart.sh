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

}

saynow

#

