#!/bin/sh

delayReboot=5

# get current setting from tdb
# format looks like VariableName_type
onGetSetting() {
	result=""
	status="200"
}

checkSetting() {
	result=""
	[ "$reboot" = "go" ] || return 1
}

saveSetting() {
	result=rebootFail
	(sleep $delayReboot && /sbin/reboot) > /dev/null 2> /dev/null &
}

# make sure, ...
# 1. $result is set
# 2. variables in dumpXml are all set
onUpdateSetting() {
	# 1. check parameters
	if ! checkSetting; then
		return 1
	fi

	# 2. save to NOR flash
	if ! saveSetting; then
		return 1
	fi

	# 3. make it sync
	result=rebootOK
}

onDumpInf() {
	if [ "$result" = "rebootOK" ]; then 
		pair    'reboot'      "yes"
	else 
		pair    'reboot'      "fail"
	fi
	infOK
}

. ../infMain.sh

