#!/usr/bin/env bash

date
set -x

wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/12bootstrap203.sh -P ~
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/15import203.sh -P ~
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/18django203.sh -P ~
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/90get.sh -P ~
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/start.sh -P ~
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/tmp1.sh -P ~
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/configv1.sh.example -P ~
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/90getb.sh -P ~
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/st2 -P ~
wget -N https://raw.githubusercontent.com/dgleba/vamp203/master/mntv -P ~

chmod +x ~/*.sh

chmod +x ./90get.sh
chmod +x ./12bootstrap203.sh
chmod +x ./15import203.sh
chmod +x ./18django203.sh
chmod +x ./start.sh
chmod +x ./tmp1.sh

#
date
#