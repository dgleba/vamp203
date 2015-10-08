#!/usr/bin/env bash

get1
{
# get zip of repo from github
cd 
cd share203
wget -N https://codeload.github.com/dgleba/vamp203/zip/master
#unzip [ -j junk paths - all in one folder ] 
rm -rf shc
# unzip one folder...  unzip  ~/share203/master vamp203-master/hyperv/* -d ./sh
# unzip to destination.. unzip ~/share203/master -d ./sh
unzip -u ~/share203/master
cp -a vamp203-master shc
cd shc
#hmm not sure this is just files with no extension..
find -type f -not -name "*.*" -exec chmod +x \{\} \;
chmod -R +x *.sh

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

# get zip of repo from github
cd 
cd share203
wget -N https://codeload.github.com/dgleba/vamp203/zip/master
#unzip [ -j junk paths - all in one folder ] 
rm -rf shc
#rm -rf vamp203-master
# unzip one folder...  unzip  ~/share203/master vamp203-master/hyperv/* -d ./sh
# unzip to destination.. unzip ~/share203/master -d ./sh
unzip -u ~/share203/master
cp -a vamp203-master shc

}

saynow
get1
#

