#!/bin/sh

daemon=motiond
PATH=$PATH:/sbin

die() {
	echo $@
	exit 1
}

showUsage() {
	die "$0 {start|stop|restart|status} [prefix]"
}

# tinydb setting
# [MotionDct]
# Enable_byte: enable motion detection
# Region1U_ls: upper half of region one
# Region1L_ls: lower half of region one
# Sense1_byte: sensitivity of region one
# Region2U_ls
# Region2L_ls
# Sense2_byte
# Region3U_ls
# Region3L_ls
# Sense3_byte
# MedianStep_num
# DeviationStep_num
# DeltaAmp_num
dumpKeys() {
# TODO
	echo "Enable_byte 
Region1U_ls Region1L_ls Sense1_byte
Region2U_ls Region2L_ls Sense2_byte 
Region3U_ls Region3L_ls Sense3_byte
MedianStep_num DeviationStep_num DeltaAmp_num"
}

importSettings() {
	eval $(dumpKeys | tdb get MotionDct)
	enable=$Enable_byte
	export MD_REGION1=$Region1U_ls$Region1L_ls
	export MD_SENSE1=$Sense1_byte
	export MD_REGION2=$Region2U_ls$Region2L_ls
	export MD_SENSE2=$Sense2_byte
	export MD_REGION3=$Region3U_ls$Region3L_ls
	export MD_SENSE3=$Sense3_byte
	export MD_MEDIAN_STEP=$MedianStep_num
	export MD_DEVIATION_STEP=$DeviationStep_num
	export MD_DELTA_AMP=$DeltaAmp_num
}

start() {
	! pids=$(pidof $daemon) || die "$daemon($pids) is already running."

	echo -n "Startting $daemon... "
	[ -x $binary ] || die "$binary is not a valid application"
	importSettings

	if [ $enable -eq 0 ]; then
		echo "disabled."
	else
		eval $(image_controller status)
		if [ "$DISPLAY_SYSTEM" = "SXGA" ]; then
			echo "disabled (SXGA)."
		else
			export LD_LIBRARY_PATH=$prefix/lib
			if [ "$1" = 'nowait' ]; then
				echo "nowait" > /tmp/debug
				$binary > /dev/null 2> /dev/null &
			else
				echo "wait ptz" > /tmp/debug
				( sleep 30 && $binary > /dev/null 2> /dev/null & ) &
			fi
			echo "ok."
		fi
	fi
}

status() {
	echo -n "$daemon"
	pids=$(pidof $daemon) && echo "($pids) is running." || echo " is stop."
}

stop() {
	pids=$(pidof $daemon) || { echo "$daemon is not running." && return 1; }
	echo -n "Stopping $daemon... "
	kill $(echo $pids | cut -d' ' -f1)
	sleep 1
	pids=$(pidof $daemon) && killall -9 $daemon && sleep 1 && pids=$(pidof $daemon) && die "ng." || echo "ok."
}

action=$1
prefix=$2
end=$3

[ "$end" = "" ] && [ "$action" != "" ] || showUsage
[ "$prefix" = "" ] || [ -d "$prefix" ] || die "$prefix is not a valid directory"

binary=$prefix/sbin/$daemon

case $action in
	start)
		start
	;;
	stop)
		# stop may call return, instead of exit
		stop || exit 1
	;;
	restart)
		stop
		start nowait
	;;
	status)
		status
	;;
	reload)
		reload
	;;
	*)
		showUsage
	;;
esac

exit 0
