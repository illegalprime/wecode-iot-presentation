#!/bin/sh

# get current setting from tdb
# format looks like VariableName_type
onGetSetting() {
	login=1

	status="200"
}

# make sure, ...
# 1. $result is set
# 2. variables in dumpXml are all set
onUpdateSetting() {
	status="200"
}

onDumpInf() {
	if [ "$status" = "200" ]; then
		pair 'login' "$login"
		infOK
	else
		infFail "$status"
	fi
}

# used in cgi-bin , use...
. ../infMain.sh
