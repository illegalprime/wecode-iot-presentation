#!/bin/sh

# get current setting from tdb
# format looks like VariableName_type
onGetSetting() {
	result=""
}

checkSetting() {
	[ "$export" = "true" ] || return 1
}

# make sure, ...
# 1. $result is set
# 2. variables in dumpXml are all set
onUpdateSetting() {
	# 1. check parameters
	if ! checkSetting; then
		return 1
	fi

	# 3. make it sync
	result=ok
}

reportStatus() {
	echo -ne "\
Status: $1\r
\r
"
	exit 0
}

onDumpXml() {
	[ "$result" = "ok" ] || reportStatus 400 
	echo -ne "\
Content-Type: text/plain\r
Content-Disposition: attachment; filename=log.txt\r
Content-Description: exported log file\r
\r
"

	# dump log
	/bin/send_cmd logd 402 2> /dev/null
	[ $? -eq 0 ] || reportStatus 501
}

. ../../cgiMain.sh

