#!/bin/sh
dumpHTTPKeys() {
	echo "Port_num"
}

onUpdateHTTP() {
	if [ "$httpport" ]; then
		echo "Port_num=$httpport" | tdb set HTTPServer
		let var_restart++
	fi
}

###################################

onPairHTTP() {
	eval $(dumpHTTPKeys | tdb get HTTPServer)
	pair 'httpport'	"$Port_num"
}

###################################
# get current setting from tdb
# format looks like VariableName_type
onGetSetting() {
	var_restart=0
	status="200"
}

# make sure, ...
# 1. $result is set
# 2. variables in dumpXml are all set
onUpdateSetting() {
	if [ "$httpport" -ge "1" -a "$httpport" -le "65535" ]; then
		onUpdateHTTP
		status="200"
	else
		echo "Invalid httpport value !"
		status=400
	fi
}

onDumpInf() {
	if [ "$status" = "200" ]; then
		onPairHTTP
		infOK
		if [ $var_restart -gt 0 ]; then
			/etc/rc.d/init.d/lighttpd.sh restart >/dev/null 2>/dev/null
		fi
	else
		infFail "$status"
	fi
}

# used in cgi-bin , use...
. ../infMain.sh
