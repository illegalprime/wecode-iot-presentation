#!/bin/sh

# get current setting from tdb
# format looks like VariableName_type
onGetSetting() {
	result=""
}

# make sure, ...
# 1. $result is set
# 2. variables in dumpXml are all set
onUpdateSetting() {
	result=ok
}

onDumpXml() {
	xmlBegin support_men.xsl support-left.lang support_men.lang
	resultTag $result
	configBegin
	configEnd
	xmlEnd
}

. ../../xmlFunctions.sh
. ../../cgiMain.sh

