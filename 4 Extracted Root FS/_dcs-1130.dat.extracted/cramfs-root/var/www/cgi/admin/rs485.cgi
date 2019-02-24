#!/bin/sh

dumpPTZ485Keys() {
        echo -n "\
BaudRate_byte
Enable_byte
Protocol_byte
DeviceID_byte
DataBit_byte
StopBit_byte
ParityBit_byte
"
}

dumpPTZ485Settings() {
        echo -n "\
BaudRate_byte=$tmpBaudRate_byte
Enable_byte=$tmpEnable_byte
Protocol_byte=$tmpProtocol_byte
DeviceID_byte=$tmpDeviceID_byte
DataBit_byte=$tmpDataBit_byte
StopBit_byte=$tmpStopBit_byte
ParityBit_byte=$tmpParityBit_byte
"
}

# get current setting from tdb
# format looks like VariableName_type
hasDevcie1_2=0
onGetSetting() {
	grep -q device1_2 /etc/extra_modules && hasDevcie1_2=1
	
	result=""
	eval $(dumpPTZ485Keys | tdb get PTZ485)
	tmpBaudRate_byte=$BaudRate_byte
	tmpEnable_byte=$Enable_byte
	tmpProtocol_byte=$Protocol_byte
	tmpDeviceID_byte=$DeviceID_byte
	tmpDataBit_byte=$DataBit_byte
	tmpStopBit_byte=$StopBit_byte
	tmpParityBit_byte=$ParityBit_byte
}

# make sure, ...
# 1. $result is set
# 2. variables in dumpXml are all set
onUpdateSetting() {
	result=ok
	[ "$rs485Enable" = "on" ] && rs485Enable=1
	[ "$rs485Enable" = "off" ] && rs485Enable=0
#	[ "$databits1" = "on" ] && databits1=7
#	[ "$databits1" = "off" ] && databits1=8
#	[ "$stopbit1" = "on" ] && stopbit1=1
#	[ "$stopbit1" = "off" ] && stopbit1=2
#	[ "$paritybit1" = "on" ] && paritybit1=0
#	[ "$paritybit2" = "on" ] && paritybit1=2
#	[ "$paritybit3" = "on" ] && paritybit1=1
	
        if applyPTZ485Settings; then
                dumpPTZ485Settings | tdb set PTZ485 || return 1	
		/etc/rc.d/init.d/ptz485d.sh restart >/dev/null 2>/dev/null
	fi
	result=ok
}

applyPTZ485Settings() {
	isChanged=1
	[ "$rs485Enable" ] && [ "$rs485Enable" != "$tmpEnable_byte" ] &&
        isChanged=0 && tmpEnable_byte=$rs485Enable
        [ "$protocol" ] && [ "$protocol" != "$tmpProtocol_byte" ] &&
        isChanged=0 && tmpProtocol_byte=$protocol
        [ "$id" ] && [ "$id" != "$tmpDeviceID_byte" ] &&
        isChanged=0 && tmpDeviceID_byte=$id
        [ "$baudrate" ] && [ "$baudrate" != "$tmpBaudRate_byte" ] &&
        isChanged=0 && tmpBaudRate_byte=$baudrate
        [ "$databits" ] && [ "$databits" != "$tmpDataBit_byte" ] &&
        isChanged=0 && tmpDataBit_byte=$databits
        [ "$stopbit" ] && [ "$stopbit" != "$tmpStopBit_byte" ] &&
        isChanged=0 && tmpStopBit_byte=$stopbit
        [ "$paritybit" ] && [ "$paritybit" != "$tmpParityBit_byte" ] &&
        isChanged=0 && tmpParityBit_byte=$paritybit
	
	return $isChanged
}

onDumpXml() {
	xmlBegin rs485.xsl advanced-left.lang rs485.lang
	resultTag $result
	configBegin
	beginTag 'rs485'
		tag 'device1_2' "$hasDevcie1_2"
		tag 'rs485Enable' "$tmpEnable_byte"
		tag 'protocol' "$tmpProtocol_byte"
		tag 'id' "$tmpDeviceID_byte"
		tag 'baudrate' "$tmpBaudRate_byte"
		tag 'databits1' "$tmpDataBit_byte"
		tag 'stopbit1' "$tmpStopBit_byte"
		tag 'paritybit1' "$tmpParityBit_byte"
	endTag 'rs485'
	configEnd
	xmlEnd
}

. ../../xmlFunctions.sh
. ../../cgiMain.sh

