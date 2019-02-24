#!/bin/sh

if [ $# -lt 2 ]; then
    echo "Usage: $0 NEW_IP PING_IP"
else
    new_ip=$1
    ping_ip=$2
    ifconfig ra0 $new_ip
    ping -c 30 $ping_ip
    if [ $? -eq 0 ]; then
	echo "ok"
    else
	echo "failed"
    fi
fi

