#!/bin/sh

daemon=network
PATH=$PATH:/sbin
interfaces=/etc/network/interfaces
resolv=/etc/resolv.conf

die() {
	echo $@
	exit 1
}

showUsage() {
	die "$0 {start|stop|restart|status} [prefix]"
}

probeRt61() {
	cat /proc/pci 2> /dev/null | grep -q 'PCI.*1814:030[12]'
}

probeWireless() {
	[ "$(pibinfo Wireless)" -eq 1 ]
}

probeLink() {
#ifplugstatus $1 > /dev/null 2> /dev/null
#[ $? -eq 2 ] && return 0 || return 1
	mii-tool $1 2> /dev/null | grep -q 'link ok'
}

dumpNetworkKeys() {
	echo -n "\
DHCPEnable_byte
Address_ss
Netmask_ss
Gateway_ss
DNS1_ss
DNS2_ss
"
}

dumpPPPoEKeys() {
	echo -n "\
Enable_byte
User_ms
Password_ms
"
}

dumpWirelessKeys() {
	echo -n "\
Enable_byte
Mode_byte
Channel_num
AuthMode_byte
SecMethod_byte
ESSID_ms
Key_ls
WepKeyIndex_byte
"
}

dumpHost() {
	echo -n "\
CameraName_ms
"
}

dumpDNS() {
	[ $DNS1_ss ] && echo nameserver $DNS1_ss
	[ $DNS2_ss ] && echo nameserver $DNS2_ss
}

dumpStatic() {
	echo -n "\
iface $1 inet static
	address $Address_ss
	netmask $Netmask_ss
	gateway $Gateway_ss
"
}

dumpDHCP() {
	echo -n "\
iface $1 inet dhcp
	hostname $(quote encode "$CameraName_ms")
"
}

makeupStatic() {
#	echo makeupStatic >> /tmp/debug
	dumpStatic $1 >> $interfaces
	dumpDNS >> $resolv
	return 0
}

makeupDHCP() {
#	echo makeupDHCP >> /tmp/debug
	dumpDHCP $1 >> $interfaces
	return 0
}

makeupFallback() {
#	echo makeupFallback >> /tmp/debug
	dumpStatic fallback >> $interfaces
	return 0
}

dumpAdhoc() {
	echo -n "\
	pre-up iwpriv ra0 set NetworkType=Adhoc
	pre-up iwpriv ra0 set AuthMode=OPEN
	pre-up iwpriv ra0 set EncrypType=NONE
	$([ "$Channel_num" -ne 0 ] && echo -n "pre-up iwpriv ra0 set Channel=$Channel_num")
	pre-up iwpriv ra0 set SSID=$(quote encode "$ESSID_ms")
"
}

dumpAdhocWEP() {
	echo -n "\
	pre-up iwpriv ra0 set NetworkType=Adhoc
	pre-up iwpriv ra0 set AuthMode=WEPAUTO
	pre-up iwpriv ra0 set EncrypType=WEP
	pre-up iwpriv ra0 set DefaultKeyID="$WepKeyIndex_byte"
	$([ "$Channel_num" -ne 0 ] && echo -n "pre-up iwpriv ra0 set Channel=$Channel_num")
	pre-up iwpriv ra0 set SSID=$(quote encode "$ESSID_ms")
	pre-up iwpriv ra0 set Key"$WepKeyIndex_byte"=$(quote encode "$Key_ls")
"
}

dumpOpen() {
	[ "$SecMethod_byte" -eq 0 ] && dumpNoEncry || dumpWEP
}

dumpNoEncry() {
	echo -n "\
	pre-up iwpriv ra0 set NetworkType=Infra
	pre-up iwpriv ra0 set AuthMode=OPEN
	pre-up iwpriv ra0 set EncrypType=NONE
	pre-up iwpriv ra0 set SSID=$(quote encode "$ESSID_ms")
"
}

dumpWEP() {
	echo -n "\
	pre-up iwpriv ra0 set NetworkType=Infra
	pre-up iwpriv ra0 set AuthMode=WEPAUTO
	pre-up iwpriv ra0 set EncrypType=WEP
	pre-up iwpriv ra0 set DefaultKeyID="$WepKeyIndex_byte"
	pre-up iwpriv ra0 set SSID=$(quote encode "$ESSID_ms")
	pre-up iwpriv ra0 set Key"$WepKeyIndex_byte"=$(quote encode "$Key_ls")
"
}

dumpShared() {
	echo -n "\
	pre-up iwpriv ra0 set NetworkType=Infra
	pre-up iwpriv ra0 set AuthMode=WEPAUTO
	pre-up iwpriv ra0 set EncrypType=WEP
	pre-up iwpriv ra0 set DefaultKeyID="$WepKeyIndex_byte"
	pre-up iwpriv ra0 set SSID=$(quote encode "$ESSID_ms")
	pre-up iwpriv ra0 set Key"$WepKeyIndex_byte"=$(quote encode "$Key_ls")
"
}

dumpEncryMethod() {
	case $SecMethod_byte in
	0)
		echo NONE
		;;
	1)
		echo WEP
		;;
	2)
		echo TKIP
		;;
	3)
		echo AES
		;;
	*)
		echo NONE
		;;
	esac
}

dumpWPSPSK() {
	echo -n "\
	pre-up iwpriv ra0 set NetworkType=Infra
	pre-up iwpriv ra0 set AuthMode=WPAPSK
	pre-up iwpriv ra0 set EncrypType=$(dumpEncryMethod)
	pre-up iwpriv ra0 set SSID=$(quote encode "$ESSID_ms")
	pre-up iwpriv ra0 set WPAPSK=$(quote encode "$Key_ls")
	pre-up iwpriv ra0 set SSID=$(quote encode "$ESSID_ms")
"
}

dumpWPS2PSK() {
	echo -n "\
	pre-up iwpriv ra0 set NetworkType=Infra
	pre-up iwpriv ra0 set AuthMode=WPA2PSK
	pre-up iwpriv ra0 set EncrypType=$(dumpEncryMethod)
	pre-up iwpriv ra0 set SSID=$(quote encode "$ESSID_ms")
	pre-up iwpriv ra0 set WPAPSK=$(quote encode "$Key_ls")
	pre-up iwpriv ra0 set SSID=$(quote encode "$ESSID_ms")
"
}

dumpKey() {
	# WLAN
	echo -n "\
	pre-up ifconfig ra0 0.0.0.0 up  || true
	pre-up iwpriv ra0 set WirelessMode=$WirelessMode
	pre-up iwpriv ra0 set CountryRegion=$Region
" >> $interfaces

	# ad-hoc
	if [ "$Mode_byte" -eq 1 ]; then
		case $SecMethod_byte in
		1)
			dumpAdhocWEP
			;;
		*)
			dumpAdhoc
			;;
		esac
	else
		# infrastructure
		case $AuthMode_byte in
		0)
			dumpOpen
			;;
		1)
			dumpShared
			;;
		2)
			dumpWPSPSK
			;;
		5)
			dumpWPS2PSK
			;;
		*)
			dumpNoEncry
			;;
		esac
	fi >> $interfaces
}

makeupWireless() {
#	echo makeupWireless >> /tmp/debug
	[ "$DHCPEnable_byte" -eq 1 ] && makeupDHCP ra0 || makeupStatic ra0

#Only rt61 need to turn radio off before radio on
	probeRt61 && isRt61='y' || isRt61='n'
	if [ "$isRt61" = 'y' ]; then
	echo -n "\
	pre-up iwpriv ra0 radio_off
" >> $interfaces
	fi

	echo -n "\
	pre-up iwpriv ra0 radio_on
" >> $interfaces

	dumpKey
}

makeupPPPoE() {
	echo -n "\
iface $1:1 inet ppp
    provider dsl-provider
" >> $interfaces

	cat > /etc/ppp/options << EOM
lock
plugin rp-pppoe.so $median
EOM

	cat > /etc/ppp/pap-secrets << EOM
"$User_ms" * "$Password_ms"
EOM

	cat > /etc/ppp/chap-secrets << EOM
"$User_ms" * "$Password_ms"
EOM

	cat > /etc/ppp/peers/dsl-provider << EOM
noipdefault
defaultroute 
hide-password
noauth
persist
usepeerdns
user "$User_ms"
lcp-echo-interval 20
lcp-echo-failure 6
EOM

	cat > /etc/ppp/resolv.conf << EOM
EOM
}

#makeupLoopback() {
#	echo -n "\
#iface lo inet loopback
#" >> $interfaces
#}

makeupWired() {
#	echo makeupWired >> /tmp/debug
	[ "$DHCPEnable_byte" -eq 1 ] && makeupDHCP eth0 || makeupStatic eth0
}

makeupNoLink() {
#	echo makeupNoLink >> /tmp/debug
	makeupStatic eth0
}

makeupConfs() {
	# clean
	echo -n > $interfaces
	echo -n > $resolv

#makeupLoopback
	if [ "$senario" = 'wired' ]; then
		makeupWired
		if probeWireless; then
			if [ "$WLANEnable_byte" -eq 1 ]; then
				dumpKey
			fi
			iwpriv ra0 radio_off
		fi
	elif [ "$senario" = 'wireless' ]; then
		makeupWireless
	else
		makeupNoLink
	fi
	if [ "$PPPoEEnable_byte" -eq 1 ]; then
		makeupPPPoE $median
	fi
	makeupFallback
}

dhcpOK() {
	# static cannot be failed
	[ "$DHCPEnable_byte" -eq 0 ] && return 0
	ifconfig "$1" | grep -q 'inet addr:' && return 0 || return 1
}

start() {
	echo "==== Startting $daemon ===="
	probeRt61 && isRt61='y' || isRt61='n'
	eval $(dumpNetworkKeys | tdb get Network)
	eval $(dumpPPPoEKeys | tdb get PPPoE)
	PPPoEEnable_byte=$Enable_byte
	eval $(dumpWirelessKeys | tdb get Wireless)
	WLANEnable_byte=$Enable_byte
	ESSID_ms=`tdb get Wireless ESSID_ms`
	Key_ls=`tdb get Wireless Key_ls`
	eval $(pibinfo all)
	eval $(dumpHost | tdb get Host)

	# only when using driver/rt61_wps need this MapRegionKey
	[ "$isRt61" = 'y' ]  && [ "$Region" -ge 1 -a "$Region" -le 6 ] && Region=$(($Region + 1))

	# do some detection
	if probeLink || [ "$linkage" = "up" ]; then
		senario=wired
		median=eth0
	elif [ "$WLANEnable_byte" -eq 1 ] && probeWireless; then
		senario=wireless
		median=ra0
	else
		senario=nolink
		median=eth0
	fi
	export median

	# send linkup or linkdown to watchdog
	[ $senario = 'wired' ] &&
		send_cmd watchdog 636 > /dev/null 2> /dev/null || 
		send_cmd watchdog 637 > /dev/null 2> /dev/null

	# prepare interfaces and resolv.conf
	makeupConfs

	# action
#echo "== lo =="
#ifup lo

	echo "== $median =="
	ifup $median 
	dhcpOK $median || ifup -f $median=fallback
	hostname $CameraName_ms
	[ -x "/etc/rc.d/init.d/portForwarder.sh" ] && /etc/rc.d/init.d/portForwarder.sh reload
	[ -x "/etc/rc.d/init.d/godev.sh" ] && /etc/rc.d/init.d/godev.sh reload
	# avoid default.script restart upnp_av twice
	[ -x "/etc/rc.d/init.d/upnp_av.sh" ] && /etc/rc.d/init.d/upnp_av.sh start
	[ -x "/etc/rc.d/init.d/upnp_dev.sh" ] && /etc/rc.d/init.d/upnp_dev.sh restart
	[ -x "/etc/rc.d/init.d/zcip.sh" ] && /etc/rc.d/init.d/zcip.sh restart
	if [ "$PPPoEEnable_byte" -eq 1 ]; then
		echo "== $median:1 =="
		ifup $median:1
		pidof pppd > /tmp/pppd.pid
	else
		[ -x "/etc/rc.d/init.d/ddnsUpdater.sh" ] && /etc/rc.d/init.d/ddnsUpdater.sh reload
	fi

	if [ -x "/etc/rc.d/init.d/autod.sh" ]; then
		/etc/rc.d/init.d/autod.sh restart 
		/etc/rc.d/init.d/rtpd.sh restart
	fi
	if [ -x "/etc/rc.d/init.d/ar.sh" ]; then
		/etc/rc.d/init.d/ar.sh restart
	fi
	[ -x /opt/opt.local ] && /opt/opt.local start
	[ -x /etc/rc.d/init.d/lld2d.sh ] && /etc/rc.d/init.d/lld2d.sh start
	
	echo "==== ok ===="
}

probe() {
	ifconfig | grep -q "$1" && echo "$1 is up"
}

status() {
	echo "==== Status of $daemon ===="
	echo "== ifconfig =="
	ifconfig | grep in
	echo "== route =="
	route
	echo "== resolv.conf =="
	cat $resolv
	echo "==== ok ===="
}

mustDown() {
	ifconfig | grep -q "^$1" && ifconfig $1 down
}

down() {
	echo "== down $1 =="
	ifdown $1
	usleep 500000
	mustDown $1
}

disable() {
	echo "== disable $1 =="
	ifconfig $1 0.0.0.0 up
}

stop() {
	echo "==== Stopping $daemon ===="
	# send disassociated with ap to watchdog
	send_cmd watchdog 639 > /dev/null 2> /dev/null

	[ -x /etc/rc.d/init.d/lld2d.sh ] && /etc/rc.d/init.d/lld2d.sh stop
	[ -x /opt/opt.local ] && /opt/opt.local stop

	if grep -q 'ra0:1 *inet' $interfaces; then
		down ra0:1
	fi
	if grep -q 'eth0:1 *inet' $interfaces; then
		down eth0:1
	fi
	if grep -q 'eth0:0' /tmp/autoip > /dev/null 2> /dev/null; then
		down eth0:0
	fi
	if grep -q 'ra0:0' /tmp/autoip > /dev/null 2> /dev/null; then
		down ra0:0
	fi
	mustDown ra0 

	# avoid default.script restart upnp_av twice
	/etc/rc.d/init.d/upnp_av.sh stop
	
	# ra0 is need by site survey
	probeWireless && disable ra0

	# set wireless lan to Infrastructure mode
	iwpriv ra0  set NetworkType=Infra

	# make wireless lan connect to an inexistent Access Point
	iwconfig ra0 essid "$(pibinfo MacAddress)"

	# eth0 is need by ifplugd
	disable eth0

	# finally kill udhcpc, just in case
	killall udhcpc > /dev/null 2> /dev/null
	# finally kill pppd
	killall pppd > /dev/null 2> /dev/null

#if grep -q 'lo *inet' $interfaces; then
#	down lo
#else
#	mustDown lo
#fi
	rm -f /tmp/dhcpresult.log
	rm -f /tmp/pppd.pid
	echo "==== ok ===="
}

action=$1
linkage=$2
end=$3

[ "$end" = "" ] && [ "$action" != "" ] || showUsage

case $action in
	start)
		start
	;;
	stop)
		# stop may call return, instead of exit
		stop || exit 1
	;;
	restart)
		# in some case, web server need to be restart to proform normally.
		# send linkup or linkdown to watchdog
		[ "$linkage" = 'up' ] && 
			send_cmd watchdog 636 > /dev/null 2> /dev/null || 
			send_cmd watchdog 637 > /dev/null 2> /dev/null

		/etc/rc.d/init.d/lighttpd.sh stop
		/etc/rc.d/init.d/rtspd.sh stop
		/etc/rc.d/init.d/rtpd.sh stop
		stop
		echo
		start
		/etc/rc.d/init.d/rtpd.sh start
		/etc/rc.d/init.d/rtspd.sh start
		/etc/rc.d/init.d/lighttpd.sh start
	;;
	status)
		status
	;;
	*)
		showUsage
	;;
esac

exit 0
