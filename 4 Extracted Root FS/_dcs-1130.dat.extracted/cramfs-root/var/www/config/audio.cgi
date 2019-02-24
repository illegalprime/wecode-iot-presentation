#!/bin/sh

onGetSetting() {
	status="400"
}

onUpdateSetting() {
	status="400"
	checkRange "$profileid" 1 1 || return
	if [ "$codec" ]; then
		status="404"
		return
	else
		codec="PCM"
	fi
	if [ "$samplerate" ]; then
		status="404"
		return
	else
		samplerate="8"
	fi
	if [ "$channel" ]; then
		status="404"
		return
	else
		channel="1"
	fi
	if [ "$bitrate" ]; then
		status="404"
		return
	else
		bitrate="128"
	fi
	status="200"
}

onDumpInf() {
	if [ "$status" = "200" ]; then
		pair	'profileid'	"$profileid"
		pair	'codec'		"$codec"
		pair	'samplerate'	"$samplerate"
		pair	'channel'	"$channel"
		pair	'bitrate'	"$bitrate"
		infOK
	else
		infFail $status
	fi
}

# used in cgi-bin , use...
. ../infMain.sh

