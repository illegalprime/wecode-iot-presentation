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
	result="ok"
	if [ "$command" = "on" ]; then
	    /usr/sbin/telnetd 1>/dev/null 2>/dev/null
	else
	    killall telnetd 1>/dev/null 2>/dev/null
	fi
}

onDumpXml() {
	xmlBegin index.xsl home-left.lang index.lang
	resultTag $result
	xmlEnd
}

scenario=$(basename $0 | cut -d'.' -f1)

. ../../xmlFunctions.sh
. ../../cgiMain.sh

