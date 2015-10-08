#!/usr/bin/env bash

one() {

#command | tee /path/to/logfile
cd 
tee ./1.txt <<EOF
#
#
# works on vagrant ubuntu vm 2015-09-28_Mon_23.25-PM 
# http://192.168.3.7:8985/django161c/admin/

EOF

#send variable to file
t1=<<EOF
#
# t1
# http://192.168.3.7:8985/django161c/admin/
EOF
#
echo $t1 > ./2.txt

}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

saynow() {
date
}

offlinestuff()  {
#exit 8
zunused=1
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

saynow
set -x
one
date
