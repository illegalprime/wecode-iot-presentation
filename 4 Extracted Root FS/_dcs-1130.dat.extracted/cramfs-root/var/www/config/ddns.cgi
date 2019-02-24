#!/bin/sh

dumpDDNSKeys() {
        echo "Enable_byte Provider_ms Providers_ms User_ms Password_ms UserHost_ms"
}

dumpDDNSSettings() {
        echo "\
Enable_byte=$Enable_byte
Provider_ms=$Provider_ms
Providers_ms=$Providers_ms
User_ms=$User_ms
Password_ms=$Password_ms
UserHost_ms=$UserHost_ms"
}

onUpdateDDNS() {
	status=400
	if [ "$ddns" ]; then
		checkVal1orVal2 "$ddns" "on" "off" || return 1
		if [ "$ddns" = "on" ]; then
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
	if [ "$provider" ] && [ "$provider" != "$Provider_ms" ]; then
		IsStrInStringList $Providers_ms "," $provider || return 1
		Provider_ms=$provider
		let var_restart++
	fi
	if [ "$host" ] && [ "$host" != "$UserHost_ms" ]; then
		UserHost_ms=$host
		let var_restart++
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
                dumpDDNSSettings | tdb set DDNS
        fi
	status=200
}

###################################
# get current setting from tdb
# format looks like VariableName_type
onGetSetting() {
	eval $(dumpDDNSKeys | tdb get DDNS)
	if [ "$Enable_byte" = "1" ]; then
		ddns="on"
	else
		ddns="off"
	fi
	password=$(base64 en $Password_ms)
	status="200"
}

# make sure, ...
# 1. $result is set
# 2. variables in dumpXml are all set
onUpdateSetting() {
	var_restart=0
	onUpdateDDNS DDNS
	if [ $var_restart -gt 0 ]; then
		/etc/rc.d/init.d/ddns.sh restart >/dev/null 2>/dev/null &
	fi
}

onDumpInf() {
	if [ "$status" = "200" ]; then
		pair	'ddns'		"$ddns"
		pair	'provider'	"$Provider_ms"
		pair	'host'		"$UserHost_ms"
		pair	'user'		"$User_ms"
		pair	'pass'		"$password"
		infOK
	else
		infFail "$status"
	fi
}

# used in cgi-bin , use...
. ../infMain.sh
