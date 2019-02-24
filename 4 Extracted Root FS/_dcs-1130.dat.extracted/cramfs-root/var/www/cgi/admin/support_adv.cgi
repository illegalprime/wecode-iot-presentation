#!/bin/sh

# get current setting from tdb
# format looks like VariableName_type
hasDevcie1_0=0
onGetSetting() {
	grep -q device1_0 /etc/extra_modules && hasDevcie1_0=1 
	result="underConstruction"
}

# make sure, ...
# 1. $result is set
# 2. variables in dumpXml are all set
onUpdateSetting() {
	result=ok
}

onDumpXml() {
	xmlBegin support_adv.xsl support-left.lang support_adv.lang
	resultTag $result
	configBegin
	beginTag 'extras'
	tag 'device1_0' "$hasDevcie1_0"
	endTag 'extras'
	configEnd
	xmlEnd
}

. ../../xmlFunctions.sh
. ../../cgiMain.sh

