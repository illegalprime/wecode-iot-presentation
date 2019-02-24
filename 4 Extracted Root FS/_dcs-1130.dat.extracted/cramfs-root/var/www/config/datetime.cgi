#!/bin/sh

dumpNTPClientKeys() {
	echo Enable_byte Server_ms
}

dumpNTPClientSettings() {
        echo -n "\
Enable_byte=$method
Server_ms=$timeserver
"
}

dumpTimeZoneKeys() {
	echo -n "\
Index_byte
EnableDST_byte
AutoDST_byte
Offset_ss
StartTime_ss
EndTime_ss
"
}

dumpTimeZoneSettings() {
	echo -n "\
Index_byte=$timezone
EnableDST_byte=$var_dstenable
AutoDST_byte=$var_dstauto
Offset_ss=$offset
StartTime_ss=$starttime
EndTime_ss=$stoptime
"
}

checkOffset() {
	offsetHour=$(echo $offset | cut -d':' -f1)
	PlusOrMinus=$(echo $offsetHour | cut -c1 )
	checkVal1orVal2 "$PlusOrMinus" "+" "-"
	if [ $? ]; then
		offsetHour=$(echo $offsetHour | cut -c2- )
                checkRange "$offsetHour" 0 2 || return 1
	else
		checkRange "$offsetHour" 0 2 || return 1
	fi
	offsetMin=$(echo $offset | cut -d':' -f2)
	checkVal1orVal2 "$offsetMin" "00" "30" || return 1
	return 0
}

checkStartStopTime() {
	sDate=$(echo $1 | cut -d'/' -f1)
	sTime=$(echo $1 | cut -d'/' -f2)
	[ -z "$sDate" ] && return 1
	[ -z "$sTime" ] && return 1
	sMonth=$(echo $sDate | cut -d'.' -f1)
	checkRange "$sMonth" 1 12 || return 1
	sWeek=$(echo $sDate | cut -d'.' -f2)
	checkRange "$sWeek" 1 5 || return 1
	sWeekday=$(echo $sDate | cut -d'.' -f3)
	checkRange "$sWeekday" 0 6 || return 1
	sHour=$(echo $sTime | cut -d':' -f1)
	checkRange "$sHour" 0 23 || return 1
	sMin=$(echo $sTime | cut -d':' -f2)
	checkRange "$sMin" 0 59 || return 1
	sSec=$(echo $sTime | cut -d':' -f3)
	checkRange "$sSec" 0 59 || return 1
	return 0
}

checkSetting() {
	checkRange "$method" 0 2 || return 1
	checkRange "$timezone" 1 83 || return 1
	checkVal1orVal2 "$dstenable" "yes" "no" || return 1
	checkVal1orVal2 "$dstauto" "yes" "no" || return 1
	if [ -n "$date" ]; then
		# parse/check format and value
		var_year=$(echo $date | cut -d'-' -f1)
		var_month=$(echo $date | cut -d'-' -f2)
		var_day=$(echo $date | cut -d'-' -f3)
		checkRange "$var_year" 1970 2500 || return 1
		checkRange "$var_month" 1 12 || return 1
		checkRange "$var_day" 1 31 || return 1
	fi
	if [ -n "$time" ]; then
		# parse/check format and value
		var_hour=$(echo $time | cut -d':' -f1)
		var_minute=$(echo $time | cut -d':' -f2)
		var_second=$(echo $time | cut -d':' -f3)
		checkRange "$var_hour" 0 23 || return 1
		checkRange "$var_minute" 0 59 || return 1
		checkRange "$var_second" 0 59 || return 1
	fi
	checkOffset || return 1
	if [ "$dstenable" = "yes" -a "$dstauto" = "no" ]; then
		checkStartStopTime "$starttime" || return 1
		checkStartStopTime "$stoptime" || return 1
	fi
	return 0
}

# get current setting from tdb
# format looks like VariableName_type
getSettings() {
	eval $(dumpNTPClientKeys | tdb get NTPClient)
	eval $(dumpTimeZoneKeys | tdb get TimeZone)
	[ $EnableDST_byte -eq 0 ] && dstenable="no"
	[ $EnableDST_byte -eq 1 ] && dstenable="yes"
	[ $AutoDST_byte -eq 0 ] && dstauto="no"
	[ $AutoDST_byte -eq 1 ] && dstauto="yes"
}

onGetSetting() {
	getSettings
	status="200"
}

# make sure, ...
# 1. $result is set
# 2. variables in dumpXml are all set
onUpdateSetting() {
	status=200
	debuglog "onUpdateSetting():"
	debuglog "method = $method"
	debuglog "timeserver = $timeserver"
	debuglog "date = $date"
	debuglog "time = $time"
	debuglog "dstenable = $dstenable"
	debuglog "dstauto = $dstauto"
	debuglog "offset = $offset"
	debuglog "starttime = $starttime"
	debuglog "stoptime = $stoptime"
	
#	checkSetting > /dev/null 2> /dev/null || return 1
	checkSetting > /dev/null 2> /dev/null
	if [ "$?" = "1" ]; then
		debuglog "The checkSetting return 1"
		status=400
		return 1
	fi
	
	#Time Zone
	if [ "$dstenable" ]; then
		[ "$dstenable" = "yes" ] && var_dstenable=1 || var_dstenable=0
	else
		var_dstenable="$EnableDST_byte"
	fi
	if [ "$dstauto" ]; then
		[ "$dstauto" = "yes" ] && var_dstauto=1 || var_dstauto=0
	else
		var_dstauto="$AutoDST_byte"
	fi
	[ "$offset" ] || offset="$Offset_ss"
	[ "$starttime" ] || starttime="$StartTime_ss"
	[ "$stoptime" ] || stoptime="$EndTime_ss"

	#daylight saving time	
	if [ "$timezone" != "$Index_byte" -o "$var_dstenable" != "$EnableDST_byte" -o "$var_dstauto" != "$AutoDST_byte" -o "$offset" != "$Offset_ss" -o "$starttime" != "$StartTime_ss" -o "$stoptime" != "$EndTime_ss" ]; then
		if [ "$timezone" != "$Index_byte" ]; then
			echo -ne "Index_byte=$timezone" | tdb set TimeZone
			/etc/rc.d/init.d/tz_dst.sh start > /dev/null 2> /dev/null
			Index_byte=$timezone
		fi
		if [ "$var_dstenable" != "$EnableDST_byte" ]; then
			if [ "$var_dstenable" = "1" ]; then
				if [ "$var_dstauto" = "1" ]; then
					echo -n "\
						EnableDST_byte=1
						AutoDST_byte=1" | tdb set TimeZone
				else
					dumpTimeZoneSettings | tdb set TimeZone
					Offset_ss=$offset
					StartTime_ss=$starttime
					EndTime_ss=$stoptime
				fi
			else
				#Disable daylight saving time. No changing others setting.
				echo -n "EnableDST_byte=0" | tdb set TimeZone
				if [ "$AutoDST_byte" = "1" ]; then
					dstauto="yes"
				else
					dstauto="no"
				fi
			fi
			/etc/rc.d/init.d/tz_dst.sh start > /dev/null 2> /dev/null
		else
			#If daylight saving time is disabled. No changing others setting.
			if [ "$var_dstenable" = "1" ]; then
				if [ "$var_dstauto" = "1" ]; then
					#No changing others setting, if var_dstauto equals 1.
					echo -n "AutoDST_byte=1" | tdb set TimeZone
				else
					dumpTimeZoneSettings | tdb set TimeZone
					Offset_ss=$offset
                                        StartTime_ss=$starttime
                                        EndTime_ss=$stoptime
				fi
				/etc/rc.d/init.d/tz_dst.sh start > /dev/null 2> /dev/null
			else
				if [ "$AutoDST_byte" = "1" ]; then
                                        dstauto="yes"
                                else
                                        dstauto="no"
                                fi
			fi
		fi
	fi
	
	#disable/enable NTP or manual setting date and time
	if [ "$method" = "1" ]; then
		#enable NTP
		[ "$timeserver" ] || timeserver="$Server_ms"
		if [ "$timeserver" ]; then
			dumpNTPClientSettings | tdb set NTPClient
			/etc/rc.d/init.d/ntpd.sh restart >/dev/null 2>/dev/null
			Enable_byte=$method
			Server_ms=$timeserver
		else
			status=400
		fi
	elif [ "$method" = "2" ] && [ "$date" != "" ] && [ "$time" != "" ]; then	
		echo -ne "Enable_byte=0" | tdb set NTPClient
		/etc/rc.d/init.d/ntpd.sh restart >/dev/null 2>/dev/null
		echo "$var_month$var_day$var_hour$var_minute$var_year.$var_second"
		date -s $var_month$var_day$var_hour$var_minute$var_year.$var_second
		#update date and time to hwclock
		/sbin/hwclock -w -u
		Enable_byte=0
	elif [ "$method" = "0" -a "$Enable_byte" -eq 1 ]; then
		echo -ne "Enable_byte=0" | tdb set NTPClient
		/etc/rc.d/init.d/ntpd.sh restart >/dev/null 2>/dev/null
		Enable_byte=$method
	fi
}

onDumpInf() {
	if [ "$status" = "200" ]; then
		pair	'method'	"$Enable_byte"
		pair	'timeserver'	"$Server_ms"
		pair    'timezone'      "$Index_byte"
		pair	'date'		"$(date +%F)"
		pair	'time'		"$(date +%T)"
		pair	'dstenable'	"$dstenable"
		pair	'dstauto'	"$dstauto"
		pair	'offset'	"$Offset_ss"
		pair	'starttime'	"$StartTime_ss"
		pair	'stoptime'	"$EndTime_ss"
		infOK
	else
		echo "status = $status"
		infFail "$status"
	fi
}

# used in cgi-bin , use...
. ../infMain.sh
