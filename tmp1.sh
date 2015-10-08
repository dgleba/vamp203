#!/usr/bin/env bash

get1
{
# get zip of repo from github
cd 
cd share203
wget -N https://codeload.github.com/dgleba/vamp203/zip/master
cd
#unzip [ -j junk paths - all in one folder ] 
rm -rf sh
unzip  ~/share203/master vamp203-master/* -d ./sh



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

echo tmp1

}

saynow
get1
#

