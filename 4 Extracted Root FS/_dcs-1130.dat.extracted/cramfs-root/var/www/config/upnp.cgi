#!/bin/sh
dumpUPnPKeys() {
	echo "Enable_byte PortForward_byte"
}

dumpUPnPSettings() {
        echo "\
	Enable_byte=$Enable_byte
	PortForward_byte=$PortForward_byte"
}

onUpdateUPnP() {
	status=400
	if [ "$upnpav" ]; then
		checkVal1orVal2 "$upnpav" "on" "off" || return 1
		if [ "$upnpav" = "on" ]; then
			if [ "$Enable_byte" = "0" ]; then
                                Enable_byte="1"
                                let var_restart++
                        fi
		elif [ "$upnpav" = "off" ]; then
			if [ "$Enable_byte" = "1" ]; then
                                Enable_byte="0"
                                let var_restart++
                        fi
		fi
	fi
	if [ "$upnpcp" ]; then
		checkVal1orVal2 "$upnpcp" "on" "off" || return 1
		if [ "$upnpcp" = "on" ]; then
			if [ "$PortForward_byte" = "0" ]; then
				PortForward_byte="1"
				let var_restart++
			fi
		elif [ "$upnpcp" = "off" ]; then
			if [ "$PortForward_byte" = "1" ]; then
				PortForward_byte="0"
				let var_restart++
			fi
		fi
	fi
	if [ $var_restart -gt 0 ]; then
		dumpUPnPSettings | tdb set UPnP
	fi
	status=200
}

###################################
# get current setting from tdb
# format looks like VariableName_type
onGetSetting() {
	eval $(dumpUPnPKeys | tdb get UPnP)
	if [ "$Enable_byte" = "1" ]; then
		upnpav="on"
	else
		upnpav="off"
	fi
	if [ "$PortForward_byte" = "1" ]; then
		upnpcp="on"
	else
		upnpcp="off"
	fi
	status="200"
}

# make sure, ...
# 1. $result is set
# 2. variables in dumpXml are all set
onUpdateSetting() {
	var_restart=0
	onUpdateUPnP
}

onDumpInf() {
	if [ "$status" = "200" ]; then
		pair	'upnpav'	"$upnpav"
		pair	'upnpcp'	"$upnpcp"
		infOK
		if [ $var_restart -gt 0 ]; then
			/etc/rc.d/init.d/upnp_av.sh restart >/dev/null 2>/dev/null
			/etc/rc.d/init.d/portForwarder.sh reload >/dev/null 2>/dev/null
		fi
	else
		infFail "$status"
	fi
}

# used in cgi-bin , use...
. ../infMain.sh
