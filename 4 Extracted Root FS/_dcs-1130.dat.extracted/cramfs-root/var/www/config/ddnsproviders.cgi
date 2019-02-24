#!/bin/sh

###################################
# get current setting from tdb
# format looks like VariableName_type
onGetSetting() {
	providers=$(tdb get DDNS Providers_ms)
	getStringListNum $providers ","
	num=$?
	status="200"
}

# make sure, ...
# 1. $result is set
# 2. variables in dumpXml are all set
onUpdateSetting() {
	status="404"
}

onDumpInf() {
	if [ "$status" = "200" ]; then
		pair	'num'		"$num"
		pair	'providers'	"$providers"
		infOK
	else
		infFail "$status"
	fi
}

# used in cgi-bin , use...
. ../infMain.sh
