#!/bin/sh

daemon=snapshotd
PATH=$PATH:/sbin

die() {
	echo $@
	exit 1
}

showUsage() {
	die "$0 {start|stop|restart|status} [prefix]"
}

dumpKeys() {
	echo -n "\
Enable_byte
ToFTP_byte
ToSMTP_byte
"
}

importSettings() {
	eval $(dumpKeys | tdb get Snapshot)
	enable=$Enable_byte
	export SS_TO_FTP=$ToFTP_byte
	export SS_TO_SMTP=$ToSMTP_byte
}

start() {
	! pids=$(pidof $daemon) || die "$daemon($pids) is already running."

	echo -n "Startting $daemon... "
	[ -x $binary ] || die "$binary is not a valid application"
	importSettings

	export LD_LIBRARY_PATH=$prefix/lib
	if [ $enable -eq 0 ]; then
		echo "disabled."
	else
		if [ "$1" = 'nowait' ]; then
			$binary > /dev/null 2> /dev/null &
		else
			( sleep 5 && $binary > /dev/null 2> /dev/null & ) &
		fi
	fi
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
		start nowait
	;;
	status)
		status
	;;
	*)
		showUsage
	;;
esac

exit 0
