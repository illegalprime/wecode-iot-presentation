#!/bin/sh

onGetSetting() 
{
	eval $(pibinfo all) || return 1
	mac=$MacAddress
	region=$Region
	hwBoard=$HWBoard
	hwVersion=$HWVersion

	status=200
}


applySettings()
{
	isChanged=1
	if [ "$mac" -a "$mac" != "$MacAddress" ]; then
		isChanged=0
		MacAddress=$mac
	fi
	if [ "$region" -a "$region" != "$Region" ]; then
		isChanged=0
		Region=$region
	fi
	if [ "$hwBoard" -a "$hwBoard" != "$HWBoard" ]; then
		isChanged=0
		HWBoard=$hwBoard
	fi
	if [ "$hwVersion" -a "$hwVersion" != "$HWVersion" ]; then
		isChanged=0
		HWVersion=$hwVersion
	fi

	return $isChanged
}

dumpPibSettings() {
	echo -n "
MacAddress=$MacAddress
Region=$Region
HWBoard=$HWBoard
HWVersion=$HWVersion
"
}

# make sure, ...
# 1. $result is set
# 2. variables in dumpXml are all set
onUpdateSetting() 
{
	status="501"
	if applySettings; then
		dumpPibSettings | pibinfo set || return 1
		eval $(pibinfo all) || return 1
	fi

	status="200"
}

onDumpInf() {
	if [ "$status" = "200" ]; then
		pair 'hwBoard' "$HWBoard"
		pair 'hwVersion' "$HWVersion"
		pair 'sensor' "$Sensor"
		pair 'sensorCaps' "$SensorCaps"
		pair 'mac' "$MacAddress"
		pair 'region' "$Region"
		infOK
	else
		infFail "$status"
	fi
}

# used in cgi-bin , use...
. ../../infMain.sh
