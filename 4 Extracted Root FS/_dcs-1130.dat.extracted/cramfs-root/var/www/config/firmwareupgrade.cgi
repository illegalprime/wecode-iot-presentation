#!/bin/sh

# get current setting from tdb
# format looks like VariableName_type

dumpSystemKeys()  {
        echo -n "\
Version_ss
Vendor_ms
OEM_ms
Model_ss
ProdNumber_ss
"
}

onGetSetting() {
#	echo step001
	eval $(dumpSystemKeys | tdb get System) || return 1
#	echo step002
	eval $(pibinfo all) || return 1
#	echo step003
	version=$Version_ss
	vendor=$Vendor_ms
	oem=$OEM_ms
	model=$Model_ss
	product=$ProdNumber_ss
	hwBoard=$HWBoard
	hwVersion=$HWVersion
	desc=""
	result=""
}

getWeight() {
	major=$(echo "$1" | cut -d'.' -f1) || major=0
	minor=$(echo "$1" | cut -d'.' -f2) || minor=0
	sub=$(echo "$1" | cut -d'.' -f3 | cut -d'-' -f1) || sub=0
	echo $(( $major*100 + $minor*10 + $sub ))
}

checkSetting() {
	result=uploadFail
	[ "$UPLOAD" != "" ] || return 1
	[ -f $UPLOAD ] || return 1
	chmod u+x $UPLOAD
	result=examFail
	$UPLOAD exam || return 1
	result=infoFail
	eval $($UPLOAD info) || return 1
	version=$VERSION
	vendor=$VENDOR
	oem=$OEM
	model=$MODEL
	product=$PRODUCT
	desc=$DESCRIPT
	hwBoard=$HWBOARD
	hwVersion=$HWVERSION
	result=invalidImage
	
	# at least SIGN, APP, vendor must be the same
	[ "$MECH_SIGN" = "QPAT" ] || return 1
	[ "$MECH_APP" = "doUpdate" ] || return 1
	[ "$VENDOR" = "$Vendor_ms" ] || return 1

	# all other scenarios, check all
	[ "$HWBOARD" = "$HWBoard" ] || return 1
	[ "$HWMAJOR" = "$HWMajor" ] || return 1
	[ "$OEM" = "$OEM_ms" ] || return 1
	[ "$MODEL" = "$Model_ss" ] || return 1
	now=$(getWeight "$Version_ss" 2> /dev/null) || return 1
	then=$(getWeight "$VERSION" 2> /dev/null) || return 1
	[ "$then" -ge "$now" ] || return 1
	return 0
}

saveSetting() {
	result=saveFail
	$UPLOAD update || return 1
	return 0
}

# make sure, ...
# 1. $result is set
# 2. variables in dumpXml are all set
onUpdateSetting() {
	# 1. check parameters
	if ! checkSetting; then
		return 1
	fi
	# 1.9, make language files into cache, before mess up flash.
	cat tools_default.xsl frame.lang tools-left.lang tools_default.lang > /dev/null 2> /dev/null
	# 2. save to NOR flash
	if ! saveSetting; then
		return 1
	fi

	# 3. make it sync
	result=updateOK
}

onDumpInf() {
	status="200"
	if [ "$result" = "updateOK" ]; then
                pair    'upgrade'      "ok"
        else
                pair    'upgrade'      "fail"
        fi
	infOK
}

scenario=$(basename $0 | cut -d'.' -f1)

. ../infMain.sh

