#!/bin/sh

app=tz_dst
PATH=$PATH:/sbin

die() {
	echo $@
	exit 1
}

showUsage() {
	die "$0 {start|stop|restart} [prefix]"
}

start() {
	echo -n "Startting $app... "
	[ -x $binary ] || die "$binary is not a valid application"
	export LD_LIBRARY_PATH=$prefix/lib
	$binary > /dev/null 2> /dev/null &
	# apply the time zone to local time
	echo "ok."
	sleep 1 
	setsystz > /dev/null 2> /dev/null
	echo "setsystz ok"
}

stop() {
	pids=$(pidof $app) || { echo "$app is not running." && return 1; }
	echo -n "Stopping $app... "
	kill $(echo $pids | cut -d' ' -f1)
	sleep 1
	pids=$(pidof $app) && killall -9 $app && sleep 1 && pids=$(pidof $app) && die "ng." || echo "ok."
}

action=$1
prefix=$2
end=$3

[ "$end" = "" ] && [ "$action" != "" ] || showUsage
[ "$prefix" = "" ] || [ -d "$prefix" ] || die "$prefix is not a valid directory"

conf=$prefix/etc/$app.conf
binary=$prefix/sbin/$app

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
	*)
		showUsage
	;;
esac

exit 0
