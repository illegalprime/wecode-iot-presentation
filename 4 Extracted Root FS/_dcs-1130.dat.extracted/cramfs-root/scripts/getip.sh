#!/bin/sh

iptype=`GetDBData 3_Network IPType 1`

if [ "$iptype" = "0x0" ]; then
   udhcpc -n
   if [ $? -ne 0 ]; then
	ifconfig eth0 192.168.120.56 netmask 255.255.255.0
   fi 	
else
   ipaddr=`GetDBData 3_Network IPAddr 4`
   netmask=`GetDBData 3_Network Netmask 4`
   ifconfig eth0 $ipaddr netmask $netmask
fi

exit 0
