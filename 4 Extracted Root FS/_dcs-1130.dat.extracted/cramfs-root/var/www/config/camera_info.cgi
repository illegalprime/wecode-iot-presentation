#!/bin/sh

dumpHostKeys() {
	echo -n "\
CameraName_ms 
Location_ms
"
}

dumpHostSettings() {
	echo -n "\
CameraName_ms=$CameraName_ms
Location_ms=$Location_ms
"
}

# get current setting from tdb
# format looks like VariableName_type
onGetSetting() {
	eval $(dumpHostKeys | tdb get Host)
	status="200"
}

# make sure, ...
# 1. $result is set
# 2. variables in dumpXml are all set
onUpdateSetting() {
	status=400
	var_restart=0
	checkStringLen "$name" 60 || return 1
	checkStringLen "$location" 60 || return 1
	if [ "$name" != "$CameraName_ms" ]; then
		CameraName_ms=$name
		let var_restart++
	fi
	if [ "$location" != "$Location_ms" ]; then
		Location_ms=$location
		let var_restart++
	fi
	if [ $var_restart -gt 0 ]; then
		dumpHostSettings | tdb set Host
        fi
	status="200"
}

onDumpInf() {
	if [ "$status" = "200" ]; then
		pair	'name'		"$CameraName_ms"
		pair	'location'	"$Location_ms"
		infOK
	else
		infFail "$status"
	fi
}

# used in cgi-bin , use...
. ../infMain.sh
