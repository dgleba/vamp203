#!/usr/bin/env bash

date
set -x
echo tmp1
sleep 3

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

saynow() {
# this function doesn't do much.
echo $(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
}

offlinestuff()  {
echo offlinestuff-test-echo
#exit 8
read -n1 -t4 -p "Press the ENTER key to keep going or wait some seconds....."
}
saynow
#
