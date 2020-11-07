#!/bin/sh

RES=$(curl --silent --max-time 3 --retry 1 https://integrity.st/iptest.php)

if [ "$RES" == "1" ]
then
  echo " VPN"
else
  echo " VPN"
fi
