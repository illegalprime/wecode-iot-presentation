#!/bin/sh

# refer the eng/admin/reset.cgi

# get current setting from tdb
# format looks like VariableName_type
onGetSetting() {
	result=""
}

checkSetting() {
	status="200"
	result=""
	[ "$reset" = "go" ] || return 1
}

saveSetting() {
	result=resetFail
	/etc/rc.d/init.d/services.sh stop > /dev/null 2> /dev/null
	factoryReset > /dev/null 2> /dev/null
	echo "reboot" > /tmp/agent
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
	result=resetOK
}

onDumpInf() {
	status="200"
	if [ "$result" = "resetOK" ]; then
                pair    'reset'      "yes"
        else
                pair    'reset'      "fail"
        fi
	infOK
}

. ../infMain.sh

