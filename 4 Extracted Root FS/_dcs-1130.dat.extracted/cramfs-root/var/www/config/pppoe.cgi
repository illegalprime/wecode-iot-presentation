#!/bin/sh

dumpPPPoEKeys() {
	echo "Enable_byte User_ms Password_ms"
}

dumpPPPoESettings() {
        echo "\
Enable_byte=$Enable_byte
User_ms=$User_ms
Password_ms=$Password_ms"
}

onUpdatePPPoE() {
	status=400
	if [ "$pppoe" ]; then
		checkVal1orVal2 "$pppoe" "on" "off" || return 1
		if [ "$pppoe" = "on" ]; then
			if [ "$Enable_byte" = "0" ]; then
				Enable_byte="1"
				let var_restart++
			fi
		else
			if [ "$Enable_byte" = "1" ]; then
				Enable_byte="0"
				let var_restart++
			fi
		fi
	fi
	if [ "$user" ] && [ "$user" != "$User_ms" ]; then
		User_ms=$user
		let var_restart++
	fi
	if [ "$pass" ]; then
		password=$(base64 de $pass)
		if [ "$password" != "$Password_ms" ]; then
			Password_ms=$password
			let var_restart++
		fi
	fi
	password=$pass
	if [ $var_restart -gt 0 ]; then
		dumpPPPoESettings | tdb set $1
        fi
	status=200
}

###################################
# get current setting from tdb
# format looks like VariableName_type
onGetSetting() {
	eval $(dumpPPPoEKeys | tdb get PPPoE)
	if [ "$Enable_byte" = "1" ]; then
		pppoe="on"
	else
		pppoe="off"
	fi
	password=$(base64 en $Password_ms)
	status="200"
}

# make sure, ...
# 1. $result is set
# 2. variables in dumpXml are all set
onUpdateSetting() {
	var_restart=0
	onUpdatePPPoE PPPoE
}

onDumpInf() {
	if [ "$status" = "200" ]; then
		pair    'pppoe'         "$pppoe"
		pair    'user'          "$User_ms"
		pair    'pass'          "$password"
		infOK
		if [ $var_restart -gt 0 ]; then
			/etc/rc.d/init.d/network.sh restart >/dev/null 2>/dev/null
		fi
	else
		infFail "$status"
	fi
}

# used in cgi-bin , use...
. ../infMain.sh
