#!/bin/sh

daemon=acd
PATH=$PATH:/sbin

die() {
	echo $@
	exit 1
}

showUsage() {
	die "$0 {start|stop|restart|status} [prefix]"
}

dumpKeys() {
	echo "Enable_byte Volume_byte"
}

setupMixer() {
	eval $(dumpKeys | tdb get Microphone)
	micEnable=$Enable_byte
	micVolume=$Volume_byte
	eval $(dumpKeys | tdb get Speaker)
	speakerEnable=$Enable_byte
	speakerVolume=$Volume_byte

	mixer=$prefix/bin/mixer
	if [ "$micEnable" = "0" ] || [ "$micVolume" = "0" ]; then
		$mixer boost 0
		$mixer mic 0
		$mixer igain 0	
	else
		eval $(pibinfo Peripheral)
		if [ "$EchoCanceller" != "0" ]; then
			$mixer boost 0
		else
			$mixer boost 30
		fi

		# mapping from 100 ~ 10 to 100 ~ 44.
		micVolume=$(( ($micVolume - 10 ) * 56 / 90 + 44 ))

		$mixer mic 100
		$mixer igain $(( $micVolume * 0x100 + $micVolume ))
	fi

	if [ "$speakerEnable" = 0 ] || [ "$speakerVolume" = "0" ] ; then
		$mixer pcm2 0
		$mixer pcm 0
		$mixer vol 0
	else
		# mapping from 100 ~ 10 to 100 ~ 72.
		speakerVolume=$(( ($speakerVolume- 10 ) * 28 / 90 + 72 ))

		$mixer pcm 0x4A4A
		$mixer pcm2 $(( $speakerVolume * 0x100 + $speakerVolume ))
		$mixer vol $(( $speakerVolume * 0x100 + $speakerVolume ))
	fi
}

start() {
	! pids=$(pidof $daemon) || die "$daemon($pids) is already running."
	echo -n "Startting $daemon... "
	[ -x $binary ] || die "$binary is not a valid application"
	export LD_LIBRARY_PATH=$prefix/lib
	setupMixer
	$binary > /dev/null 2> /dev/null &
	echo "ok."
}

reload() {
	echo -n "Reloading $daemon... "
	export LD_LIBRARY_PATH=$prefix/lib
	setupMixer
	echo "ok."
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

conf=$prefix/etc/$daemon.conf
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
		start
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
