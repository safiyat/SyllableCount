#! /usr/bin/env sh

###############################################################################
#                                                                             #
# file: script.sh                                                             #
# author: Md Safiyat Reza (md.reza@snapdeal.com)                              #
#                                                                             #
# A script to bring the eth1 interface up if present.                         #
# This script was written during the testing phase on VirtualBox to enable    #
# the eth1 interface and interact with the collector nodes in the VirtualBox  #
# Internal Network.                                                           #
#                                                                             #
# Not required in production.                                                 #
#                                                                             #
###############################################################################

ETH1=`ifconfig -a | grep eth1`
if [ -z "$ETH1" ]
then
    exit
fi
sudo ip link set dev eth1 down
sudo ip addr add 10.0.0.20/24 dev eth1
sudo ip link set dev eth1 up 
sudo ip route add default via 10.0.0.1
