#!/bin/sh

if [ $# -lt 1 ]; then
	echo "Usage: $0 SSID"
else
	ssid=$1
	killall ifplugd >/dev/null 2>/dev/null
	iwpriv ra0 set NetworkType=Infra
	if [ $? -eq 0 ]; then
		iwpriv ra0 set AuthMode=OPEN
		iwpriv ra0 set EncrypType=NONE
		iwpriv ra0 set SSID="$ssid"
		echo "ok"
	else
		echo "failed"
	fi
fi

